//
//  MZ-Home-TableViewCell.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 23/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-TableViewCell.h"
#import "MZ-Home-Status.h"
#import "MZ-Home-Users.h"
#import "UIImageView+WebCache.h"
#import "UIView+Frame.h"
#import "MZ-Home-StatuesFrame.h"

#import "MZ-Home-Cell-BottomView.h"
#import "MZ-Home-Cell-TopView.h"

@interface MZ_Home_TableViewCell()

@property (nonatomic, weak) MZ_Home_Cell_TopView *topView;


@property (nonatomic, weak) MZ_Home_Cell_BottomView *bottomView;

@end

@implementation MZ_Home_TableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *reusedID = @"HOMECELL";
    
    MZ_Home_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedID];
    
    if (cell == nil) {
        
        cell = [[MZ_Home_TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reusedID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self settingTopView];
        [self settingBottomView];
        
        //self.contentView.backgroundColor = [UIColor blueColor];
        self.contentView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
        
    }
    return self;
}
#pragma mark - setting top and Bottom's view models

/**
 *  add top view
    0. topView (顶页) - UIView
    1. imageIcon(头像) - UIImageView;
    2. nickName(昵称) - UILabel
    3. vipIcon(vip图标) - UIImageView
    4. posttime(发表时间) - UILabel
    5. resources(来源) - UILabel
    6. contentText(正文) - UILabel
 
 */
- (void)settingTopView
{
    // create a topView as a contentView 创建一个topView
    MZ_Home_Cell_TopView *topView = [[MZ_Home_Cell_TopView alloc]init];
    [self.contentView addSubview:topView];
    self.topView = topView;
}

- (void)settingBottomView
{
    MZ_Home_Cell_BottomView *bottomView = [[MZ_Home_Cell_BottomView alloc]init];
    [self.contentView addSubview:bottomView];
    self.bottomView = bottomView;
}

#pragma mark - override the cell's frame

- (void)setStatuesFrame:(MZ_Home_StatuesFrame *)statuesFrame
{
    _statuesFrame = statuesFrame;
    
    self.topView.statuesFrame = _statuesFrame;
    self.bottomView.statuesFrame = _statuesFrame;
}

@end
