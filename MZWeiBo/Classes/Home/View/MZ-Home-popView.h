//
//  MZ-Home-popView.h
//  MZWeiBo
//
//  Created by Mia.Zhang on 2/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MZ_Home_popView;

@protocol MZ_Home_popView_delegate <NSObject>

- (void)popViewBtnDidClick: (MZ_Home_popView *)popView;

@end

@interface MZ_Home_popView : UIButton

- (instancetype) initwithFromView:(UIView *)fromView Content:(UITableView *)content delegate: (id<MZ_Home_popView_delegate>)delegate;

- (void)showPopView;
- (void)dismissPopView;
@end
