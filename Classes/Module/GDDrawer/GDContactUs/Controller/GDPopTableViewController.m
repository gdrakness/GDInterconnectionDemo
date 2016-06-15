

//
//  GDPopTableViewController.m
//  GDInterconnectionDemo
//
//  Created by gdarkness on 16/5/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDPopTableViewController.h"
#import "UIViewController+ENPopUp.h"

@interface GDPopTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIImageView *titelIcon;
@property (nonatomic, strong) UIButton *cancelBtn;

@end

@implementation GDPopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *loadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 360)];
    
    loadView.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 90, 300, 243) style:UITableViewStylePlain];
    
    [self.cancelBtn addTarget:self action:@selector(dismissPopView) forControlEvents:UIControlEventTouchUpInside];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    
    tableView.scrollEnabled = NO;
    tableView.separatorStyle = NO;
    
    [loadView addSubview:self.titelIcon];
    [loadView addSubview:tableView];
    [loadView addSubview:self.cancelBtn];
    
    [self.view addSubview:loadView];
    
    
    // Do any additional setup after loading the view.
}


//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    self.tableView.scrollEnabled = NO;
//    
//    //    self.tableView.userInteractionEnabled = NO;
//    
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *Identifier = @"Identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        //        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"全国售前热线：4000-138-000";
            break;
        case 1:
            cell.textLabel.text = @"             ：0756-3810563";
            break;
        case 2:
            cell.textLabel.text = @"全国售后热线：4000-128-000";
            break;
        case 3:
            cell.textLabel.text = @"             ： 0756-3810500";
            break;
        case 4:
            cell.textLabel.text = @"联系QQ客服： 800029900";
            break;
        case 5:
            cell.textLabel.text = @"微信服务号：时代互联（now-cn)";
            break;
            
        default:
            break;
    }
    return cell;
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
-(UIButton *)cancelBtn{
    
    if (!_cancelBtn) {
        
        _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 317, 300, 44)];
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
