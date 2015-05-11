//
//  MZ-Home-Cell-BottomView.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 28/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-Cell-BottomView.h"
#import "MZ-Home-StatuesFrame.h"
#import "UIView+Frame.h"

@interface MZ_Home_Cell_BottomView()

@property (nonatomic, strong) NSMutableArray *button;
@property (nonatomic, strong) NSMutableArray *divider;

@property (nonatomic, weak) UIButton *repostButton;
@property (nonatomic, weak) UIButton *commontButton;
@property (nonatomic, weak) UIButton *likeButton;


@end

@implementation MZ_Home_Cell_BottomView

- (NSMutableArray *)button
{
    if (!_button) {
        _button = [NSMutableArray array];
    }
    return  _button;
}

- (NSMutableArray *)divider
{
    if (!_divider) {
        _divider = [NSMutableArray array];
    }
    return _divider;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpButtons];
        [self setUpDividers];
    }
    return self;
}

- (void)setUpButtons
{
   
    self.repostButton = [self buttonWithBottomImageName:@"timeline_icon_retweet" andTitle:@"Repost"];
    self.commontButton = [self buttonWithBottomImageName:@"timeline_icon_comment" andTitle:@"Commont"];
    self.likeButton =[self buttonWithBottomImageName:@"timeline_icon_unlike" andTitle:@"Like"];
    
}


- (void)setUpDividers
{
    UIImageView *divider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
    [self addSubview:divider];
    [self.divider addObject:divider];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    /**
     *  setting Button
     */
    CGFloat ButtonW = self.width/self.button.count;
    for (int i = 0; i < self.button.count; i++) {
        UIButton *btn = self.button[i];
        
        CGFloat btnX = i * ButtonW;
        CGFloat btnY = 0;
        CGFloat btnW = ButtonW;
        CGFloat btnH = self.height;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
    /**
     *  setting divider
     */
    
    for (int i = 0; i < self.divider.count;i++) {
        UIImageView *divider = self.divider[i];
        divider.y = 0;
        divider.width = 1;
        divider.height = self.height;
        divider.x = (i + 1)* ButtonW;
    }
}


- (void)setStatuesFrame:(MZ_Home_StatuesFrame *)statuesFrame
{
    _statuesFrame = statuesFrame;
    self.frame = _statuesFrame.bottomViewFrame;
}

- (UIButton *) buttonWithBottomImageName:(NSString *)imageName andTitle:(NSString *)title;
{
    UIButton *btn = [[UIButton alloc]init];
    
//backgroundImage
    [btn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background_highlighted"] forState:UIControlStateHighlighted];
    btn.adjustsImageWhenHighlighted = NO;
    
//image
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//title
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];

//space between image and title
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    [self addSubview:btn];
    [self.button addObject:btn];
    
    return btn;
}
@end
