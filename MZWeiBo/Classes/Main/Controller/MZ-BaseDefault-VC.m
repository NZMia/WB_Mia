//
//  MZ-BaseDefault-VC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 10/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-BaseDefault-VC.h"
#import "MZ-Default-View.h"
#import "MZ-OAuth-VC.h"
#import "MZ-OAuth-Account.h"
#import "MZ-OAuth-Tool.h"
@interface MZ_BaseDefault_VC () <MZ_Default_View_Delegate>

@end

@implementation MZ_BaseDefault_VC

- (void)loadView
{
    MZ_OAuth_Account *account = [MZ_OAuth_Tool accountRead];
    
    if (account == nil) {
        MZ_Default_View *defaultCenter = [MZ_Default_View defaultCenterView];
        
        self.view = defaultCenter;
        self.defaultCenter = defaultCenter;
        
        defaultCenter.delegate = self;
    }else{
        
        UITableView*tableView = [[UITableView alloc]init];
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view = tableView;
    }
}

- (void)defaultCenterView:(MZ_Default_View *)defaultCenterView didClickLoginBtn:(UIButton *)loginBtn
{
    MZ_OAuth_VC *OAuth = [[MZ_OAuth_VC alloc]init];
    
    UINavigationController *OAuthNav = [[UINavigationController alloc] initWithRootViewController:OAuth];
    [self presentViewController:OAuthNav animated:YES completion:nil];
}

- (void)defaultCenterView:(MZ_Default_View *)defaultCenterView didClickRegisterBtn:(UIButton *)registerBtn
{
    NSLog(@"TODO: register_view");
}

@end
