const express = require('express');
const session = require('express-session');
const passport = require('passport');
const path = require('path')
const pool = require('./db');
const routes = require('./routes');

require('./auth');
const app = express();
const PORT = process.env.PORT || 3000;

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));  
  
app.use(express.urlencoded({ extended: true }));
app.use(express.json());  

app.use(express.static(path.join(__dirname, 'public')));

app.use(session({ 
    secret: 'secret-key-12345', 
    resave: false, 
    saveUninitialized: false,
    cookie: { maxAge: 1000 * 60 * 60 * 24 }
}));

app.use(passport.initialize());
app.use(passport.session());

app.use((req, res, next) => {
    res.locals.user = req.user || null;
    res.locals.isAuthenticated = req.isAuthenticated();
    next();
});

app.use('/', routes);
app.use((req, res) => {
    res.status(404).send('Pagina negasita!');
});

app.listen(PORT, () => {
 console.log(`Server is running on http://localhost:${PORT}`);
});