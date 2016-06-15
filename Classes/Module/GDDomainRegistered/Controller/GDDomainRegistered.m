//
//  GDDomainRegistered.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDomainRegistered.h"
#import <WebKit/WebKit.h>


@interface GDDomainRegistered ()<UIWebViewDelegate>

@property (nonatomic, strong)UIWebView *webView;
@end

@implementation GDDomainRegistered

-(void)viewDidLoad{
    [super viewDidLoad];

    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    
    [self.navigationController.navigationBar setTintColor:[UIColor grayColor]];
    
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    [self loadWebView];
}

-(void)loadWebView{
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    self.webView.delegate = self;
    
    [self.view addSubview:_webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.now.cn"]]];
    
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('header').remove();"];
    
    return YES;
}

@end
