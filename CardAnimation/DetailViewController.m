//
//  DetailViewController.m
//  CardAnimation
//
//  Created by LaNet on 19/07/19.
//  Copyright © 2019 LaNet. All rights reserved.
//

#import "DetailViewController.h"
#import "CustomTransition.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
@interface DetailViewController ()
{
    CustomTransition *transition;
    UIViewPropertyAnimator *animator;
    CGFloat animationProgress;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    instantPanGesture *pan = [[instantPanGesture alloc]initWithTarget:self action:@selector(panGesture:)];
    [self.btnDismiss addGestureRecognizer:pan];
    animationProgress = 0.0;
}

// UIPanGestureRecognizer
-(void)panGesture:(UIPanGestureRecognizer *)gesture
{
    CGPoint point = [gesture translationInView:self.btnDismiss];
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        [self  shrinkAnimation];
        animationProgress = animator.fractionComplete;
        [animator pauseAnimation];
    }
    else if(gesture.state == UIGestureRecognizerStateChanged)
    {
        CGFloat fraction = point.y / 100;
        // fractionComplete the percentage of animation progress
        animator.fractionComplete = fraction + animationProgress;
        // when animation progress > 99%, stop and start the dismiss transition
        if (animator.fractionComplete > 0.99)
        {
            _lblText.hidden = true;
            _img_height.constant = 380;
            [animator stopAnimation:true];
            self.view.layer.cornerRadius = 20;
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }
    else if(gesture.state == UIGestureRecognizerStateEnded)
    {
        if (animator.fractionComplete == 0){
            [animator stopAnimation:true];
            _lblText.hidden = true;
            _img_height.constant = 380;
            self.view.layer.cornerRadius = 20;
           [self dismissViewControllerAnimated:true completion:nil];
        }
        else
        {
            [animator setReversed:true];
                [animator continueAnimationWithTimingParameters:nil durationFactor:0];
        }
    }
}

// animation for gesture
-(void)shrinkAnimation
{
    animator = [[UIViewPropertyAnimator alloc]initWithDuration:1.0 curve:UIViewAnimationCurveEaseOut animations:^{
        self.view.transform = CGAffineTransformMakeScale(0.85, .85);
        
        self.view.layer.cornerRadius = 20;
    }];
    [animator startAnimation];
}
@end

