//
//  MZ-Home-TableViewCell.h
//  MZWeiBo
//
//  Created by Mia.Zhang on 23/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZ-Home-StatuesFrame.h"

@interface MZ_Home_TableViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(strong, nonatomic) MZ_Home_StatuesFrame *statuesFrame;
@end
