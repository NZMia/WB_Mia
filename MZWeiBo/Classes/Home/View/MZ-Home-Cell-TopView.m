//
//  MZ-Home-Cell-TopView.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 28/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-Cell-TopView.h"
#import "MZ-Home-Cell-TopView-OriginalV.h"
#import "MZ-Home-Cell-TopView-RetweetV.h"
#import "MZ-Home-StatuesFrame.h"

@interface MZ_Home_Cell_TopView()
@property (nonatomic, weak)MZ_Home_Cell_TopView_OriginalV *originalView;
@property (nonatomic, weak)MZ_Home_Cell_TopView_RetweetV *retweetView;

@end

@implementation MZ_Home_Cell_TopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

//original
        MZ_Home_Cell_TopView_OriginalV *originalView = [[MZ_Home_Cell_TopView_OriginalV alloc]init];
        [self addSubview:originalView];
        self.originalView = originalView;
// retweet
        MZ_Home_Cell_TopView_RetweetV *retweetView = [[MZ_Home_Cell_TopView_RetweetV alloc]init];
        [self addSubview:retweetView];
        self.retweetView =retweetView;
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)setStatuesFrame:(MZ_Home_StatuesFrame *)statuesFrame
{
    _statuesFrame = statuesFrame;
    
    self.frame = _statuesFrame.topViewFrame;
    
    self.originalView.statuesFrame =  _statuesFrame;
    self.retweetView.statuesFrame = _statuesFrame;    
}

@end
