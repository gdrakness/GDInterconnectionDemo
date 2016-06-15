//
//  GDDrawerViewController.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/29.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDrawerViewController.h"

#import "GDEnterpriseServiceController.h"
#import "GDControlCenterController.h"
#import "GDContactUsController.h"
#import "GDShareController.h"
#import "GDAboutUsController.h"
#import "GDPopTableViewController.h"
#import "GDAboutUsController.h"


#import "UIViewController+ENPopUp.h"

#import "GDLoginHeadView.h"
#import "GDCustomShareView.h"

#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>
#import <MMDrawerController.h>
#import <OpenShareHeader.h>

@interface GDDrawerViewController ()<GDLoginHeadViewDelegate,GDPopTableViewControllerDelegate,GDAboutUsControllerDelegate,GDCustomShareViewDelegate>

@property (nonatomic, strong) NSArray *titleArr;

@property (nonatomic, strong) GDCustomShareView *shareWeixinView;
@end

@implementation GDDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArr = @[@[@"企业服务",@"控制中心"],@[@"联系我们",@"分享好友",@"关于我们"]];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.scrollEnabled = NO;
    
//    GDLoginHeadView *loginView = [GDLoginHeadView LoginHeadView];
    
    //    self.tableView.tableHeaderView = loginView;
//    loginView.myDelegate = self;
    
//    [self.tableView setTableHeaderView:loginView];
//    self.tableView.tableHeaderView = loginView;
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    NSArray *sectionArr = self.titleArr[section];
    return sectionArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
    
        NSArray *sectionArr = self.titleArr[indexPath.section];
        cell.textLabel.text = sectionArr[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return  100;
    }
    return  10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc]init];
    
    if (section == 0) {
        
        GDLoginHeadView *loginHeadView = [GDLoginHeadView LoginHeadView];
        
        loginHeadView.myDelegate =self;
        
        return loginHeadView;
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        GDEnterpriseServiceController *enterpriseVC = [[GDEnterpriseServiceController alloc]init];
        [nav pushViewController:enterpriseVC animated:YES];
        
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        GDControlCenterController *controlVC = [[GDControlCenterController alloc]init];
        [nav pushViewController:controlVC animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        [self LoadPopView];
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        
        [nav.view addSubview:self.shareWeixinView];
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        
        [self LoadPopAboutView];
    }
    
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}

-(void)loginButtonAction{
    NSLog(@"登录");
    
    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    
    GDShareController *loginView = [[GDShareController alloc]init];
    
    [nav pushViewController:loginView animated:YES];
    
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}

-(void)registerButtonAction{
    NSLog(@"注册");
}

-(void)LoadPopView{
    
    GDPopTableViewController *popView = [[GDPopTableViewController alloc]init];
    
    CGFloat pickeX = self.view.center.x - popView.view.frame.size.width*0.5;
    popView.view.frame = CGRectMake(pickeX,500, 300, 360);
    
    popView.delegate = self;
    
    [self presentPopUpViewController:popView];
}

-(void)cancelButtonAction{
    
    [self dismissPopUpViewController];
}

-(void)LoadPopAboutView{
    
    GDAboutUsController *aboutView = [[GDAboutUsController alloc]init];
    
    CGFloat pickeX = self.view.center.x - aboutView.view.frame.size.width*0.5;
    aboutView.view.frame = CGRectMake(pickeX,500, 300, 270);
    aboutView.delegate = self;
    
    [self presentPopUpViewController:aboutView];
}

-(GDCustomShareView *)shareWeixinView{
    
    if (_shareWeixinView) {
        _shareWeixinView = nil;
    }
    if (!_shareWeixinView) {
        _shareWeixinView = [[GDCustomShareView alloc]addGuanjiaShareView];
        _shareWeixinView.delegate = self;
        [_shareWeixinView setShareAry:[GDCustomShareView shareGuanjiaArr] delegate:self];
    }
    return _shareWeixinView;
}

-(void)CustomShareViewButtonAction:(GDCustomShareView *)shareView title:(NSString *)title{
    
 //   NSLog(@"当前点击的是:%@",title);
    
    if ([title isEqualToString:@"朋友圈"]) {
        
        OSMessage *msg=[[OSMessage alloc]init];
        msg.title=@"微信分享到朋友圈成功command = 2040;country = CN;language = en;messageExt WX_GameCenter;objectType = 0;openID = oyAaTjogUwv8P-OrYWXaRrfwwQwA;result = 1;returnFromApp = 0;sdkver = 1.5";
        [OpenShare shareToWeixinTimeline:msg Success:^(OSMessage *message) {
            NSLog(@"微信分享到朋友圈成功：\n%@",message);
        } Fail:^(OSMessage *message, NSError *error) {
            NSLog(@"微信分享到朋友圈失败：\n%@\n%@",error,message);
        }];
    }
}

@end
