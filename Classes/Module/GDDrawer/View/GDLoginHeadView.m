
//
//  GDLoginHeadView.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/29.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDLoginHeadView.h"

@implementation GDLoginHeadView

+(instancetype)LoginHeadView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"GDLoginHeadView" owner:nil options:nil]lastObject];
}

- (IBAction)loginButtonAction:(UIButton *)sender {
    //NSLog(@"登录");
    if ([self.myDelegate respondsToSelector:@selector(loginButtonAction)]) {
        [self.myDelegate loginButtonAction];
    }
}

- (IBAction)registerButtonAction:(UIButton *)sender {
   // NSLog(@"注册");
    if ([self.myDelegate respondsToSelector:@selector(registerButtonAction)]) {
        [self.myDelegate registerButtonAction];
    }
}


@end
