//
//  YLeMVPViewController.m
//  iOSProject
//
//  Created by yanglele on 2018/4/20.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import "YLeMVPViewController.h"
#import "YLePresenter.h"

@interface YLeMVPViewController ()<YLeMVProtocol>

@property(nonatomic, strong) YLePresenter *presenter;

@end

@implementation YLeMVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.ageLabel];
    [self.view addSubview:self.tapBtn];
    self.presenter = [YLePresenter new];
    [self.presenter attachView:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonClicked{
    [self.presenter reloadView];
}

-(void)setName:(NSString *)name{
    self.nameLabel.text = name;
}

-(void)setAge:(NSString *)age{
    self.ageLabel.text = age;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 80, 40)];
        _nameLabel.backgroundColor = [UIColor blackColor];
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}

-(UILabel *)ageLabel{
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 140, 80, 40)];
        _ageLabel.backgroundColor = [UIColor blackColor];
        _ageLabel.textColor = [UIColor whiteColor];
    }
    return _ageLabel;
}

-(UIButton *)tapBtn{
    if (!_tapBtn) {
        _tapBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 200, 80, 40)];
        [_tapBtn setTitle:@"按钮" forState:UIControlStateNormal];
        [_tapBtn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapBtn;
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
