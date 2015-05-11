//
//  MZ-Home-VC.m
//  MZWeiBo
//
//  Created by Mia.Zhang on 1/04/15.
//  Copyright (c) 2015 Mia.Zhang. All rights reserved.
//

#import "MZ-Home-VC.h"
#import "MZ-Home-TitleBtn.h"
#import "MZ-Home-popView.h"
#import "MZ-Default-View.h"

#import "UIBarButtonItem+Extension.h"
#import "UIImage+image.h"
#import "UIView+Frame.h"
#import "UIImage+imageStretch.h"
#import "AFNetworking.h"
#import "MZ-OAuth-Tool.h"
#import "MZ-OAuth-Account.h"

#import "UIImageView+WebCache.h"
#import "MZ-Home-Status.h"
#import "MZ-Home-StatuesFrame.h"
#import "MZ-Home-RefreshFoot-V.h"
#import "MZ-Home-TableViewCell.h"
#import "MJRefresh.h"
@interface MZ_Home_VC () <MZ_Home_popView_delegate>
@property (nonatomic, weak) MZ_Home_TitleBtn *HomeTitle;
@property (nonatomic, strong)NSMutableArray *statusFrames;
@property (nonatomic, weak) UIRefreshControl *refresh;
@end

@implementation MZ_Home_VC

- (NSMutableArray *)statusFrames
{
    if (!_statusFrames) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.defaultCenter != nil) {
        [self.defaultCenter startRotate];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.defaultCenter != nil) {
        [self.defaultCenter stopRotate];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  /*
    MZ_Home_RefreshFoot_V
    *refreshFootV = [MZ_Home_RefreshFoot_V refreshFootView];
    refreshFootV.frame = CGRectMake(0, 0, 998, 30);
    self.tableView.tableFooterView = refreshFootV;
    self.tableView.tableFooterView.hidden = YES;
 */
    [self settingNav];
    [self settingDefaultCenter];
    
    if (self.defaultCenter == nil) {
        [self settingUserInfo];
        //[self loadingStatuses];
        [self addRefresh];
    }
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.statusFrames.count == 0 || self.tableView.tableFooterView.hidden == NO) {
        return;
    }
    
    CGFloat offsetY = scrollView.contentSize.height - scrollView.height +30;
    
    //NSLog(@"offsetY = %f",offsetY);
    
    if (scrollView.contentOffset.y >= offsetY) {
        self.tableView.tableFooterView.hidden = NO;
        [self loadingMore];
    }
}
- (void)settingNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_friendsearch" highlightedImage:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendAdd)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_pop" highlightedImage:@"navigationbar_pop_highlighted" target:self action:@selector(scan)];
    
    MZ_Home_TitleBtn *titleBtn = [[MZ_Home_TitleBtn alloc] init];
    
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    [titleBtn setTitle:@"Home" forState:UIControlStateNormal];
    [titleBtn sizeToFit];
    
    [titleBtn addTarget:self action:@selector(PopTitle:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleBtn;
    self.HomeTitle = titleBtn;
}
- (void)settingDefaultCenter
{
    if (self.defaultCenter != nil) {
        self.defaultCenter.turntableName = @"visitordiscover_feed_image_smallicon";
        self.defaultCenter.midIcontableName = @"visitordiscover_feed_image_house";
        self.defaultCenter.descripition = @"The latest news will be shown when you following with them";
    }
}
- (void)settingUserInfo
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    MZ_OAuth_Account *account = [MZ_OAuth_Tool accountRead];
    parameter[@"access_token"] = account.access_token;
    parameter[@"uid"] = account.uid;
    
    NSString *url = @"https://api.weibo.com/2/users/show.json";
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *iconURL = responseObject[@"profile_image_url"];
        if ([account.profile_image_url isEqualToString:iconURL]) {
            return;
        }
        account.profile_image_url = iconURL;
        [MZ_OAuth_Tool saveAccountInfor:account];
        NSLog(@"request is successful = %@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"request is failed = %@",error);
    }];

}

- (void)loadingStatuses
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"https://api.weibo.com/2/statuses/home_timeline.json";
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"access_token"] = [[MZ_OAuth_Tool accountRead] access_token];
    parameter[@"count"] = @(20);
   
//    MZ_Home_Status *currentStatus = [self.statusFrames firstObject];
    MZ_Home_StatuesFrame *statusFrame = [self.statusFrames firstObject];
    MZ_Home_Status *status = statusFrame.statues;
    if (status != nil) {
        parameter[@"since_id"] = status.idstr;
    }
    
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *dict = responseObject[@"statuses"];
        NSMutableArray *models = [MZ_Home_Status arrayOfModelsFromDictionaries:dict];
        
        /**
         *  注意， 一旦继承对象换了比如 statues --- statuesFrame
            一定要将数据模型数组转换为新的frame模型数组
         */
        NSMutableArray *frameModel = [self frameModelWitModels:models];
        
        NSRange range = NSMakeRange(0, frameModel.count);
        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
        
        [self.statusFrames insertObjects:frameModel atIndexes:set];
        
        /*NSRange range = NSMakeRange(0, models.count);
        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
        
        [self.statusFrames insertObjects:models atIndexes:set];*/
        [self.tableView reloadData];
         [self.tableView headerEndRefreshing];
        
        [self showCountsOfNewWeiBo:models.count];
        NSLog(@"%ld",frameModel.count);
        //NSLog(@"refresh success = %@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"refresh failed = %@",error);
        
        [self.tableView headerEndRefreshing];
      
    }];
    
}
- (void)loadingMore
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"https://api.weibo.com/2/statuses/home_timeline.json";

    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"access_token"] = [[MZ_OAuth_Tool accountRead] access_token];
    
    MZ_Home_StatuesFrame *statusFrame = [self.statusFrames lastObject];
    MZ_Home_Status *status = statusFrame.statues;
    if (status != nil) {
        parameters[@"max_id"] = status.idstr;
    }
    
   [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
       NSArray *dict = responseObject[@"statuses"];
       NSArray *models = [MZ_Home_Status arrayOfModelsFromDictionaries:dict];
       
       NSMutableArray *frameModel =[self frameModelWitModels:models];
       
       [self.statusFrames addObjectsFromArray:frameModel];
       [self.tableView reloadData];
       [self.tableView footerEndRefreshing];
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
       [self.tableView footerEndRefreshing];
   }];
}

- (void)addRefresh
{
//    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
//    [self.tableView addSubview:refresh];
//    self.refresh = refresh;
//    
//    [refresh addTarget:self action:@selector(loadingStatuses) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addHeaderWithTarget:self action:@selector(loadingStatuses)];
    
    [self.tableView headerBeginRefreshing];
    [self.tableView addFooterWithTarget:self action:@selector(loadingMore)];
}

- (void)showCountsOfNewWeiBo:(NSInteger)counts
{
    UILabel *label = [[UILabel alloc]init];
    
    label.backgroundColor = [UIColor orangeColor];
    label.alpha = 0.0;
    label.textAlignment = NSTextAlignmentCenter;
    
    if (counts > 0) {
        label.text = [NSString stringWithFormat:@"%luNew WeiBo",counts];
    }else{
        label.text = @"no new";
    }
    
    label.height = 30;
    label.width = self.view.frame.size.width;
    label.x = 0;
    label.y = 64 - label.height;
    [self.navigationController.view insertSubview:label aboveSubview:self.navigationController.navigationBar];
    
    [UIView animateWithDuration:1 animations:^{
        
        label.alpha = 0.7;
        label.transform = CGAffineTransformMakeTranslation(0, label.height);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:1 delay:1 options:0 animations:^{
            
            label.alpha = 0.0;
            label.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
            
        }];
    }];

}

- (void)friendAdd
{
    NSLog(@"TODO---Home--leftNavigationItem");
}

- (void)scan
{
    NSLog(@"TODO---Home--rightNavigationItem");
}

- (void)PopTitle:(MZ_Home_TitleBtn *)btn
{
    btn.selected = !btn.selected;
   
    UITableView *content = [[UITableView alloc]init];
    content.backgroundColor = [UIColor grayColor];
    content.frame = CGRectMake(100, 100, 200, 300);
    
    MZ_Home_popView *popView = [[MZ_Home_popView alloc]initwithFromView:btn Content:content delegate:self];
    [popView showPopView];
    
    [popView addTarget:self action:@selector(popViewDismiss:) forControlEvents:UIControlEventTouchUpInside];
    
}



- (void)popViewDismiss:(MZ_Home_popView *)popBtn
{
    [popBtn removeFromSuperview];
}

-(void)popViewBtnDidClick:(MZ_Home_popView *)popView
{
    [popView dismissPopView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MZ_Home_TableViewCell *cell = [MZ_Home_TableViewCell cellWithTableView:tableView];
    cell.statuesFrame = self.statusFrames[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MZ_Home_StatuesFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHight;
}

- (NSArray *)frameModelWitModels:(NSArray *)models
{
    NSMutableArray *frameModels = [NSMutableArray arrayWithCapacity:models.count];
    for (MZ_Home_Status *status in models) {
        MZ_Home_StatuesFrame *statuesFrame = [[MZ_Home_StatuesFrame alloc]init];
        statuesFrame.statues = status;
        [frameModels addObject:statuesFrame];
    }
    return frameModels;
}
@end
