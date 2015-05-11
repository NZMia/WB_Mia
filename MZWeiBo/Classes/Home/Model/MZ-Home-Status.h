//
//  MZ-Home-Status.h
//  MZWeiBo
//
//  Created by Mia.Zhang on 17/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MZ-Home-PhotoIcon.h"
#import "MZ-Home-Users.h"

@protocol  MZ_Home_PhotoIcon;

@interface MZ_Home_Status : JSONModel

/** 字符串型的微博ID */
@property (nonatomic, copy) NSString *idstr;
/** 微博信息内容 */
@property (nonatomic, copy) NSString *text;
/** 微博创建时间 */
@property (nonatomic, copy) NSString *created_at;
/** 微博来源 */
@property (nonatomic, copy) NSString *source;

/** 转发数 */
@property (nonatomic, assign) NSNumber *reposts_count;
/** 评论数 */
@property (nonatomic, assign) NSNumber *comments_count;
/** 表态数(赞) */
@property (nonatomic, assign) NSNumber *attitudes_count;

/** 微博作者的用户信息字段 */
@property (nonatomic, strong) MZ_Home_Users *user;

/** 被转发的原微博信息字段，当该微博为转发微博时返回 */
@property (nonatomic, strong) MZ_Home_Status *retweeted_status;

/** 微博配图地址。多图时返回多图链接。无配图返回“[]” */
#warning 由于没有告诉数组属性中需要存储什么类型的数据, 所以jsonmodel框架默认情况下, 解析出数组中是什么类型就存储什么类型, 如果想让数组中存储指定的类型对象, 可以通过协议的方式告诉jsonmodel框架
@property (nonatomic, strong) NSArray<MZ_Home_PhotoIcon> *pic_urls;



@end
