//
//  ViewController.h
//  CardAnimation
//
//  Created by LaNet on 19/07/19.
//  Copyright © 2019 LaNet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *cardCollection;

@end

