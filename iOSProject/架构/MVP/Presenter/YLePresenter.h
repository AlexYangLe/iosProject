//
//  YLePresenter.h
//  iOSProject
//
//  Created by yanglele on 2018/4/20.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLeMVProtocol.h"

@interface YLePresenter : NSObject

-(void)attachView:(id <YLeMVProtocol>)attachView;
-(void)reloadView;

@end
