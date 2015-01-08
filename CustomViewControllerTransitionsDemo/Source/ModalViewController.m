#import "ModalViewController.h"

@implementation ModalViewController

#pragma mark - UIViewController

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"-[%@ viewDidAppear:]", NSStringFromClass([self class]));
}

#pragma mark - Actions

- (IBAction)dismissModal:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
