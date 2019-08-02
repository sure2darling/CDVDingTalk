var exec = require('cordova/exec');

var exports = {
    coolMethod : function (arg0, success, error) {
        exec(success, error, 'CDVDingTalk', 'coolMethod', [arg0]);
    },
    registerAppDingTalk: function (arg0, success, error) {
        exec(success, error, 'CDVDingTalk', 'registerAppDingTalk', [arg0]);
    },

    openDingTalk: function (arg0, success, error) {
        exec(success, error, 'CDVDingTalk', 'openDingTalk', [arg0]);
    },
    shareTextToDingTalk: function (arg0, success, error) {
        exec(success, error, 'CDVDingTalk', 'shareTextToDingTalk', [arg0]);
    },
    shareImageToDingTalk: function (arg0, success, error) {
        exec(success, error, 'CDVDingTalk', 'shareImageToDingTalk', [arg0]);
    },
    shareWebToDingTalk: function (arg0, success, error) {
        exec(success, error, 'CDVDingTalk', 'shareWebToDingTalk', [arg0]);
    },
    ssoWithDingTalk: function (arg0, success, error) {
        exec(success, error, 'CDVDingTalk', 'ssoWithDingTalk', [arg0]);
    },
};

module.exports = exports
