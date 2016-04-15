var express = require('express'),
    app = express(),
    http = require('http'),
    server = http.createServer(app),
    io = require('socket.io').listen(server),
    bs = require('binary-search');


var mysql = require("mysql");

// First you need to create a connection to the db
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "admin",
    database: "chatdb2"
});
con.connect(function(err) {
    if (err) {
        console.log('Error connecting to Db');
        return;
    }
    console.log('Connection established');
});

// usernames which are currently connected to the chat
var usernames = [];
var rooms = [];





io.sockets.on('connection', function(socket) {
    // when the client emits 'adduser', this listens and executes
    socket.on('adduser', function(givenName, user_id) {
        // store the username in the socket session for this client
        socket.username = givenName;
        socket.fid = user_id;
        // store the room name in the socket session for this client


        // add the client's username to the global list
        var user_data = {
            fid: user_id,
            fname: givenName
        };
        console.log('[LOG] welcome fid: ' + socket.fid);
        con.query('select fid from user where fid=\'' + user_id + '\'', function(err, rows) {
            console.log('[LOG] USER CHECK username: ' + givenName);
            if (err) {
                console.log(err);
                console.log('[ERR]SELECTING ERROR!');
            } else if (rows.length == 0) {
                console.log('[LOG] USER NOT FOUND IN USER TABLE, INSERTING USER....');
                con.query('INSERT INTO user SET ?', user_data, function(err, res) {
                    if (err) console.log(err);
                    else console.log('username: ' + givenName + ' fid= ' + user_id + 'has already added!');
                });
                //update joinroom
                console.log('[LOG] JOIN USER TO PUBLIC ROOM...');
                var joinroom_data = {
                    fid: user_id,
                    rid: '1'
                };
                con.query('INSERT INTO joinroom SET ?', joinroom_data, function(err, res) {
                    if (err) console.log(err);
                    else {
                        console.log('[LOG] USER username: ' + socket.username + ' JOIN IN *PUBLIC ROOM');

                    }
                });

            } else console.log('[LOG] USER HAS ALREADY ADDED');


        });
        socket.room = 'public';
        socket.rid = '1';
        socket.join('public');
        socket.emit('updatechat', 'SERVER', 'you have connected to ' + socket.room);
        // echo to room 1 that a person has connected to their room
        socket.broadcast.to('public').emit('updatechat', 'SERVER', givenName + ' has connected');
        refreshListRoom();
        // socket.emit('updaterooms', rooms, socket.room);

    });

    //how to get chat before leaving
    // SELECT msg FROM(SELECT B.fid, B.rid, B.jointime, B.leavetime FROM(SELECT * FROM room where rname = 'dd') as A, joinroom as B where B.fid = '1386936317999356'
    //     and A.rid = B.rid) as C, message WHERE C.rid = message.rid and message.senttime > C.jointime and message.senttime < C.leavetime
    //how to get chat after leaving
    // SELECT msg FROM(SELECT B.fid, B.rid, B.jointime, B.leavetime FROM(SELECT * FROM room where rname = 'dd') as A, joinroom as B where B.fid = '1386936317999356'
    //     and A.rid = B.rid) as C, message WHERE C.rid = message.rid and message.senttime > C.jointime and message.senttime > C.leavetime

    socket.on('getchat', function(user_id) {

        con.query('SELECT msg FROM(SELECT B.fid, B.rid, B.jointime, B.leavetime FROM(SELECT * FROM room where rname = \'' + socket.room + '\') as A, joinroom as B where B.fid = \'' + user_id +
            '\' and A.rid = B.rid) as C, message WHERE C.rid = message.rid and message.senttime > C.jointime and message.senttime < C.leavetime',
            function(err, rows) {
                if (err) console.log(err);
                else {
                    console.log(rows);

                }

            });

    });

    // when the client emits 'sendchat', this listens and executes
    socket.on('sendchat', function(user_id, data) {

        con.query('SELECT rid FROM room WHERE rname=\'' + socket.room + '\'', function(err, rows) {
            if (err) console.log(err);
            else if (rows.length == 0) console.log('rid not found !');
            else {

                console.log(rows);
                console.log('rid of ' + socket.room + ' is ' + rows[0].rid);
            }

            var chat_data = {
                fid: user_id,
                rid: rows[0].rid,
                msg: data
            };
            con.query('INSERT INTO message SET ?', chat_data, function(err, res) {
                if (err) console.log(err);
                console.log(res);
            });

        });
        //tell all client
        console.log('[LOG] SEND CHAT TO ' + socket.room + ' SENDER : ' + socket.username + ' msg: ' + data);
        io.sockets.in(socket.room).emit('updatechat', socket.username, data);

    });

    socket.on('addRoom', function(user_id, newroom_name) {
        console.log('[LOG] ADD NEW ROOM INTO ROOM TABLE');
        con.query('INSERT INTO room SET ?', {
            rname: newroom_name
        }, function(err, rows) {
            if (err) console.log(err);
            else {
                console.log('[LOG] rid: ' + rows.insertId + ' rname: ' + newroom_name + ' is added');
            }
        });
        refreshListRoom('all');
        //  console.log('<----------- end addRoom --------->');
    });
    //UPDATE joinroom SET leavetime = CURRENT_TIMESTAMP WHERE fid = '1386936317999356' and rid='2'
    socket.on('switchRoom', function(user_id, room) {
        var oldroom = socket.room;
        var newroom = room.rname;
        var newroom_id = room.rid;

        console.log('[LOG] SWITCH TO rname: ' + newroom + ' FROM rname: ' + oldroom);
        //check if join new room for the first time
        //SELECT joinroom.fid,joinroom.rid,room.rname,joinroom.jointime,joinroom.leavetime from joinroom,room where room.rname = 'zz' and joinroom.rid = room.rid and joinroom.fid = '1034807556602456'
        con.query('SELECT joinroom.fid,joinroom.rid,room.rname,joinroom.jointime,joinroom.leavetime from joinroom,room where room.rname = \'' + newroom + '\' and joinroom.rid = room.rid and joinroom.fid = \'' + user_id + '\'',
            function(err, rows) {
                if (err) console.log(err);
                else if (rows.length == 0) {
                    //first time insert join room row
                    console.log('[LOG] USER DID NOT JOIN IN BEFORE \n[LOG] INSERTING user: ' + socket.username + ' TO rname: ' + newroom);
                    var joinroom_data = {
                        fid: user_id,
                        rid: newroom_id

                    };

                    con.query('INSERT INTO joinroom SET ?', joinroom_data, function(err, res) {
                        if (err) console.log(err);

                    });

                }

                //has joined before,so instantly update leavetime
                console.log('[LOG] UPDATING LEAVETIME user: ' + socket.username);
                con.query('SELECT rid FROM room WHERE rname=\'' + oldroom + '\'', function(err, rows) {
                    if (err) console.log(err);
                    else if (rows.length == 0) console.log('[ERR] rid not found !');
                    else {
                        // console.log(rows);
                        // console.log('old roomm: ' + oldroom + ' rid : ' + rows[0].rid);
                        con.query('UPDATE joinroom SET leavetime = CURRENT_TIMESTAMP WHERE fid = \'' + user_id + '\' and rid=\'' + rows[0].rid + '\'', function(err, res) {
                            if (err) console.log(err);
                            else console.log('[LOG] DONE UPDATING');
                        });
                    }

                    //  console.log('[LOG] SOCKET SETTING AND EMIT CHAT TO THE OTHERS');
                    socket.leave(oldroom);
                    socket.join(newroom);
                    socket.room = newroom;
                    socket.rid = newroom_id;
                    console.log('[LOG] GET MESSAGES....');
                    //socket.emit('updatechat', 'SERVER', 'you have connected to ' + newroom);
                    con.query('SELECT fname,msg FROM user,(SELECT B.fid, B.rid, B.jointime, B.leavetime FROM(SELECT * FROM room where rname = \'' + socket.room + '\') as A, joinroom as B where B.fid = \'' + user_id +
                        '\' and A.rid = B.rid) as C, message WHERE C.rid = message.rid and message.senttime > C.jointime and message.senttime < C.leavetime and user.fid = message.fid ORDER BY message.senttime  ASC ',
                        function(err, read_msg) {
                            if (err) console.log(err);
                            else if (rows.length == 0) console.log('[LOG] NO MESSAGE');
                            else {

                                con.query('SELECT fname,msg FROM user,(SELECT B.fid, B.rid, B.jointime, B.leavetime FROM(SELECT * FROM room where rname = \'' + socket.room + '\') as A, joinroom as B where B.fid = \'' + user_id +
                                    '\' and A.rid = B.rid) as C, message WHERE C.rid = message.rid and message.senttime > C.jointime and message.senttime > C.leavetime and user.fid = message.fid ORDER BY message.senttime  ASC ',
                                    function(err, unread_msg) {
                                        if (err) console.log(err);
                                        else if (rows.length == 0) console.log('[LOG] NO MESSAGE');
                                        else {
                                            socket.emit('getoldchat', read_msg, unread_msg);
                                        }

                                    });

                            }

                        });

                    //  socket.emit('updatechat', 'SERVER', ' <--UNREAD-->');
                    // sent message to OLD room
                    //  socket.broadcast.to(oldroom).emit('updatechat', 'SERVER', socket.username + ' has left this room');
                    // update socket session room title

                    //  socket.broadcast.to(newroom).emit('updatechat', 'SERVER', socket.username + ' has joined this room');
                    refreshListRoom();

                    //get old chat when switch to new room


                });

            });





    });


    // when the user disconnects.. perform this
    socket.on('leaveroom', function(rid) {
        console.log('[LOG] LEAVE ROOM :' + rid);
        socket.leave('public');
        socket.join('public');
        socket.room = 'public';
        socket.rid = '1';
        con.query('DELETE FROM joinroom WHERE fid = \''+socket.fid+'\' and rid = \''+rid+'\'', function(err, roomdata) {
            if (err) console.log(err);
            else {
              console.log('[LOG] DELETE COMPLETED');
              refreshListRoom();
            }
          });
          socket.emit('updatechat', 'SERVER', 'you have left from ' + socket.room);
    });

    socket.on('onlyrefreshroom',function(){
        refreshListRoom();

    });

    function refreshListRoom(option) {

        //console.log('SELECT rname FROM room,joinchat WHERE joinchat.fid = \'' + user_id + '\' and room.rid = joinchat.rid');
        con.query('SELECT rid,rname FROM room ORDER BY `rid` ASC', function(err, roomdata) {
            if (err) console.log(err);
            else if (roomdata.length == 0) console.log('[LOG] YOU ARE NOT IN ANY ROOM');
            else {

                con.query('SELECT fid,rid FROM joinroom WHERE fid=\'' + socket.fid + '\' ORDER BY `rid` ASC', function(err, joinroomdata) {

                    //console.log('TEST BINARYSEARCH: '+bs([1, 2, 3, 4], 3, function(a, b) { return a - b; }));

                    //  var count = 0;
                    rooms = [];
                    joinrooms_id = [];
                    for (var i = 0; i < joinroomdata.length; i++) {
                        joinrooms_id.push(joinroomdata[i].rid);

                    }
                    for (var i = 0; i < roomdata.length; i++) {
                        //    count++;
                        //because rooms are ordered
                        if (bs(joinrooms_id, roomdata[i].rid, function(a, b) {
                                return a - b;
                            }) >= 0) {
                            rooms.push({
                                rid: roomdata[i].rid,
                                rname: roomdata[i].rname,
                                isjoin: true
                            });

                        } else
                            rooms.push({
                                rid: roomdata[i].rid,
                                rname: roomdata[i].rname,
                                isjoin: false
                            });

                    }
                    console.log('[LOG] REFRESH LIST OF ROOMS AND EMIT UPDATING ROOM TO THE OTHERS');
                    console.log(rooms);
                    //  console.log('[LOG] COUNT: ' + count);
                    socket.emit('updaterooms', rooms, {
                        rid: socket.rid,
                        rname: socket.room
                    });

                    if(option == 'all')
                    socket.broadcast.emit('callupdaterooms');
                });




            }


        });
        //console.log('<------end request room list -------->');
    }

    function binaryIndexOf(searchElement) {
        'use strict';

        var minIndex = 0;
        var maxIndex = this.length - 1;
        var currentIndex;
        var currentElement;

        while (minIndex <= maxIndex) {
            currentIndex = (minIndex + maxIndex) / 2 | 0;
            currentElement = this[currentIndex];

            if (currentElement < searchElement) {
                minIndex = currentIndex + 1;
            } else if (currentElement > searchElement) {
                maxIndex = currentIndex - 1;
            } else {
                return currentIndex;
            }
        }

        return -1;
    }
});



//facebook login Passport
var passport = require('passport');
var Strategy = require('passport-facebook').Strategy;
var check = require('connect-ensure-login');

// Configure the Facebook strategy for use by Passport.
//
// OAuth 2.0-based strategies require a `verify` function which receives the
// credential (`accessToken`) for accessing the Facebook API on the user's
// behalf, along with the user's profile.  The function must invoke `cb`
// with a user object, which will be set at `req.user` in route handlers after
// authentication.
passport.use(new Strategy({
        clientID: 1549122352049988,
        clientSecret: '221c989545ba03147c82812eceaa8b30',
        callbackURL: 'http://localhost:8080/login/facebook/return',
        profileFields: ['id', 'name', 'email', 'birthday', 'displayName', 'about', 'gender', 'profileUrl', 'picture.type(large)']

    },
    function(accessToken, refreshToken, profile, cb) {
        // In this example, the user's Facebook profile is supplied as the user
        // record.  In a production-quality application, the Facebook profile should
        // be associated with a user record in the application's database, which
        // allows for account linking and authentication with other identity
        // providers.

        return cb(null, profile);
    }));


// Configure Passport authenticated session persistence.
//
// In order to restore authentication state across HTTP requests, Passport needs
// to serialize users into and deserialize users out of the session.  In a
// production-quality application, this would typically be as simple as
// supplying the user ID when serializing, and querying the user record by ID
// from the database when deserializing.  However, due to the fact that this
// example does not have a database, the complete Twitter profile is serialized
// and deserialized.
passport.serializeUser(function(user, cb) {
    cb(null, user);
});

passport.deserializeUser(function(obj, cb) {
    cb(null, obj);
});

// Configure view engine to render EJS templates.
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

// Use application-level middleware for common functionality, including
// logging, parsing, and session handling.
app.use(require('morgan')('combined'));
app.use(require('cookie-parser')());
app.use(require('body-parser').urlencoded({
    extended: true
}));
app.use(require('express-session')({
    secret: 'keyboard cat',
    resave: true,
    saveUninitialized: true
}));

//static path specify
app.use(express.static("public"));
app.use('/bower_components', express.static(__dirname + '/bower_components'));
// Initialize Passport and restore authentication state, if any, from the
// session.
app.use(passport.initialize());
app.use(passport.session());

//socket routing
app.get('/chat', check.ensureLoggedIn('/login'), function(req, res) {
    res.render('chat', {
        user: req.user
    });
});
//login routes.
app.get('/',
    function(req, res) {
        res.render('home', {
            user: req.user
        });
    });

app.get('/login',
    function(req, res) {

        res.render('login');
    });

app.get('/login/facebook',
    passport.authenticate('facebook'));

app.get('/login/facebook/return',
    passport.authenticate('facebook', {
        failureRedirect: '/login'
    }),
    function(req, res) {
        res.redirect('/');
    });


app.get('/profile',
    check.ensureLoggedIn('/login'),
    function(req, res) {
        // console.dir(req.user);
        // console.log(req.user.photos[0].value);

        res.render('profile', {
            user: req.user
        });
    });

server.listen(8080);
