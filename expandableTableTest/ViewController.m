//
//  ViewController.m
//  expandableTableTest
//
//  Created by projectes on 25/1/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "ViewController.h"
#import "CardCollectionView.h"
#import "CardCollectionViewCell.h"

#define TOTAL_STEPS 5

@interface ViewController (){
    CGRect currentCollectionRect;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet CardCollectionView *collectionView;

@end

@implementation ViewController

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return TOTAL_STEPS;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CardCollectionViewCell";
    
    CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier
                                                                             forIndexPath:indexPath];
    
    [cell configView];
    
    return cell;
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, collectionView.frame.size.height);
}

#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.collectionView.frame.size.width;
    float currentPage = self.collectionView.contentOffset.x / pageWidth;
    int step;
    if (0.0f != fmodf(currentPage, 1.0f))
    {
        step = currentPage + 2;
    }
    else
    {
        step = currentPage + 1;
    }
    
    if (step > TOTAL_STEPS) step = TOTAL_STEPS;
    if (step < 1) step = 1;
    
    NSLog(@"Page Number : %ld", (long)step);
}

#pragma mark - View lifecycle

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    if (!CGRectEqualToRect(currentCollectionRect, self.collectionView.frame)){
        [self.collectionView reloadData];
    }
    currentCollectionRect = self.collectionView.frame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
