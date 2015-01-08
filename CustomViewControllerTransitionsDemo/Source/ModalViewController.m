#import "ModalViewController.h"

@implementation ModalViewController

- (IBAction)dismissModal:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
