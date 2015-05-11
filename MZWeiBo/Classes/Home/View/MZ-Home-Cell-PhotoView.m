//
//  MZ-Home-Cell-PhotoView.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 29/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-Cell-PhotoView.h"
#import "MZ-Home-PhotoIcon.h"
#import "UIImageView+WebCache.h"
#import "UIView+Frame.h"

@interface MZ_Home_Cell_PhotoView()
@property (nonatomic, weak)UIImageView *gifV;
@end

@implementation MZ_Home_Cell_PhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *gifV = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"timeline_image_gif"]];
        [self addSubview:gifV];
        self.gifV = gifV;
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setPhtot:(MZ_Home_PhotoIcon *)phtot
{
    _phtot = phtot;
    
    NSURL *url = [NSURL URLWithString:_phtot.thumbnail_pic];
    [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default_big"]];

//judge 判断是否为gif
    
    if ([url.absoluteString.lowercaseString hasSuffix:@"gif"]) {
        self.gifV.hidden = NO;
    }else
    {
        self.gifV.hidden = YES;
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifV.x = self.width - self.gifV.width;
    self.gifV.y = self.height - self.gifV.height;
}
@end
