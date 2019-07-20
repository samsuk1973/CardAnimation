//
//  DetailViewController.h
//  CardAnimation
//
//  Created by LaNet on 19/07/19.
//  Copyright © 2019 LaNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "instantPanGesture.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *btnDismiss;
@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *img_height;

@end

NS_ASSUME_NONNULL_END
