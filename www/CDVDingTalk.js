var exec = require('cordova/exec');

var exports = {
    coolMethod : function (arg0, success, error) {
        exec(success, error, 'CDVDingTalk', 'coolMethod', [arg0]);
    },
};

module.exports = exports
