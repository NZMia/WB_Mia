//
//  MZ-TabBar.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 1/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//
#import "MZ-TabBar.h"

#import "UIView+Frame.h"

#define  tabBarButtonsCount 5

@interface MZ_TabBar()

@property (nonatomic, weak) UIButton *addButton;

@end

@implementation MZ_TabBar

- (UIButton *)addButton
{
    if (_addButton == nil) {
        
        UIButton *add = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //background
        [add setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [add setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        //image
        
        [add setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [add setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        // action
        
        [add addTarget:self action:@selector(HomeAdd) forControlEvents:UIControlEventTouchUpInside];
        
        _addButton = add;
        [self addSubview:_addButton];
    }
    return _addButton;
}

- (void)HomeAdd
{
    NSLog(@"TODO---Home--AddNeed");
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    // other's button
    
    NSInteger buttonIndex = 0;
    for (UIView *child in self.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
        
            CGFloat childW = self.width/tabBarButtonsCount;
            CGFloat childH = self.height;
            CGFloat childX = buttonIndex * childW;
            CGFloat childY = 0;
            
            buttonIndex++;
            
            if (buttonIndex == 2) {
                buttonIndex ++;
            }
            
            child.frame = CGRectMake(childX, childY, childW, childH);
        }
    }
    
    self.addButton.size = self.addButton.currentBackgroundImage.size;
    self.addButton.center = CGPointMake(self.width *0.5, self.height *0.5);
    
}
@end
