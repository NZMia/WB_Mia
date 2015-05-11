//
//  MZ-Home-Status.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 17/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-Status.h"
#import "NSDate+Time.h"

@implementation MZ_Home_Status

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

- (void)setSource:(NSString *)source
{
   // <a href="http://app.weibo.com/t/feed/6atlQk" rel="nofollow">贴吧客户端</a>
    if (source.length) {
        _source = source;
        // NSLog(@"%@",source);
        NSInteger startIndex = [_source rangeOfString:@">"].location + 1;
        NSInteger length = [_source rangeOfString:@"</"].location - startIndex;
        
        NSRange range = NSMakeRange(startIndex, length);
        NSString *result = [_source substringWithRange:range];
        //NSLog(@"%@",result);
        //    NSLog(@"startIndex = %ld",startIndex);
        //    NSLog(@"length = %ld",length);
        _source = [NSString stringWithFormat:@"From %@",result];
    }
    
}

- (NSString *)created_at
{
    // setting date's formatter (设置日期对象及格式)
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    // getting the created dateObject (获取被创建对象)
    NSDate *createDate = [fmt dateFromString:_created_at];
    
        if ([createDate isThisYear]) {
            if ([createDate isToday]) {
    
                NSDateComponents *components = [createDate dateWithNow];
                if (components.hour >= 1) {
                    return [NSString stringWithFormat:@"%tu hours ago",components.hour];
                }else if (components.minute >= 1)
                {
                    return [NSString stringWithFormat:@"%tu mins ago",components.minute];
                }else
                {
                    return @"just now";
                }
            }else if( [createDate isYesterday])
            {
                fmt.dateFormat = @" Yesterday HH:mm";
                return [fmt stringFromDate:createDate];
            }else
            {
                fmt.dateFormat = @"MM-dd HH:mm";
                return [fmt stringFromDate:createDate];
            }
        }else
        {
            fmt.dateFormat = @"yyyy-MM-dd";
            return [fmt stringFromDate:createDate];
        }
    
}
@end

//- (NSString *)created_at
//{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//  formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
//    formatter.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
//    NSDate *date = [formatter dateFromString:self.created_at];
//    
//    if ([date isThisYear]) {
//        if ([date isToday]) {
//            
//            NSDateComponents *components = [date dateWithNow];
//            if (components.hour >= 1) {
//                return [NSString stringWithFormat:@"%tu hours ago",components.hour];
//            }else if (components.minute >= 1)
//            {
//                return [NSString stringWithFormat:@"%tu mins ago",components.minute];
//            }else
//            {
//                return @"just now";
//            }
//        }else if( [date isYesterday])
//        {
//            formatter.dateFormat = @"mm:HH Yesterday";
//            return [formatter stringFromDate:date];
//        }else
//        {
//            formatter.dateFormat = @"mm:HH dd/MM";
//            return [formatter stringFromDate:date];
//        }
//    }else
//    {
//        formatter.dateFormat = @"mm:HH dd/MM/yy";
//        return [formatter stringFromDate:date];
//    }

//}



