/********* CDVDingTalk.m Cordova Plugin Implementation *******/

#import "CDVDingTalk.h"

@implementation CDVDingTalk

// 初始化插件注册
- (void)pluginInitialize {
 NSString* appId = [[self.commandDelegate settings] objectForKey:@"dingtalkappid"];
    if (appId){
        self.dingtalkAppId = appId;
        [DTOpenAPI registerApp: appId];
    }
  NSLog(@"cordova-plugin-wechat has been initialized APP_ID: %@.", appId);
}

// 打开钉钉
- (void)openDingTalk:(CDVInvokedUrlCommand*)command
{
    NSLog(@"openDingTalk: %@", @([DTOpenAPI openDingTalk]));
}

// 第三方登录
- (void)ssoWithDingTalk:(CDVInvokedUrlCommand*)command
{
    DTAuthorizeReq *authReq = [DTAuthorizeReq new];
    NSString *bundlID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    authReq.bundleId = bundlID;
    BOOL result = [DTOpenAPI sendReq:authReq];
    if (result) {
        NSLog(@"授权登录 发送成功.");
         self.currentCallbackId = command.callbackId;
    }
    else {
        NSLog(@"授权登录 发送失败.");
        [self failWithCallbackID:command.callbackId withMessage:@"发送请求失败"];
    }
}

- (void)handleOpenURL:(NSNotification *)notification
{
    NSLog(@"打开URL==========");
    NSURL* url = [notification object];
    NSLog(@"11111  %@",url);
    if ([url isKindOfClass:[NSURL class]] && [url.scheme isEqualToString:@"dingoallfvu56vmxbf8dgn"])
    {
        NSLog(@"222222  %@",[DTOpenAPI handleOpenURL:url delegate:self]?@"YES":@"NO");
//        [DTOpenAPI handleOpenURL:url delegate:self];
    }
}

- (void)onReq:(DTBaseReq *)req {
     NSLog(@"-------------------%@", req);
}

- (void)onResp:(DTBaseResp *)resp {
    NSLog(@"1---------------------------------------111");
    if ([resp isKindOfClass:[DTAuthorizeResp class]]) {
        DTAuthorizeResp *authResp = (DTAuthorizeResp *)resp;
        NSString *accessCode = authResp.accessCode;
        NSLog(@"accessCode: %@, errorCode: %@, errorMsg: %@", accessCode, @(resp.errorCode), resp.errorMessage);

         CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:accessCode];
         [self.commandDelegate sendPluginResult:commandResult callbackId:self.currentCallbackId];
    }
    else {
        NSLog(@"ErrorCode: %@", @(resp.errorCode));
        NSLog(@"ErrorMsg: %@", resp.errorMessage);

        [self failWithCallbackID:self.currentCallbackId withMessage:resp.errorMessage];
    }
    self.currentCallbackId = nil;
}



- (void)successWithCallbackID:(NSString *)callbackID
{
    [self successWithCallbackID:callbackID withMessage:@"OK"];
}

- (void)successWithCallbackID:(NSString *)callbackID withMessage:(NSString *)message
{
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
    [self.commandDelegate sendPluginResult:commandResult callbackId:callbackID];
}

- (void)failWithCallbackID:(NSString *)callbackID withError:(NSError *)error
{
    [self failWithCallbackID:callbackID withMessage:[error localizedDescription]];
}

- (void)failWithCallbackID:(NSString *)callbackID withMessage:(NSString *)message
{
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:message];
    [self.commandDelegate sendPluginResult:commandResult callbackId:callbackID];
}


@end

