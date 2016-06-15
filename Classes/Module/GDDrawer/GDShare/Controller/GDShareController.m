//
//  GDShareController.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/29.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDShareController.h"
#import "GDLoginView.h"
#import <OpenShareHeader.h>
//
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif

@interface GDShareController ()<GDLoginViewDelegate>

@end

@implementation GDShareController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    GDLoginView *login = [GDLoginView loginView];
    
//    UIView *view  = [[UIView alloc]initWithFrame:self.view.bounds];
//    
//    [view addSubview:login];
    login.delegate = self;
    
    [self.view addSubview:login];
    
}

-(void)oauthWeiboMethod{
    
    [OpenShare WeiboAuth:@"all" redirectURI:@"https://api.weibo.com/37283605" Success:^(NSDictionary *message) {
        ULog(@"微博登录成功:\n%@",message);
    } Fail:^(NSDictionary *message, NSError *error) {
        ULog(@"微博登录成功:\n%@",message);
    }];
}

-(void)oauthQQMethod{
    
    [OpenShare QQAuth:@"snsapi_userinfo" Success:^(NSDictionary *message) {
        ULog(@"QQ登录成功:\n%@",message);
    } Fail:^(NSDictionary *message, NSError *error) {
        ULog(@"QQ登录失败:\n%@\n%@",message,error);
    }];
}

-(void)oauthWeixinMethod{
    NSLog(@"weixin");
    [OpenShare WeixinAuth:@"snsapi_userinfo" Success:^(NSDictionary *message) {
        ULog(@"微信登录成功:\n%@",message);
    } Fail:^(NSDictionary *message, NSError *error) {
        ULog(@"微信登录失败:\n%@\n%@",message,error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
