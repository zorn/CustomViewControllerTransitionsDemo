#import <UIKit/UIKit.h>

@interface UIViewController (GrowAndFadeTransitionAnimator)

// Workaround for iOS 7 / 8 issue: http://stackoverflow.com/a/25193675
- (UIView *)zorn_viewForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
