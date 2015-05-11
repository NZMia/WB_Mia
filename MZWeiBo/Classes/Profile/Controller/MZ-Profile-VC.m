//
//  MZ-Profile-VC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 1/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Profile-VC.h"

#import "UIBarButtonItem+Extension.h"
#import "UIImage+image.h"

#import "MZ-testOneVC.h"
#import "MZ-Default-View.h"

@interface MZ_Profile_VC ()

@end

@implementation MZ_Profile_VC

//- (void)loadView
//{
//    MZ_Default_View *profileDefault = [MZ_Default_View defaultCenterView];
//    
//    profileDefault.midIcontableName = @"visitordiscover_image_profile";
//    profileDefault.descripition = @"After Login, the microblog, photoes, and personal infro will be shown here for display";
//    self.view = profileDefault;
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *profileRight = [[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
    profileRight.tintColor = [UIColor orangeColor];
    self.navigationItem.rightBarButtonItem = profileRight;
    
    if (self.defaultCenter != nil) {
        self.defaultCenter.midIcontableName = @"visitordiscover_image_profile";
        self.defaultCenter.descripition = @"After Login, the microblog, photoes, and personal infro will be shown here for display";
    }
    
}

- (void)setting
{
    MZ_testOneVC *testOne =[[MZ_testOneVC alloc]init];
    
    testOne.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:testOne animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
