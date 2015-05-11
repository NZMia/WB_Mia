//
//  NSDate+Time.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 26/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "NSDate+Time.h"

@implementation NSDate (Time)
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitDay |NSCalendarUnitYear;
    
    // present time (当前时间)
    NSDateComponents *currentTimeComponents = [calendar components:unit fromDate:[NSDate date]];
    // posttime time -- self time (发表时间)
    NSDateComponents *posttimeComponents = [calendar components:unit fromDate:self];
    
    return  ( posttimeComponents.day == currentTimeComponents.day )&& ( posttimeComponents.month == currentTimeComponents.month)&&
    ( posttimeComponents.year == currentTimeComponents.year);
}

- (BOOL)isYesterday
{
    NSDate *currentDate = [[NSDate date] dateWithDMY];
    NSDate *postDate = [self dateWithDMY];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:postDate toDate:currentDate options:0];
    
    return cmps.day == 1;
}

- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    NSDateComponents *currentTimeComponents = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *posttimeComponets = [calendar components:unit fromDate:self];
    
    return currentTimeComponents.year == posttimeComponets.year;

}

- (NSDate *)dateWithDMY
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"dd-MM-yyyy";
    NSString *postString = [fmt stringFromDate:self];
    return [fmt dateFromString:postString];
    
}

- (NSDateComponents *)dateWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}
@end
