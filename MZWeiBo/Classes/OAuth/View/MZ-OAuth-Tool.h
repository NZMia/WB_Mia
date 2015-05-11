//
//  MZ-OAuth-Tool.h
//  MZWeiBo
//
//  Created by Mia.Zhang on 12/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MZ-OAuth-VC.h"
#import "MZ-OAuth-Account.h"

@interface MZ_OAuth_Tool : NSObject

+(BOOL)saveAccountInfor:(MZ_OAuth_Account *)account;

+(MZ_OAuth_Account *)accountRead;

@end
