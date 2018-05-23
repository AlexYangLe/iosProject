//
//  YLePresenter.m
//  iOSProject
//
//  Created by yanglele on 2018/4/20.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import "YLePresenter.h"
#import "YLeMVPModel.h"
@interface YLePresenter()

@property(nonatomic, weak) id <YLeMVProtocol> view;
@property(nonatomic, strong) YLeMVPModel *model;

@end

@implementation YLePresenter

-(instancetype)init{
    self = [super init];
    if (self) {
        self.model = [YLeMVPModel new];
        self.model.name = @"Alex";
        self.model.age = @"18";
    }
    return self;
}

-(void)attachView:(id<YLeMVProtocol>)attachView{
    self.view = attachView;
}

-(void)reloadView{
    //处理数据
    [self.view setName:self.model.name];
    [self.view setAge:self.model.age];
}

@end
