//
//  MZ-OAuth-Tool.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 12/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-OAuth-Tool.h"
@implementation MZ_OAuth_Tool

#define MZAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"MZ_WeiBo_Account_date"]

+ (BOOL)saveAccountInfor:(MZ_OAuth_Account *)account
{
    //calculating the expire_time
    account.expires_time = [[NSDate date] dateByAddingTimeInterval:[account.expires_in doubleValue]];
    
    return [NSKeyedArchiver archiveRootObject:account toFile:MZAccountPath];
}

+ (MZ_OAuth_Account *)accountRead
{
    MZ_OAuth_Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:MZAccountPath];
    
    if ([[NSDate date] compare:account.expires_time] == NSOrderedDescending) {
        return nil;
    }
    
    return account;
}
@end
