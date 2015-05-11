//
//  MZ-Home-Users.h
//  MZWeiBo
//
//  Created by Mia.Zhang on 17/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface MZ_Home_Users : JSONModel
/** 字符串型的用户UID */
@property (nonatomic, copy) NSString *idstr;
/** 友好显示名称 */
@property (nonatomic, copy) NSString *name;
/** 用户头像地址（中图），50×50像素 */
@property (nonatomic, copy) NSString *profile_image_url;

@property (strong, nonatomic)NSNumber *mbrank;

@property (strong, nonatomic)NSNumber *mbtype;

- (BOOL)isVip;
@end
