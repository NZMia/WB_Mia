//
//  MZ-NewFeature-WelcomeVC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 14/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-NewFeature-WelcomeVC.h"
#import "MZ-OAuth-Account.h"
#import "MZ-OAuth-Tool.h"
#import "MZTabBarVC.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#import "UIImage+NJ.h"

@interface MZ_NewFeature_WelcomeVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *welcomeTitle;

@end

@implementation MZ_NewFeature_WelcomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view = [[NSBundle mainBundle]loadNibNamed:@"MZ-NewFeature-WelcomeVC" owner:self options:nil].lastObject;
    
    MZ_OAuth_Account *account = [MZ_OAuth_Tool accountRead];
    NSURL *url = [NSURL URLWithString:account.profile_image_url];
//    [self.icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default_big"]];
//    UIImage *circleImage = [self.icon.image circleImageWithBorderWidth:3 borderColor:[UIColor redColor]];
//    NSLog(@"%zd",[NSThread currentThread]);
//    self.icon.image = circleImage;
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:url options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if (image != nil) {
            
            UIImage *circleImage = [image circleImageWithBorderWidth:0 borderColor:nil];
            NSLog(@"%zd",[NSThread currentThread]);
            self.icon.image = circleImage;
        }
    }];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:2 animations:^{
        
        self.iconConstraint.constant = 200;
        self.icon.alpha = 1.0;
        [self.icon layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 animations:^{
            self.welcomeTitle.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIApplication sharedApplication].keyWindow.rootViewController = [[MZTabBarVC alloc]init];
        }];
    }];
}

@end
