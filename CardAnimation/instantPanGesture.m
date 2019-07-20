//
//  instantPanGesture.m
//  CardAnimation
//
//  Created by LaNet on 19/07/19.
//  Copyright © 2019 LaNet. All rights reserved.
//

#import "instantPanGesture.h"

@implementation instantPanGesture
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if(self.state == UIGestureRecognizerStateBegan)
    {
        return;
    }
    [super touchesBegan:touches withEvent:event];
    self.state =UIGestureRecognizerStateBegan;
}
@end
