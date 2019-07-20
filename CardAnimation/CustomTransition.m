//
//  CustomTransition.m
//  CardAnimation
//
//  Created by LaNet on 19/07/19.
//  Copyright © 2019 LaNet. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "CustomTransition.h"

@implementation CustomTransition
@synthesize startingFrame,destinationFrame,duration;

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *vw = transitionContext.containerView;
    
    if([self.transitionMode isEqualToString:@"present"])
    {
        UIView *presentview = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGRect intialFrame = self.startingFrame;
        CGRect finalFrame = self.destinationFrame;
        CGFloat scalex = intialFrame.size.width/finalFrame.size.width;
        CGFloat scaley = intialFrame.size.height/finalFrame.size.height;
        presentview.frame = destinationFrame;
        presentview.transform = CGAffineTransformMakeScale(scalex, scaley);
        presentview.center = CGPointMake(CGRectGetMidX(intialFrame), CGRectGetMidY(intialFrame));
        presentview.clipsToBounds = TRUE;
        presentview.layer.cornerRadius = 20;
        [vw addSubview:presentview];
        [vw bringSubviewToFront:presentview];
        [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            presentview.transform = CGAffineTransformIdentity;
            presentview.layer.cornerRadius = 0;
            presentview.frame= CGRectMake(0, 0, vw.frame.size.width, vw.frame.size.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
        }];
        
    }
    else
    {
        
            UIView *returnview = [transitionContext viewForKey:UITransitionContextFromViewKey];
            CGRect intialFrame = self.destinationFrame;
            CGRect finalFrame = self.startingFrame;
            CGFloat scalex = finalFrame.size.width/intialFrame.size.width;
            CGFloat scaley = finalFrame.size.height/intialFrame.size.height;
            [returnview setClipsToBounds:true];
            [vw addSubview:returnview];
            [vw bringSubviewToFront:returnview];
            [vw sendSubviewToBack:vw];
            [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                returnview.transform = CGAffineTransformMakeScale(scalex, scaley);
                returnview.layer.cornerRadius = 20;
                returnview.frame = finalFrame;
            } completion:^(BOOL finished) {
                
                [returnview removeFromSuperview];
                [transitionContext completeTransition:finished];
            }];
        
    }
    
}
@end
