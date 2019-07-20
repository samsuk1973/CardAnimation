//
//  CustomTransition.h
//  CardAnimation
//
//  Created by LaNet on 19/07/19.
//  Copyright © 2019 LaNet. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CoreGraphics/CGGeometry.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CustomTransition : NSObject<UIViewControllerAnimatedTransitioning>
@property  CGRect startingFrame;
@property  CGRect destinationFrame;
@property  CGFloat duration;
@property (nonatomic,retain)NSString *transitionMode;

@end
NS_ASSUME_NONNULL_END
