//
//  MZ-OAuth-Account.h
//  MZWeiBo
//
//  Created by Mia.Zhang on 12/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  "access_token" = "2.00N2p7EGzX8suBd5435bee6bjJxhjD";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 5562296223;

 */
@interface MZ_OAuth_Account : NSObject <NSCoding>

@property (copy,nonatomic) NSString *access_token;
@property (copy,nonatomic) NSString *expires_in;
@property (copy,nonatomic) NSString *remind_in;
@property (copy,nonatomic) NSString *uid;

@property (copy,nonatomic) NSDate *expires_time;
@property (copy,nonatomic) NSString *profile_image_url;

+(instancetype)accountWithDic:(NSDictionary *)accountDic;

@end
