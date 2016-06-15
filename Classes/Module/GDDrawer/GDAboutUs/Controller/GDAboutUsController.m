
//
//  GDAboutUsController.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/29.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDAboutUsController.h"

@interface GDAboutUsController ()

@property (nonatomic, strong) UIImageView *titelIcon;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIButton *cancelBtn;
@end

@implementation GDAboutUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *loadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 270)];
    loadView.backgroundColor = [UIColor whiteColor];
    
    [self.cancelBtn addTarget:self action:@selector(dismissPopView) forControlEvents:UIControlEventTouchUpInside];

    [loadView addSubview:self.titelIcon];
    [loadView addSubview:self.contentLab];
    [loadView addSubview:self.cancelBtn];
    
    [self.view addSubview:loadView];
    
}

-(void)dismissPopView{
    
    if ([_delegate respondsToSelector:@selector(cancelButtonAction)]) {
        [_delegate cancelButtonAction];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImageView *)titelIcon{
    
    if (!_titelIcon) {
        
        UIImage *image = [UIImage imageNamed:@"logo"];
        _titelIcon = [[UIImageView alloc]initWithFrame:CGRectMake(53, 5, 194, 59)];
        _titelIcon.image = image;
        
    }return _titelIcon;
    
}

-(UILabel *)contentLab{
    
    if (!_contentLab) {
        
        _contentLab = [[UILabel alloc]initWithFrame:CGRectMake(30, 70, 240, 140)];
        [_contentLab setText:@"广东时代互联科技有限公司，简称时代互联（www.now.cn）,是一家基于云计算的领先的互联网应用服务提供商，同时提供域名注册、海内外虚拟主机、云主机、企业邮箱、智能建站、多线DNS、云服务器、服务器租用、服务器托管等一系列信息化服务。"];
        _contentLab.textAlignment = NSTextAlignmentCenter;
        _contentLab.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLab.numberOfLines = 0;
        
    }return _contentLab;
}

-(UIButton *)cancelBtn{
    
    if (!_cancelBtn) {
        
        _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 226, 300, 44)];
        [_cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
        _cancelBtn.titleLabel.textColor = [UIColor whiteColor];
        [_cancelBtn setBackgroundColor:[UIColor orangeColor]];
        
    }return _cancelBtn;
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
