'use strict';
require('font-awesome/css/font-awesome.css');
require('./index.html');
// Styles
require('./styles/commons.scss');
require('./styles/font-face.css');
require('./styles/material.teal-blue.min.css');

//Js <wont work>
require('./js/material.min.js');

// Elm stuff
var Elm = require('../src/web/Main.elm');
var mountNode = document.getElementById('main');
// .embed() can take an optional second argument. This would be an object describing the data we need to start a program, i.e. a userID or some token
var app = Elm.Main.embed(mountNode);
