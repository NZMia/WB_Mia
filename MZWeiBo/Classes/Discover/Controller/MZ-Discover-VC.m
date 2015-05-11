//
//  MZ-Discover-VC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 1/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Discover-VC.h"

#import "MZ-Discover-SearchB.h"

@interface MZ_Discover_VC ()<UITextFieldDelegate>

@property (weak,nonatomic)MZ_Discover_SearchB *searchBar;
@end


@implementation MZ_Discover_VC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    MZ_Discover_SearchB *searchBar = [[MZ_Discover_SearchB alloc]init];
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    self.searchBar =searchBar;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.searchBar.background = [UIImage imageNamed:@"searchbar_textfield_background"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    
    return YES;
}

- (void)cancel:(UIBarButtonItem *)item
{
    self.searchBar.leftIconImageName = @"searchbar_textfield_search_icon";
    [self.searchBar endEditing:YES];
    
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.searchBar endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
