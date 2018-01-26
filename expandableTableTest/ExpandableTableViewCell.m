//
//  ExpandableTableViewCell.m
//  expandableTableTest
//
//  Created by projectes on 25/1/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "ExpandableTableViewCell.h"

#define LONG_TEXT @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu."
#define SHORT_TEXT @"Lorem ipsum"

@implementation ExpandableTableViewCell

#pragma mark - Config

-(void)configView{
    if (self.expanded){
        [self.lblTitle setText:LONG_TEXT];
    }else{
        [self.lblTitle setText:SHORT_TEXT];
    }
}

#pragma mark - View

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
