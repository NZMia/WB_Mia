//
//  UIWindow+RootVCChoose.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 15/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "UIWindow+RootVCChoose.h"
#import "MZ-NewFeature-VC.h"
#import "MZ-NewFeature-WelcomeVC.h"

@implementation UIWindow (RootVCChoose)

- (void)RootViewControllerChoose
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    NSString *currenVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *locationVersion = [defaults objectForKey:@"CFBundleShortVersionString"];
    
    if (![locationVersion isEqualToString:currenVersion]) {
       window.rootViewController = [[MZ_NewFeature_VC alloc]init];
        
        [defaults setObject:currenVersion forKey:@"CFBundleShortVersionString"];
        [defaults synchronize];
        
    }else{
        
        window.rootViewController = [[MZ_NewFeature_WelcomeVC alloc]init];
    }

}
@end
