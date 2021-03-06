
#import "RNMessageComposeModule.h"

@implementation RNMessageComposeModule


- (NSArray<NSString *> *)supportedEvents {
    return @[@"messageComposeDidFinishWithResult"];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

- (UIViewController*) getRootVC {
    UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    while (root.presentedViewController != nil) {
        root = root.presentedViewController;
    }

    return root;
}

RCT_REMAP_METHOD(canSendText,
                 findEventsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    if ([MFMessageComposeViewController canSendText]) {
        NSDictionary *response = @{@"status":@YES};
        resolve(response);
    } else {
        NSError *error = nil;
        reject(@"messaging_is_not_available", @"Text messaging is not available", error);
    }
}

RCT_EXPORT_METHOD(show:(NSString *)body)
{
    if (![MFMessageComposeViewController canSendText]) {
       UIAlertController *alert = [UIAlertController
                       alertControllerWithTitle:@"Cannot Send Message"
                                        message:@"Text messaging is not available"
                                 preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okButton = [UIAlertAction
                         actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:okButton];
       [[self getRootVC] presentViewController:alert animated:YES completion:nil];
    } else {
        //RCTLogInfo(@"Show compose element %@ at %@");
        MFMessageComposeViewController* composeVC = [[MFMessageComposeViewController alloc] init];
        composeVC.messageComposeDelegate = self;

        // Configure the fields of the interface.
        //composeVC.recipients = @[@"14085551212"];
        composeVC.body = body;

        // Present the view controller modally.
        [[self getRootVC] presentViewController:composeVC animated:YES completion:nil];
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
       NSString *stringResult;
       switch(result) {
           case MessageComposeResultCancelled:
               stringResult = @"canceled";
           break;
           case MessageComposeResultSent:
               stringResult = @"sent";
           break;
           case MessageComposeResultFailed:
               stringResult = @"failed";
           break;
       }
       [self sendEventWithName:@"messageComposeDidFinishWithResult" body:@{@"result": stringResult}];
       // Check the result or perform other tasks.    // Dismiss the message compose view controller.
       [[self getRootVC] dismissViewControllerAnimated:YES completion:nil];
}

@end
