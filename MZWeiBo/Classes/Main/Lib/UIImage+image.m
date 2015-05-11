//
//  UIImage+image.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 1/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+ (UIImage *)imageWithOriginalMode:(NSString*)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}

@end
