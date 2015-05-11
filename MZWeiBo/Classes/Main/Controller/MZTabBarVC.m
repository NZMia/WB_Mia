//
//  MZTabBarVC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 1/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZTabBarVC.h"
#import "MZ-Navigation-VC.h"

#import "MZ-Discover-VC.h"
#import "MZ-Home-VC.h"
#import "MZ-Message-VC.h"
#import "MZ-Profile-VC.h"

#import "MZ-TabBar.h"


#import "UIImage+image.h"

@interface MZTabBarVC ()

@end

@implementation MZTabBarVC

+ (void)initialize
{
    UITabBarItem *title = [UITabBarItem appearance];
    
    NSMutableDictionary *titleAttributes = [NSMutableDictionary dictionary];
    
    titleAttributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [title setTitleTextAttributes:titleAttributes forState:UIControlStateSelected];
                        
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MZ_TabBar *tabBar = [[MZ_TabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self addAllViewController];
}

- (void)addAllViewController
{
    MZ_Home_VC * home = [[MZ_Home_VC alloc] init];
    [self setUpOneVC:home image:[UIImage imageWithOriginalMode:@"tabbar_home_selected"]selectedImage:[UIImage imageWithOriginalMode:@"tabbar_home_selected"] title:@"Home"];
    
    MZ_Message_VC *message = [[MZ_Message_VC alloc] init];
    [self setUpOneVC:message image:[UIImage imageWithOriginalMode:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalMode:@"tabbar_message_center_selected"] title:@"Message"];
    
    MZ_Discover_VC *discover = [[MZ_Discover_VC alloc] init];
    [self setUpOneVC:discover image:[UIImage imageWithOriginalMode:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalMode:@"tabbar_discover_selected"] title:@"Discover"];
    
    MZ_Profile_VC *profile = [[MZ_Profile_VC alloc] init];
    [self setUpOneVC:profile image:[UIImage imageWithOriginalMode:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalMode:@"tabbar_profile_selected"] title:@"Me"];
}

- (void)setUpOneVC:(UITableViewController*)VC image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    VC.tabBarItem.image =image;
    VC.tabBarItem.selectedImage = selectedImage;
    VC.title = title;
    
    MZ_Navigation_VC *nav = [[MZ_Navigation_VC alloc] initWithRootViewController:VC];
    
    [self addChildViewController:nav];
    
    //NSLog(@"%@",nav.childViewControllers);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
