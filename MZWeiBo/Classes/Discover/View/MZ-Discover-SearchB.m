//
//  MZ-Discover-SearchB.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 10/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Discover-SearchB.h"

#import "UIView+Frame.h"

@implementation MZ_Discover_SearchB

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.borderStyle = UITextBorderStyleRoundedRect;
    self.frame = CGRectMake(998, 668, 300, 30);
    
    UIImageView *leftIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
    
    self.leftView = leftIcon;
    self.leftViewMode = UITextFieldViewModeAlways;
    
    self.placeholder = @"search: ";
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.tintColor = [UIColor grayColor];
    //self.clearButtonMode = UITextFieldViewModeWhileEditing;

}

- (void) setLeftIconImageName:(NSString *)leftIconImageName
{
    UIImageView *leftIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:leftIconImageName]];
    leftIcon.width = 30;
    leftIcon.contentMode = UIViewContentModeCenter;
    self.leftView = leftIcon;
    self.leftViewMode = UITextFieldViewModeAlways;

}

@end
