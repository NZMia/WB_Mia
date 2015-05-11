//
//  MZ-Home-Cell-TopView-OriginalV.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 28/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-Cell-TopView-OriginalV.h"
#import "MZ-Home-StatuesFrame.h"
#import "MZ-Home-Status.h"
#import "MZ-Home-Users.h"
#import "UIImageView+WebCache.h"
#import "MZ-Home-Cell-PhotoContent.h"

@interface MZ_Home_Cell_TopView_OriginalV()
@property (nonatomic, weak) UIImageView *imageIcon;
@property (nonatomic, weak) UIImageView *vipIcon;
@property (nonatomic, weak) UILabel *nickNmae;
@property (nonatomic, weak) UILabel *posttime;
@property (nonatomic, weak) UILabel *source;
@property (nonatomic, weak) UILabel *contentText;
@property (nonatomic, weak) MZ_Home_Cell_PhotoContent *photoContent;

@end

@implementation MZ_Home_Cell_TopView_OriginalV
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    // add attributes into topView 添加属性
        UIImageView *imageIcon = [[UIImageView alloc]init];
        [self addSubview:imageIcon];
        self.imageIcon = imageIcon;
        
        UILabel *nickName = [[UILabel alloc]init];
        [self addSubview:nickName];
        self.nickNmae = nickName;
        self.nickNmae.font = MZCellNameFont;
        
        UIImageView *vipIcon = [[UIImageView alloc]init];
        [self addSubview:vipIcon];
        self.vipIcon = vipIcon;
        
        UILabel *posttime = [[UILabel alloc]init];
        [self addSubview:posttime];
        self.posttime = posttime;
        self.posttime.textColor = [UIColor orangeColor];
        self.posttime.font = MZCellTimeFont;
        
        UILabel *resources = [[UILabel alloc]init];
        [self addSubview:resources];
        self.source = resources;
        self.source.textColor = [UIColor grayColor];
        self.source.font = MZCellSourceeFont;
        
        UILabel *contentText = [[UILabel alloc]init];
        [self addSubview:contentText];
        self.contentText = contentText;
        self.contentText.numberOfLines = 0;
        self.contentText.font = MZCellContentFont;
        
        MZ_Home_Cell_PhotoContent *photoContent = [[MZ_Home_Cell_PhotoContent alloc]init];
        [self addSubview:photoContent];
        self.photoContent = photoContent;
    }
    return self;
}

- (void)setStatuesFrame:(MZ_Home_StatuesFrame *)statuesFrame
{
    _statuesFrame = statuesFrame;
    
    self.frame = self.statuesFrame.originalViewFrame;
    [self settingCellData];
    [self settingCellFrame];
}
/**
 *  setting data 设置数据
 */
- (void)settingCellData
{
    MZ_Home_Status *statue = self.statuesFrame.statues;
    MZ_Home_Users *users = statue.user;
    /**************************Stylelines**************************/
    //orignal
    
    // take out of user's model
    /**imageIcon：头像 */
    NSURL *url = [NSURL URLWithString:users.profile_image_url];
    [self.imageIcon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default_big"]];
    /**nickName：昵称 */
    self.nickNmae.text = users.name;
    /**vipIcon：会员 */
    if (users.isVip) {
        self.vipIcon.hidden = NO;
        // vipIcon
        NSString *vipName =[NSString stringWithFormat:@"common_icon_membership_level%d",[users.mbrank intValue]];
        self.vipIcon.image = [UIImage imageNamed:vipName];
        
        // vip Color
        self.nickNmae.textColor = [UIColor orangeColor];
    }else
    {
        // 重用
        self.vipIcon.hidden = YES;
        self.nickNmae.textColor = [UIColor blackColor];
    }
    
    /**posttime：时间 */
    self.posttime.text = statue.created_at;
    /**resources：来源 */
    self.source.text = statue.source;
    /**contentText：正文 */
    self.contentText.text = statue.text;
    /**photoContent：配图容器 */
    self.photoContent.pic_urls = statue.pic_urls;
}

/**
 *  setting frame 设置数据
 */
- (void) settingCellFrame
{
    self.imageIcon.frame = self.statuesFrame.imageIconFrame;
    self.nickNmae.frame = self.statuesFrame.nickNameFrame;
    self.vipIcon.frame = self.statuesFrame.vipIconFrame;
    
    // posttime (发表时间)
    MZ_Home_Status *statues = self.statuesFrame.statues;
    CGFloat posttimeX = self.statuesFrame.nickNameFrame.origin.x;
    CGFloat posttimeY = CGRectGetMaxY(self.statuesFrame.nickNameFrame) + MZCellPadding *0.5;
    CGSize posttimeSize = [statues.created_at sizeWithFont:MZCellTimeFont];
    self.posttime.frame = (CGRect){{posttimeX,posttimeY},posttimeSize};
    
    // resources (来源)
    CGFloat resourcesX = CGRectGetMaxX(self.posttime.frame) + MZCellPadding * 0.5;
    CGFloat resourcesY = posttimeY;
    CGSize sourceSize = [statues.source sizeWithFont:MZCellSourceeFont];
    self.source.frame = (CGRect){{resourcesX , resourcesY}, sourceSize};
   
    // content 正文
    self.contentText.frame = self.statuesFrame.contentTextFrame;
    
    // photoContent 配图
    self.photoContent.frame = self.statuesFrame.photoContentFrame;
}
@end
