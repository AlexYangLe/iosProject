//
//  YLeMVProtocol.h
//  iOSProject
//
//  Created by yanglele on 2018/4/20.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef YLeMVProtocol_h
#define YLeMVProtocol_h

//Presenter 向 view 发送数据
@protocol YLeMVProtocol <NSObject>

-(void)setName:(NSString *)name;
-(void)setAge:(NSString *)age;

@end

#endif /* YLeMVProtocol_h */
