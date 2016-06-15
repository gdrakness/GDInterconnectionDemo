//
//  GDTabBarController.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDTabBarController.h"
#import "GDDomainRegistered.h"
#import "GDVirtuaHost.h"
#import "GDEnterpriseMail.h"
#import "GDCloudServer.h"
#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)
#define GDTabBarNormalColor RGB(170, 170, 170)         // TabBar颜色
#define GDThemeColor RGB(249, 103, 80)        // TabBar选中颜色


@implementation GDTabBarController

+(void)initialize{
    
        NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
        normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        normalAttrs[NSForegroundColorAttributeName] = GDTabBarNormalColor;

        NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
        selectedAttrs[NSFontAttributeName] = normalAttrs[NSFontAttributeName];
        selectedAttrs[NSForegroundColorAttributeName] = GDThemeColor;

        UITabBarItem *appearance = [UITabBarItem appearance];
        [appearance setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
        [appearance setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self setNavgationBar];
    
    [self setChildViewController:[[GDDomainRegistered alloc]init] title:@"域名注册" image:@"tabADeselected" selectedImage:@"tabASelected"];
    [self setChildViewController:[[GDVirtuaHost alloc]init] title:@"虚拟主机" image:@"tabBDeselected" selectedImage:@"tabBSelected"];
    [self setChildViewController:[[GDEnterpriseMail alloc]init] title:@"企业邮箱" image:@"tabCDeselected" selectedImage:@"tabCSelected"];
    [self setChildViewController:[[GDCloudServer alloc]init] title:@"云服务器" image:@"tabDDeselected" selectedImage:@"tabDSelected"];
}


-(void)setChildViewController:(UIViewController *)childViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    childViewController.title = title;
    [childViewController.tabBarItem setImage:[UIImage imageNamed:image]];
    
    UIImage *select = [UIImage imageNamed:selectedImage];
    childViewController.tabBarItem.selectedImage = [select imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [childViewController.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    
    [self addChildViewController:childViewController];
    
}

-(void)setNavgationBar{

//    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(130, 80, 50, 20)];
//    titleLable.backgroundColor = [UIColor clearColor];
//    titleLable.text = @"时代互联";
//    self.navigationItem.titleView = titleLable;
    
//    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,15,60,60)];
//    NSArray *gifArray = [NSArray arrayWithObjects:
//                         [UIImage imageNamed:@"loginLogo"],
//                         [UIImage imageNamed:@"loginLogo"],
//                         [UIImage imageNamed:@"loginLogo"],
//                         [UIImage imageNamed:@"loginLogo"],
//                         nil];
//    gifImageView.animationImages = gifArray;
//    gifImageView.animationDuration = 1;
//    gifImageView.animationRepeatCount = 1;
//    [gifImageView startAnimating];
//    [self.view addSubview:gifImageView];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 45)];
    imageView.image = [UIImage imageNamed:@"nowcnLogo"];
    
    self.navigationItem.titleView = imageView;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu-button"] style:UIBarButtonItemStylePlain target:self action:@selector(lefgButtonAction)];
    
    self.navigationItem.leftBarButtonItem = leftBtn;

}
-(void)lefgButtonAction{
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
@end
