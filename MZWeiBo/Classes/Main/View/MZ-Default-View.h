//
//  MZ-Default-View.h
//  MZWeiBo
//
//  Created by Mia.Zhang on 10/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MZ_Default_View;

@protocol MZ_Default_View_Delegate <NSObject>

- (void)defaultCenterView:(MZ_Default_View *)defaultCenterView didClickLoginBtn:(UIButton *)loginBtn;
- (void)defaultCenterView:(MZ_Default_View *)defaultCenterView didClickRegisterBtn:(UIButton *)registerBtn;
@end

@interface MZ_Default_View : UIView

+(instancetype)defaultCenterView;

@property (copy, nonatomic) NSString *turntableName;
@property (copy, nonatomic) NSString *midIcontableName;
@property (copy, nonatomic) NSString *descripition;
@property (weak, nonatomic) id<MZ_Default_View_Delegate>delegate;

- (void)startRotate;
- (void)stopRotate;

@end
