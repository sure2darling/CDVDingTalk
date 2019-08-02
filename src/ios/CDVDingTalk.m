/********* CDVDingTalk.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface CDVDingTalk : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation CDVDingTalk

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    NSLog(@"消息测试-----");
}

@end
