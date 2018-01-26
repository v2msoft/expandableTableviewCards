//
//  CardCollectionView.m
//  expandableTableTest
//
//  Created by projectes on 25/1/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "CardCollectionView.h"

@implementation CardCollectionView

#pragma mark - hitTest

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    NSIndexPath* index = [self indexPathForItemAtPoint:point];
    UICollectionViewCell* cell = [self cellForItemAtIndexPath:index];
    CGPoint convertedPoint = [cell convertPoint:point
                                       fromView:self];
    return [cell pointInside:convertedPoint
                   withEvent:event];
}

@end
