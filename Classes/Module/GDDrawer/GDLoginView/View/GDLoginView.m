
//
//  GDLoginView.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDLoginView.h"

@interface GDLoginView ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;

@end

@implementation GDLoginView


+(instancetype)loginView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"GDLoginView" owner:nil options:nil]lastObject];
}


- (IBAction)oauthWeixinAction:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(oauthWeixinMethod)]) {
        [_delegate oauthWeixinMethod];
    }
}

- (IBAction)oauthQQAction:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(oauthQQMethod)]) {
        [_delegate oauthQQMethod];
    }
}

- (IBAction)oauthWeiboAction:(id)sender {
    
    if ([_delegate respondsToSelector:@selector(oauthWeiboMethod)]) {
        [_delegate oauthWeiboMethod];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
