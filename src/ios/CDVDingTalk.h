/********* CDVDingTalk.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <DTShareKit/DTOpenKit.h>

@interface CDVDingTalk:CDVPlugin <DTOpenAPIDelegate> {
  // Member variables go here.
}
@property (nonatomic, strong) NSString *currentCallbackId;
@property (nonatomic, strong) NSString *dingtalkAppId;
- (void)registerDingTalk:(CDVInvokedUrlCommand*)command;
- (void)openDingTalk:(CDVInvokedUrlCommand*)command;
- (void)shareTextToDingTalk:(CDVInvokedUrlCommand*)command;
- (void)shareImageToDingTalk:(CDVInvokedUrlCommand*)command;
- (void)shareWebToDingTalk:(CDVInvokedUrlCommand*)command;
- (void)ssoWithDingTalk:(CDVInvokedUrlCommand*)command;
@end