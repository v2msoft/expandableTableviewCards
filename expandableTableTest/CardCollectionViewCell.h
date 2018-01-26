//
//  CardCollectionViewCell.h
//  expandableTableTest
//
//  Created by projectes on 25/1/18.
//  Copyright © 2018 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCollectionViewCell : UICollectionViewCell<
UITableViewDelegate,
UITableViewDataSource
>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UIView *viewContent;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *cnstViewContentHeight;

-(void)configView;

@end
