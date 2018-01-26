//
//  ExpandableTableViewCell.h
//  expandableTableTest
//
//  Created by projectes on 25/1/18.
//  Copyright © 2018 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandableTableViewCell : UITableViewCell

@property (nonatomic) BOOL expanded;

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

-(void)configView;

@end
