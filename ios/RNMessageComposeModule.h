
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>
#import <React/RCTEventEmitter.h>

@interface RNMessageComposeModule : RCTEventEmitter <RCTBridgeModule, MFMessageComposeViewControllerDelegate>

@end
  
