//
//  MZ-Home-popView.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 2/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-popView.h"

#import "UIView+Frame.h"
#import "UIImage+imageStretch.h"

@interface MZ_Home_popView()

@property (nonatomic, strong)UIView *fromView;

@property (nonatomic, weak)UITableView *content;

@property (nonatomic, weak) UIImageView *popView;

@property (nonatomic, weak) id<MZ_Home_popView_delegate>delegate;
@end
@implementation MZ_Home_popView

- (instancetype) initwithFromView:(UIView *)fromView Content:(UITableView *)content delegate:(id<MZ_Home_popView_delegate>)delegate
{
    if (self == [super init]) {
        
        self.fromView = fromView;
        
        UIImageView *popView = [[UIImageView alloc]init];
        UIImage *images = [UIImage imageWithStretch:@"popover_background"];
        popView.image = images;
        [popView addSubview:content];
        
        self.content = content;
        content.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:popView];
        self.popView = popView;
        self.delegate = delegate;
        
        [self addTarget:self action:@selector(popViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)showPopView
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    [window addSubview:self];
}

- (void)dismissPopView
{
    [self removeFromSuperview];
}

- (void)popViewClick:(MZ_Home_popView*) popView
{
    if([self.delegate respondsToSelector:@selector(popViewClick:)])
    {
        [self.delegate popViewBtnDidClick:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.frame = [UIScreen mainScreen].bounds;
    
    self.content.x = 10;
    self.content.y = 20;
    
    CGFloat popViewW = CGRectGetMaxX(self.content.frame) + self.content.x;
    CGFloat popViewH = CGRectGetMaxY(self.content.frame) + self.content.y;
    self.popView.size =CGSizeMake(popViewW, popViewH);
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    CGRect newFrame = [self.fromView.superview convertRect:self.fromView.frame toView:window];
    CGPoint newCenter = [self.fromView.superview convertPoint:self.fromView.center toView:window];
    
    self.popView.centerX = newCenter.x;
    self.popView.y = CGRectGetMaxY(newFrame);

}


@end
