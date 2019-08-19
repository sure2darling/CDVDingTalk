/********* CDVDingTalk.m Cordova Plugin Implementation *******/

#import "CDVDingTalk.h"

@implementation CDVDingTalk

// 初始化插件注册
- (void)pluginInitialize {
    [DTOpenAPI registerApp:@"dingoallfvu56vmxbf8dgn"];
     NSString* appId = [[self.commandDelegate settings] objectForKey:@"dingoallfvu56vmxbf8dgn"];
        if (appId){
            [DTOpenAPI registerApp: appId];
        }
}
// 打开钉钉
- (void)openDingTalk:(CDVInvokedUrlCommand*)command
{
    NSLog(@"openDingTalk: %@", @([DTOpenAPI openDingTalk]));
}

// 分享
- (void)shareTextToDingTalk:(CDVInvokedUrlCommand*)command
{
    DTSendMessageToDingTalkReq *sendMessageReq = [[DTSendMessageToDingTalkReq alloc] init];

    DTMediaMessage *mediaMessage = [[DTMediaMessage alloc] init];

    DTMediaTextObject *textObject = [[DTMediaTextObject alloc] init];
    textObject.text = @"Hi DingTalk.";

    mediaMessage.mediaObject = textObject;
    sendMessageReq.message = mediaMessage;

    BOOL result = [DTOpenAPI sendReq:sendMessageReq];
    if (result)
    {
        NSLog(@"Text 发送成功.");
    }
    else
    {
        NSLog(@"Text 发送失败.");
    }
}

// 分享图片
- (void)shareImageToDingTalk:(CDVInvokedUrlCommand*)command
{
    DTSendMessageToDingTalkReq *sendMessageReq = [[DTSendMessageToDingTalkReq alloc] init];

    DTMediaMessage *mediaMessage = [[DTMediaMessage alloc] init];

    DTMediaImageObject *imageObject = [[DTMediaImageObject alloc] init];
    imageObject.imageData = [NSData data];
    imageObject.imageURL = @"https://img.alicdn.com/tps/TB1dagdIpXXXXc5XVXXXXXXXXXX.jpg";

    mediaMessage.mediaObject = imageObject;
    sendMessageReq.message = mediaMessage;

    BOOL result = [DTOpenAPI sendReq:sendMessageReq];
    if (result)
    {
        NSLog(@"Image 发送成功.");
    }
    else
    {
        NSLog(@"Image 发送失败.");
    }
}

// 分享网址
- (void)shareWebToDingTalk:(CDVInvokedUrlCommand*)command
{
    DTSendMessageToDingTalkReq *sendMessageReq = [[DTSendMessageToDingTalkReq alloc] init];

    DTMediaMessage *mediaMessage = [[DTMediaMessage alloc] init];
    DTMediaWebObject *webObject = [[DTMediaWebObject alloc] init];
    webObject.pageURL = @"http://www.dingtalk.com/";

    mediaMessage.title = @"钉钉";

    mediaMessage.thumbURL = @"https://static.dingtalk.com/media/lALOGp__Tnh4_120_120.png";

    // Or Set a image data which less than 32K.
    // mediaMessage.thumbData = UIImagePNGRepresentation([UIImage imageNamed:@"open_icon"]);

    mediaMessage.messageDescription = @"钉钉，是一个工作方式。为企业量身打造统一办公通讯平台";
    mediaMessage.mediaObject = webObject;
    sendMessageReq.message = mediaMessage;

    BOOL result = [DTOpenAPI sendReq:sendMessageReq];
    if (result)
    {
        NSLog(@"Link 发送成功.");
    }
    else
    {
        NSLog(@"Link 发送失败.");
    }
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
    }
    else {
        NSLog(@"授权登录 发送失败.");
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
    }
    else {
        NSLog(@"ErrorCode: %@", @(resp.errorCode));
        NSLog(@"ErrorMsg: %@", resp.errorMessage);
    }
}

@end
