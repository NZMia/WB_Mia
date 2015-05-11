//
//  MZ-Home-StatuesFrame.h
//  MZWeiBo
//
//  Created by Mia.Zhang on 25/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define MZCellNameFont [UIFont systemFontOfSize:15]
#define MZCellTimeFont [UIFont systemFontOfSize:13]
#define MZCellSourceeFont MZCellTimeFont
#define MZCellContentFont [UIFont systemFontOfSize:16]

#define MZCellPadding 10
@class MZ_Home_Status;
@interface MZ_Home_StatuesFrame : NSObject

/**
 *  data models
 */
@property (nonatomic,strong)MZ_Home_Status * statues;

/**
 *  all attributes frame for saved(定义属性保存所有控件的frame)
 */

// topViewFrame
@property (nonatomic, assign, readonly) CGRect topViewFrame;
/**************************Stylelines**************************/
//orignial
@property (nonatomic, assign, readonly) CGRect originalViewFrame;
@property (nonatomic, assign, readonly) CGRect imageIconFrame;
@property (nonatomic, assign, readonly) CGRect nickNameFrame;
@property (nonatomic, assign, readonly) CGRect vipIconFrame;
//@property (nonatomic, assign, readonly) CGRect posttimeFrame;
//@property (nonatomic, assign, readonly) CGRect resourcesFrame;
@property (nonatomic, assign, readonly) CGRect contentTextFrame;
@property (nonatomic, assign, readonly) CGRect photoContentFrame;

/**************************Stylelines**************************/
//retweet
@property (nonatomic, assign, readonly) CGRect retweetViewFrame;
@property (nonatomic, assign, readonly) CGRect retweetContentFrame;

/**************************Stylelines**************************/
//bottom

// bottomViewFrame
@property (nonatomic, assign, readonly) CGRect bottomViewFrame;

// each cell hight
@property (nonatomic, assign, readonly) CGFloat cellHight;

@end
