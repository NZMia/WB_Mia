//
//  MZ-Home-PhotoIcon.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 17/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-PhotoIcon.h"

@implementation MZ_Home_PhotoIcon
+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

- (NSString *)bmiddle_pic
{
    return [self.thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
}
@end
