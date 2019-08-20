var exec = require('cordova/exec');

var exports = {
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
    ssoWithDingTalk: function (onSuccess, onError) {
        return exec(onSuccess, onError, "CDVDingTalk", "ssoWithDingTalk");
    },
};

module.exports = exports
