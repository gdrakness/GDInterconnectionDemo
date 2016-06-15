//
//  AppDelegate.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/28.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "AppDelegate.h"
#import <MMDrawerController.h>
#import "GDTabBarController.h"
#import "GDDrawerViewController.h"
#import "OpenShareHeader.h"

@interface AppDelegate ()
@property (nonatomic, strong) MMDrawerController *drawerController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [OpenShare connectQQWithAppId:@"1103194207"];
    [OpenShare connectWeiboWithAppKey:@"402180334"];
    [OpenShare connectWeixinWithAppId:@"wxd930ea5d5a258f4f"];
    [OpenShare connectRenrenWithAppId:@"228525" AndAppKey:@"1dd8cba4215d4d4ab96a49d3058c1d7f"];
    [OpenShare connectAlipay];//支付宝参数都是服务器端生成的，这里不需要key.
    
    GDTabBarController *mainVC = [[GDTabBarController alloc]init];
    GDDrawerViewController *leftVC = [[GDDrawerViewController alloc]init];
    
    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    UINavigationController *leftNav = [[UINavigationController alloc]initWithRootViewController:leftVC];
    
//    UIImage *backImage = [UIImage imageNamed:@"menu-button"];
//    UIImage *backButtonImage = [backImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
//    [[UIBarButtonItem appearance]setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance]setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
//    [mainNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}];
//    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    
    self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:mainNav leftDrawerViewController:leftNav];
    
    self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
    self.drawerController.maximumLeftDrawerWidth = [UIScreen mainScreen].bounds.size.width * 0.8;
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:self.drawerController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    //第二步：添加回调
    if ([OpenShare handleOpenURL:url]) {
        return YES;
    }
    //这里可以写上其他OpenShare不支持的客户端的回调，比如支付宝等。
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
