//
//  MZ-Home-Users.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 17/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-Users.h"

@implementation MZ_Home_Users

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

- (BOOL)isVip
{
    return ([self.mbtype intValue] >2);
}
@end
