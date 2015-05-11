//
//  NSDate+Time.h
//  MZWeiBo
//
//  Created by Mia.Zhang on 26/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Time)

- (BOOL)isThisYear;
- (BOOL)isYesterday;
- (BOOL)isToday;

- (NSDate *)dateWithDMY;
- (NSDateComponents *)dateWithNow;
@end
