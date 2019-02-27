
#import "RNMessageComposeModule.h"

@implementation RNMessageComposeModule

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
        //composeVC.messageComposeDelegate = [self getRootVC].delegate;

        // Configure the fields of the interface.
        //composeVC.recipients = @[@"14085551212"];
        composeVC.body = body;

        // Present the view controller modally.
        [[self getRootVC] presentViewController:composeVC animated:YES completion:nil];
    }
}

@end