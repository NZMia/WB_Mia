//
//  MZ-OAuth-Account.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 12/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-OAuth-Account.h"

@implementation MZ_OAuth_Account

+(instancetype)accountWithDic:(NSDictionary *)accountDic
{
    MZ_OAuth_Account *account = [[MZ_OAuth_Account alloc]init];
    
    account.access_token = accountDic[@"access_token"];
    account.expires_in = accountDic[@"expires_in"];
    account.remind_in = accountDic[@"remind_in"];
    account.uid = accountDic[@"uid"];
    
   
    
    return account;
}

// writing to file while is called

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.remind_in forKey:@"remind_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.expires_time forKey:@"expires_time"];
    [aCoder encodeObject:self.profile_image_url forKey:@"profile_image_url"];
}

// reading the data from file while called
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        self.access_token =[aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.remind_in = [aDecoder decodeObjectForKey:@"remind_in"];
        self.expires_time = [aDecoder decodeObjectForKey:@"expires_time"];
        self.profile_image_url = [aDecoder decodeObjectForKey:@"profile_image_url"];
    }
    return self;
}

@end
