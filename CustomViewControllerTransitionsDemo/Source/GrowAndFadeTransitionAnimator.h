#import <UIKit/UIKit.h>

@interface GrowAndFadeTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithDuration:(NSTimeInterval)duration initialScaleFactor:(CGFloat)initialScaleFactor finalScaleFactor:(CGFloat)finalScaleFactor isAppearing:(BOOL)isAppearing;

@property (nonatomic, assign, getter = isAppearing) BOOL appearing;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) CGFloat initialScaleFactor;
@property (nonatomic, assign) CGFloat finalScaleFactor;

@end
