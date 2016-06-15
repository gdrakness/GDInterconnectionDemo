//
//  GDAboutUsController.h
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/29.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDAboutUsControllerDelegate <NSObject>

-(void)cancelButtonAction;

@end

@interface GDAboutUsController : UIViewController
@property (nonatomic, weak) id<GDAboutUsControllerDelegate> delegate;
@end
