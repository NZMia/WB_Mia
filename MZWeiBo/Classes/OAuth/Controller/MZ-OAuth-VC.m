//
//  MZ-OAuth-VC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 10/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-OAuth-VC.h"

#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"

#import "MZ-OAuth-Account.h"
#import "MZ-OAuth-Tool.h"

#import "MZ-NewFeature-VC.h"
#import "MZ-NewFeature-WelcomeVC.h"
#import "UIWindow+RootVCChoose.h"
@interface MZ_OAuth_VC ()<UIWebViewDelegate>

@end

@implementation MZ_OAuth_VC

- (void)loadView
{
    self.view = [[UIWebView alloc]init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",@"1756583255",@"http://www.baidu.com"];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    UIWebView *webView = (UIWebView *)self.view;
    [webView loadRequest:request];
    webView.delegate = self;
    
    self.navigationItem.RightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtn)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor orangeColor];
}
- (void)cancelBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;
    //NSLog(@"%@",urlStr);
    /**
     *  CODE CUT OFF
     */
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.location != NSNotFound) {
        
        NSUInteger index = range.location + range.length;
        NSString *code = [urlStr substringFromIndex:index];
        //NSLog(@"access_token = %@",code);
        [self accessTokenWithCode:code];
        return NO;
    }
    
    return YES;
}

- (void)accessTokenWithCode:(NSString *)code
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSString *postUrl =@"https://api.weibo.com/oauth2/access_token";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"client_id"] = @"1756583255";
    parameters[@"client_secret"] = @"f01f8abb6bae27a3446586e51b8f18ad";
    parameters[@"grant_type"] = @"authorization_code";
    parameters[@"code"] = code;
    parameters[@"redirect_uri"] = @"http://www.baidu.com";
    
    [manager POST:postUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        MZ_OAuth_Account *account = [MZ_OAuth_Account accountWithDic:responseObject];
        BOOL successful = [MZ_OAuth_Tool saveAccountInfor:account];
        if (successful) {
            NSLog(@"successful");
        }
       
        [self dismissViewControllerAnimated:YES completion:nil];
        
        [[UIApplication sharedApplication].keyWindow RootViewControllerChoose];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error %@",error);
    }];

}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"LOADING......"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
