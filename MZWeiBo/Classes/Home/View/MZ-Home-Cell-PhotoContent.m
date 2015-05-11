//
//  MZ-Home-Cell-PhotoContent.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 29/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-Cell-PhotoContent.h"
#import "UIImageView+WebCache.h"
#import "MZ-Home-PhotoIcon.h"
#import "MZ-Home-Cell-PhotoView.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

@implementation MZ_Home_Cell_PhotoContent

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i<9; i++) {
            MZ_Home_Cell_PhotoView *image = [[MZ_Home_Cell_PhotoView alloc]init];
            image.tag = i;
            [self addSubview:image];
            
            image.contentMode = UIViewContentModeScaleAspectFill;
            image.clipsToBounds = YES;
            
// adding the add event
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
            [image addGestureRecognizer:tap];
        }
    }
    return self;
}

- (void)setPic_urls:(NSArray *)pic_urls
{
    _pic_urls = pic_urls;

    NSInteger count = _pic_urls.count;
    for (int i = 0; i<9; i++) {
        MZ_Home_Cell_PhotoView *image = self.subviews[i];
        if (i<count) {
            image.hidden = NO;
            
            MZ_Home_PhotoIcon *photo = _pic_urls[i];
            image.phtot = photo;
            
        }else
        {
            image.hidden = YES;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.pic_urls.count;
    CGFloat photoW = 70;
    CGFloat photoH = photoW;
    CGFloat photoPadding = 5;
    
    for (int i = 0; i<count; i++) {
        
        UIImageView *image = self.subviews[i];
        NSInteger maxCol = count == 4?2:3;
        NSInteger row = i/maxCol;
        NSInteger col = i%maxCol;
        
        CGFloat imageX = col * (photoW +photoPadding);
        CGFloat imageY = row *(photoH +photoPadding);
        CGFloat imageW = photoW;
        CGFloat imageH = photoH;
        
        image.frame = CGRectMake(imageX, imageY, imageW, imageH);
    }
}

#pragma mark ----gesture image click

- (void)imageClick:(UIGestureRecognizer*)tap
{
// 1.create a photoBrowser (创建图片浏览器)
    MJPhotoBrowser *photoBrowser = [[MJPhotoBrowser alloc]init];
    
// 2.create a array to save the image which is need to show(创建数组保存所有需要显示的图片)
    NSMutableArray *photoArray = [NSMutableArray array];
    for (int i = 0; i< self.pic_urls.count; i++) {
        
        //create a MJPhoto object (创建MJPhoto对象)
        MJPhoto *photos = [[MJPhoto alloc]init];
        //setting the relevant data of MJPhoto (设置MJPhoto对应的数据)
        MZ_Home_PhotoIcon *picUrlModel = self.pic_urls[i];
        NSURL *url = [NSURL URLWithString:picUrlModel.bmiddle_pic];
        photos.url = url;
        //setting the source of relevant of MJPhoto (设置MJPhoto对应数据来源)
        MZ_Home_Cell_PhotoView *photoView = self.subviews[i];
        photos.srcImageView = photoView;
        //adding MJPhoto object, which is created, to array
        [photoArray addObject:photos];
    }
    // 3. to save browser which data is needed (告诉图片浏览器那些数据需要需要)
    photoBrowser.photos = photoArray;
    // 4. let the browse to know which image need to show（告诉图片浏览器哪张图片需要显示）
    photoBrowser.currentPhotoIndex = tap.view.tag;
    // 5. to show (显示)
    [photoBrowser show];
}

@end
