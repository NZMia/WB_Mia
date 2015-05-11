//
//  MZ-NewFeature-VC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 15/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-NewFeature-VC.h"
#import "MZTabBarVC.h"

@interface MZ_NewFeature_VC ()
- (IBAction)start:(UIButton *)sender;

@end

@implementation MZ_NewFeature_VC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view = [[NSBundle mainBundle]loadNibNamed:@"MZ-NewFeature-VC"owner:self options:nil].lastObject;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(UIButton *)sender {
    
    MZTabBarVC *tabBarVC = [[MZTabBarVC alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
}
@end
