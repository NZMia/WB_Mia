//
//  MZ-Navigation-VC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 1/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Navigation-VC.h"

#import "UIBarButtonItem+Extension.h"

@interface MZ_Navigation_VC ()

@end

@implementation MZ_Navigation_VC

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_back" highlightedImage:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_more" highlightedImage:@"navigationbar_more_highlighted" target:self action:@selector(more)];
    }
    
    [super pushViewController:viewController animated:YES];
    
}
- (void)back
{
    [self popViewControllerAnimated:YES];
}
- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

@end
