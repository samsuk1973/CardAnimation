//
//  ViewController.m
//  CardAnimation
//
//  Created by LaNet on 19/07/19.
//  Copyright © 2019 LaNet. All rights reserved.
//

#import "ViewController.h"
#import "CardCollectionViewCell.h"
#import "DetailViewController.h"
#import "CustomTransition.h"
@interface ViewController ()
{
      CustomTransition *transition;
}
@end

@implementation ViewController
{
    CGAffineTransform originaltransform;
    UIView *cellView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // custom transition class setup
    transition = [[CustomTransition alloc]init];
    transition.transitionMode = @"present";
    transition.duration = 1.0;
    [self.cardCollection registerNib:[UINib nibWithNibName:@"CardCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cardcell"];
    
}

#pragma mark - UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return CGSizeMake(self.cardCollection.frame.size.width-40, 300);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardCollectionViewCell *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cardcell" forIndexPath:indexPath];
    originaltransform = Cell.transform;
    Cell.transform = CGAffineTransformIdentity;
    Cell.imgView.layer.cornerRadius = 20;
    transition.destinationFrame = CGRectMake(0, 0, self.view.frame.size.width, Cell.imgView.frame.size.height* self.view.frame.size.width/Cell.imgView.frame.size.width);
    return Cell;
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardCollectionViewCell *Cell = (CardCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cellView = Cell;
    if(Cell!=nil)
    {
        [UIView animateWithDuration:0.2 animations:^{
            Cell.transform = CGAffineTransformMakeScale(0.95, 0.95);
            //Cell.backgroundColor = [UIColor yellowColor];
        }];
        
    }
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardCollectionViewCell *Cell = (CardCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(Cell!=nil)
    {
        [UIView animateWithDuration:0.4 animations:^{
            Cell.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardCollectionViewCell *cell = (CardCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    
    UICollectionViewLayoutAttributes * theAttributes = [collectionView layoutAttributesForItemAtIndexPath:indexPath];
    
    CGRect a = [collectionView convertRect:theAttributes.frame toView:[collectionView superview]];
    
    transition.startingFrame = CGRectMake(CGRectGetMinX(a)+15, CGRectGetMinY(a)+15, cell.imgView.frame.size.width, cell.imgView.frame.size.height);
 
    DetailViewController *detail = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    detail.imgView.image = cell.imgView.image;
    detail.transitioningDelegate = self;
    detail.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:detail animated:YES completion:nil];
}

#pragma mark - UIViewControllerContextTransitioning
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    transition.transitionMode = @"present";
    return transition;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    transition.transitionMode = @"dismiss";
    return transition;
}
@end
