//
//  GDLoginHeadView.h
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/29.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDLoginHeadViewDelegate <NSObject>

-(void)loginButtonAction;

-(void)registerButtonAction;

@end

@interface GDLoginHeadView : UIView

@property (nonatomic, weak)id<GDLoginHeadViewDelegate> myDelegate;

+(instancetype)LoginHeadView;
@end
