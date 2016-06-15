


//
//  GDContactUsController.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/29.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDContactUsController.h"
//#import "GDPoPTableView.h"

#import "UIViewController+ENPopUp.h"
#import "GDPopTableViewController.h"

@interface GDContactUsController ()

@end

@implementation GDContactUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    UIButton *button = [[UIButton alloc]initWithFrame:self.view.bounds];
    
    [button setTitle:@"test" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

//-(void)test{
//    
//    GDPoPTableView *popView = [GDPoPTableView popTableView];
//    
//    
//    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 360)];
//                    
//    CGFloat pickeX = self.view.center.x - view.frame.size.width*0.5;
//    view.frame = CGRectMake(pickeX,180, 300, 350);
//    
//    [view addSubview:popView];
//    
//    [self.view addSubview:view];
//    
//}

-(void)test1{
    
    GDPopTableViewController *popView = [[GDPopTableViewController alloc]init];
    
    CGFloat pickeX = self.view.center.x - popView.view.frame.size.width*0.5;
    popView.view.frame = CGRectMake(pickeX,500, 300, 360);
    
    [self presentPopUpViewController:popView];
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
