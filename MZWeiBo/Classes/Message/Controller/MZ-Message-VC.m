//
//  MZ-Message-VC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 1/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Message-VC.h"

#import "MZ-Default-View.h"

@interface MZ_Message_VC ()

@end

@implementation MZ_Message_VC

//- (void)loadView
//{
//    MZ_Default_View *messageDefault = [MZ_Default_View defaultCenterView];
//    messageDefault.midIcontableName = @"visitordiscover_image_message";
//    messageDefault.descripition = @"The comment or message leaving will be displayed while the account is login";
//    self.view = messageDefault;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *messageRight = [[UIBarButtonItem alloc] initWithTitle:@"Chat" style:UIBarButtonItemStylePlain target:self action:@selector(messageChat)];
    self.navigationItem.rightBarButtonItem = messageRight;
    
    if (self.defaultCenter != nil) {
        
        self.defaultCenter.midIcontableName = @"visitordiscover_image_message";
        self.defaultCenter.descripition = @"The comment or message leaving will be displayed while the account is login";
    }
}

- (void)messageChat
{
    NSLog(@"TODO:message_rightNavItem_chatWithFriends");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    }



@end
