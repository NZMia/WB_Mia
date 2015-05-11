//
//  MZ-Home-Cell-TopView-RetweetV.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 28/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-Cell-TopView-RetweetV.h"
#import "MZ-Home-Users.h"
#import "MZ-Home-Status.h"
#import "MZ-Home-StatuesFrame.h"
#import "UIImageView+WebCache.h"
#import "MZ-Home-Cell-PhotoContent.h"

@interface MZ_Home_Cell_TopView_RetweetV()
@property (nonatomic, weak)UILabel *retweetContent;
@end

@implementation MZ_Home_Cell_TopView_RetweetV

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:227/255.0 green:227/255.0  blue:227/255.0  alpha:1.0];
        
        UILabel *retweetContent = [[UILabel alloc]init];
        [self addSubview:retweetContent];
        self.retweetContent = retweetContent;
        self.retweetContent.numberOfLines = 0;
        self.retweetContent.font = MZCellContentFont;
        
        
    }
    return self;
}

- (void)setStatuesFrame:(MZ_Home_StatuesFrame *)statuesFrame
{
    _statuesFrame = statuesFrame;
    self.frame = self.statuesFrame.retweetViewFrame;
    [self settingCellData];
    [self settingCellFrame];
}

- (void)settingCellData
{
    MZ_Home_Status *retweet = _statuesFrame.statues.retweeted_status;
    MZ_Home_Users *user = _statuesFrame.statues.user;
    if (retweet) {
        
        NSString *content = [NSString stringWithFormat:@"@%@:%@",user.name, retweet.text];
        self.retweetContent.text = content;
        
   }

}

- (void)settingCellFrame
{
    self.retweetContent.frame = self.statuesFrame.retweetContentFrame;
}

@end
