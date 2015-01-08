#import "GrowAndFadeTransitionAnimator.h"
#import "UIViewController+TransitionAnimatorAdditions.h"

static NSTimeInterval const kDefaultDuration = 0.3;
static CGFloat const kDefaultInitailScaleFactor = 0.80;
static CGFloat const kDefaultFinalScaleFactor = 1.0;

@implementation GrowAndFadeTransitionAnimator

- (instancetype)initWithDuration:(NSTimeInterval)duration scaleFactor:(CGFloat)scaleFactor isAppearing:(BOOL)isAppearing
{
    self = [super init];
    if (self) {
        _duration = duration;
        _scaleFactor = scaleFactor;
        _appearing = isAppearing;
    }
    return self;
}

- (id)init
{
    return [self initWithDuration:kDefaultDuration scaleFactor:kDefaultInitailScaleFactor isAppearing:YES];
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [fromVC zorn_viewForTransitionContext:transitionContext];
    UIView *toView = [toVC zorn_viewForTransitionContext:transitionContext];
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromVC];

    if (self.appearing) {
        
        toView.frame = initialFrame;
        toView.transform = CGAffineTransformMakeScale(self.scaleFactor, self.scaleFactor);
        toView.alpha = 0.0;
        [containerView addSubview:toView];
        
        [UIView animateWithDuration:duration animations: ^{
            toView.transform = CGAffineTransformMakeScale(kDefaultFinalScaleFactor, kDefaultFinalScaleFactor);
            toView.alpha = 1.0;
        } completion: ^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    } else {

        toView.frame = initialFrame;
        fromView.frame = initialFrame;
        fromView.transform = CGAffineTransformMakeScale(kDefaultFinalScaleFactor, kDefaultFinalScaleFactor);

        [containerView addSubview:toView];
        [containerView sendSubviewToBack:toView];
        
        [UIView animateWithDuration:duration animations: ^{
            fromView.transform = CGAffineTransformMakeScale(self.scaleFactor, self.scaleFactor);
            fromView.alpha = 0.0;
        } completion: ^(BOOL finished) {
            [fromView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}


@end
