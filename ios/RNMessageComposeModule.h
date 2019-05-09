#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>
#import <React/RCTEventEmitter.h>

@interface RNMessageComposeModule : RCTEventEmitter <RCTBridgeModule, MFMessageComposeViewControllerDelegate>

@end