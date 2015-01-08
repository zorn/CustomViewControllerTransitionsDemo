#import <UIKit/UIKit.h>

@interface GrowAndFadeTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithDuration:(NSTimeInterval)duration scaleFactor:(CGFloat)scaleFactor isAppearing:(BOOL)isAppearing;

@property (nonatomic, assign, getter = isAppearing) BOOL appearing;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) CGFloat scaleFactor;

@end
