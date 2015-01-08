#import "UIViewController+TransitionAnimatorAdditions.h"

@implementation UIViewController (GrowAndFadeTransitionAnimator)

- (UIView *)zorn_viewForTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        NSString *key = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] == self ? UITransitionContextFromViewKey : UITransitionContextToViewKey;
        return [transitionContext viewForKey:key];
    } else {
        return self.view;
    }
#else
    return self.view;
#endif
}

@end
