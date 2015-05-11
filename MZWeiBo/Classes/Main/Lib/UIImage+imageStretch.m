//
//  UIImage+imageStretch.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 2/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "UIImage+imageStretch.h"

@implementation UIImage (imageStretch)

+ (UIImage *)imageWithStretch:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height * 0.5];
    return image;
}
@end

