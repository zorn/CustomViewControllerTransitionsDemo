#import "BaseViewController.h"
#import "GrowAndFadeTransitionAnimator.h"

@interface BaseViewController () <UIViewControllerTransitioningDelegate>
@end

@implementation BaseViewController

#pragma mark - UIViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"launchModal"]) {
        UIViewController *vc = segue.destinationViewController;
        vc.modalPresentationStyle = UIModalPresentationCustom;
        vc.transitioningDelegate = self;
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    GrowAndFadeTransitionAnimator *animator = [[GrowAndFadeTransitionAnimator alloc] init];
    animator.appearing = YES;
    return animator;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    GrowAndFadeTransitionAnimator *animator = [[GrowAndFadeTransitionAnimator alloc] init];
    animator.appearing = NO;
    return animator;
}


@end
