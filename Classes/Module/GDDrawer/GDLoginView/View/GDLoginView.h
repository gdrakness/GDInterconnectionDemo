//
//  GDLoginView.h
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDLoginViewDelegate <NSObject>

-(void)oauthWeiboMethod;

-(void)oauthQQMethod;

-(void)oauthWeixinMethod;

@end

@interface GDLoginView : UIView

@property (nonatomic, weak) id<GDLoginViewDelegate> delegate;

+(instancetype)loginView;
@end
