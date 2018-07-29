var allConfigs = require('./config.secrets.json');
var firebaseconfig = allConfigs.firebase;
var config = allConfigs.bot;

exports.config = config;
exports.firebaseconfig = firebaseconfig;
