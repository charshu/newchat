var express = require('express'),
    app = express(),
    http = require('http'),
    server = http.createServer(app),
    io = require('socket.io').listen(server);
server.listen(8080);

var mysql = require("mysql");

// First you need to create a connection to the db
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "admin",
    database: "chatdb"
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

// rooms which are currently available in chat
var rooms = ['room1', 'room2', 'room3'];






io.sockets.on('connection', function(socket) {
    console.log(rooms);
    // when the client emits 'adduser', this listens and executes
    socket.on('adduser', function(username, user_id) {
        // store the username in the socket session for this client
        socket.username = username;
        // store the room name in the socket session for this client
        socket.room = '';
        // add the client's username to the global list
        usernames[username] = username;
        var user_data = {
            fid: user_id,
            fname: username
        };
        con.query('select fid from user where fid=\"?\"', user_id, function(err, rows) {
            console.log(rows);
            if (err) {
                console.log(err);
                console.log('Selecting problem !');
            } else if (rows.length == 0) {
                con.query('INSERT INTO user SET ?', user_data, function(err, res) {
                    if (err) {
                        console.log(err);
                        console.log('userID: ' + username + ' fid= ' + user_id + 'has already added!');
                    } else console.log('add userID: ' + username + ' fid= ' + user_id);
                });
            }
        });

        // send client to room 1
        // socket.join('room1');
        // echo to client they've connected
        socket.emit('updatechat', 'SERVER', 'you have connected to room1');
        // echo to room 1 that a person has connected to their room
        socket.broadcast.to('room1').emit('updatechat', 'SERVER', username + ' has connected to this room');
        console.log('room : ', reqListRoom(user_id));
        reqListRoom(user_id, null);

    });


    socket.on('listrooms', function(user_id) {

    });
    // when the client emits 'sendchat', this listens and executes
    socket.on('sendchat', function(data) {
        //connect db
        var chat_data = {
            sender: socket.username,
            message: data
        };
        con.query('INSERT INTO log SET ?', chat_data, function(err, res) {
            if (err) throw err;

            console.log('Last insert ID:', res.insertId);
        });

        // con.end(function(err) {
        //     // The connection is terminated gracefully
        //     // Ensures all previously enqueued queries are still
        //     // before sending a COM_QUIT packet to the MySQL server.
        // });

        // we tell the client to execute 'updatechat' with 2 parameters
        io.sockets.in(socket.room).emit('updatechat', socket.username, data);
    });

    socket.on('addRoom', function(user_id,newroom_name) {

        con.query('INSERT INTO room SET ?', {rname : newroom_name}, function(err, rows) {
            if (err) console.log(err);
            else{

              console.log('rid: '+rows.insertId +' rname: '+newroom_name + ' is added');

              var joinchat_data = {
                  fid:user_id,
                  rid:rows.insertId

              };
              con.query('INSERT INTO joinchat SET ?', joinchat_data, function(err, res) {
                  if (err) console.log(err);
                  else
                      console.log('admin join');
              });
              console.log("a room added!");

              reqListRoom(user_id,'');
            }

        });
        //joinchat db


        // io.sockets.emit('updateAddRooms', rooms);

    });

    socket.on('switchRoom', function(user_id,newroom) {
        socket.leave(socket.room);
        socket.join(newroom);
        socket.emit('updatechat', 'SERVER', 'you have connected to ' + newroom);
        // sent message to OLD room
        socket.broadcast.to(socket.room).emit('updatechat', 'SERVER', socket.username + ' has left this room');
        // update socket session room title
        socket.room = newroom;
        socket.broadcast.to(newroom).emit('updatechat', 'SERVER', socket.username + ' has joined this room');

    });


    // when the user disconnects.. perform this
    socket.on('disconnect', function() {
        // remove the username from global usernames list
        delete usernames[socket.username];
        // update list of users in chat, client-side
        io.sockets.emit('updateusers', usernames);
        // echo globally that this client has left
        socket.broadcast.emit('updatechat', 'SERVER', socket.username + ' has disconnected');
        socket.leave(socket.room);
    });
    function reqListRoom(user_id, newroom) {
        console.log('request room list !');
        console.log('user_id: ' + user_id);
        console.log('SELECT rname FROM room,joinchat WHERE joinchat.fid = \'' + user_id + '\' and room.rid = joinchat.rid');
        con.query('SELECT rname FROM room,joinchat WHERE joinchat.fid = \'' + user_id + '\'and room.rid = joinchat.rid', function(err, rows) {
            var listrooms = [];
            if (err) console.log(err);
            else if (rows.length == 0) console.log("You are not join in any rooms.");
            else {


                for (var i = 0; i < rows.length; i++) {
                    // console.log(rows[i].rname);
                    listrooms.push(rows[i].rname);

                }
                console.log(listrooms);
                if (newroom === '') {
                    socket.emit('updaterooms', listrooms, '');

                } else {
                    socket.emit('updaterooms', listrooms, newroom);
                }
            }
        });

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
        profileFields: ['id', 'name', 'email', 'birthday', 'displayName', 'about', 'gender', 'profileUrl', 'photos']

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
