//
//  CardCollectionViewCell.m
//  expandableTableTest
//
//  Created by projectes on 25/1/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "CardCollectionViewCell.h"
#import "ExpandableTableViewCell.h"

#define TOTAL_ITEMS 5

@interface CardCollectionViewCell(){
    NSMutableArray* cellsInfo;
}

@end

@implementation CardCollectionViewCell

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellsInfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = @"ExpandableTableViewCell";
    ExpandableTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                                         forIndexPath:indexPath];
    
    //Set expanded mode
    [cell setExpanded:[[cellsInfo objectAtIndex:indexPath.row] boolValue]];
    
    [cell configView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ExpandableTableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [cellsInfo replaceObjectAtIndex:indexPath.row
                         withObject:@(![[cellsInfo objectAtIndex:indexPath.row] boolValue])];
    
    [cell setExpanded:!cell.expanded];
    
    [cell configView];
    
    [UIView animateWithDuration:0.3 animations:^{
        [tableView beginUpdates];
        [tableView endUpdates];
        
    } completion:^(BOOL finish){
        if (finish){
            
        }
    }];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - Config

-(void)configView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 62;
}

#pragma mark - hitTest

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGPoint convertedPoint = [self.viewContent convertPoint:point
                                                   fromView:self];
    return [self.viewContent pointInside:convertedPoint
                               withEvent:event];
}

#pragma mark - View

-(void)updateConstraints{
    self.cnstViewContentHeight.constant = 3 + self.tableView.contentSize.height;
    [super updateConstraints];
}

#pragma mark - Init

-(instancetype)init{
    if (self = [super init]){
        [self createItems];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        [self createItems];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self createItems];
    }
    return self;
}

-(void)createItems{
    cellsInfo = [[NSMutableArray alloc] init];
    for (int i = 0; i < TOTAL_ITEMS; i++){
        [cellsInfo addObject:@(NO)];
    }
}

@end
