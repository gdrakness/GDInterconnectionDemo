//
//  GDPopTableViewController.h
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDPopTableViewControllerDelegate <NSObject>

-(void)cancelButtonAction;

@end

@interface GDPopTableViewController : UIViewController

@property (nonatomic, weak) id<GDPopTableViewControllerDelegate> delegate;
@end
