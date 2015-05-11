//
//  MZ-Home-StatuesFrame.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 25/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-StatuesFrame.h"
#import "MZ-Home-Users.h"
#import "MZ-Home-Status.h"
#import "MZ-Home-Cell-PhotoContent.h"

#define MZWidth  [UIScreen mainScreen].bounds.size.width

@implementation MZ_Home_StatuesFrame 

- (void)setStatues:(MZ_Home_Status *)statues
{
    _statues = statues;
    
    
    [self SettingOriginalViewFrame];
    [self SettingRetweetViewFrame];
    [self SettingTopViewFrame];
    [self SettingBottomViewFrame];


    _cellHight = CGRectGetMaxY(_bottomViewFrame);
}



/**
 *  originalView's frame
 */
- (void)SettingOriginalViewFrame
{
    MZ_Home_Users *users = _statues.user;
    // imageIcon (头像)
    CGFloat imageIconW = 30;
    CGFloat imageIconH = 30;
    CGFloat imageIconX = MZCellPadding;
    CGFloat imageIconY = MZCellPadding;
    _imageIconFrame = CGRectMake(imageIconX, imageIconY, imageIconW, imageIconH);
    
    // nickName (昵称)
    CGFloat nickNameX = CGRectGetMaxX(_imageIconFrame) + MZCellPadding;
    CGFloat nickNameY = imageIconY;
    CGSize nickeNameSize = [users.name sizeWithFont:MZCellNameFont];
    _nickNameFrame = (CGRect){{nickNameX,nickNameY},nickeNameSize};
    
    // vipIcon (vip图像)
    CGFloat vipIconX = CGRectGetMaxX(_nickNameFrame) +MZCellPadding;
    CGFloat vipIconY = imageIconY;
    CGFloat vipIconW = 14;
    CGFloat vipIconH = 14;
    _vipIconFrame = (CGRect){{vipIconX,vipIconY},{vipIconW,vipIconH}};
    
    // contentText (正文)
    CGFloat contentTextX = imageIconX;
    CGFloat contentTextY = CGRectGetMaxY(_imageIconFrame) + MZCellPadding;
    CGFloat Width = [UIScreen mainScreen].bounds.size.width;
    
    CGSize contentTextMaxSize = CGSizeMake(Width - MZCellPadding-MZCellPadding, MAXFLOAT);
    CGSize contentTextSize = [_statues.text sizeWithFont:MZCellContentFont constrainedToSize:contentTextMaxSize];
    _contentTextFrame = (CGRect){{contentTextX, contentTextY},contentTextSize};
    
//photoContent
    NSInteger count = _statues.pic_urls.count;
    CGFloat photoW = 70;
    CGFloat phtotH =photoW;
    CGFloat photoPadding = 5;
    
    CGFloat orginalH = 0;
    if (count > 0) {
        NSInteger maxColCount = count == 4?2:3;
        NSInteger colCount = count < maxColCount? count:maxColCount;
        NSInteger rowCount = 0;
        if (count%maxColCount == 0) {
            rowCount = count/maxColCount;
        }else
        {
            rowCount = count/maxColCount +1;
        }
        
        CGFloat photoContentX = imageIconX;
        CGFloat photoContentY = CGRectGetMaxY(_contentTextFrame) +MZCellPadding;
        CGFloat photoContentW = colCount *photoW + (colCount - 1)*photoPadding;
        CGFloat photoContentH = rowCount *phtotH +(rowCount -1)*photoPadding;
        _photoContentFrame = CGRectMake(photoContentX, photoContentY, photoContentW, photoContentH);
        orginalH = CGRectGetMaxY(_photoContentFrame) +MZCellPadding;
    }else
    {
        orginalH = CGRectGetMaxY(_contentTextFrame) + MZCellPadding;
    }
    
    
//orginal
    CGFloat orginalX = 0;
    CGFloat orginalY = 0;
    CGFloat orginalW = Width;
    _originalViewFrame = CGRectMake(orginalX, orginalY, orginalW, orginalH);
    

}

/**
 *  retweetView's frame
 */
- (void)SettingRetweetViewFrame
{
    MZ_Home_Status *retweed = _statues.retweeted_status;
    if (retweed != nil) {
        
        //retweetContent
        CGFloat retweetContentX = MZCellPadding;
        CGFloat retweetContentY = MZCellPadding;
        
        CGSize retweetContentMaxSize = CGSizeMake(MZWidth - MZCellPadding - MZCellPadding, MAXFLOAT);
        CGSize retweetContentSize = [retweed.text sizeWithFont: MZCellContentFont constrainedToSize:retweetContentMaxSize];
        _retweetContentFrame = (CGRect) {{retweetContentX, retweetContentY}, retweetContentSize};

        
        //retweetView
        CGFloat retweetViewX = 0;
        CGFloat retweetViewY = CGRectGetMaxY(_originalViewFrame);
        CGFloat retweetViewW = MZWidth;
        CGFloat retweetViewH = CGRectGetMaxY(_retweetContentFrame) + MZCellPadding;

            _retweetViewFrame = (CGRect){{retweetViewX, retweetViewY},{retweetViewW, retweetViewH}};
    }
}

/**
 *  topView's frame
 */
- (void)SettingTopViewFrame
{
    MZ_Home_Status *retweed = _statues.retweeted_status;
    CGFloat topViewH = 0;
    if (retweed != nil) {
        topViewH = CGRectGetMaxY(_retweetViewFrame) +MZCellPadding;
    }else{
        //not retweet
        topViewH =CGRectGetMaxY(_originalViewFrame) + MZCellPadding;
    }

        
    CGFloat topViewX = 0;
    CGFloat topViewY = 15;
    CGFloat topViewW = MZWidth;
    
    _topViewFrame = CGRectMake(topViewX, topViewY, topViewW, topViewH);
}


/**
 *  bottom's frame
 */
- (void)SettingBottomViewFrame
{
    CGFloat bottomViewX = 0;
    CGFloat bottomViewY = CGRectGetMaxY(_topViewFrame);  CGFloat bottomViewW = MZWidth;
    CGFloat bottomViewH = 44;
    _bottomViewFrame = CGRectMake(bottomViewX, bottomViewY, bottomViewW, bottomViewH);

}

@end
