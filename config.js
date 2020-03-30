var allConfigs = require('./config.secrets.json');
var firebaseconfig = allConfigs.firebase;
var config = allConfigs.bot;
config.token = process.env.AUTH_TOKEN

exports.config = config;
exports.firebaseconfig = firebaseconfig;
