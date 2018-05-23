
//
//  YLeCenterTabbar.m
//  iOSProject
//
//  Created by yanglele on 2018/5/22.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import "YLeCenterTabbar.h"

@implementation YLeCenterTabbar

-(instancetype)init{
    if (self = [super init]) {
        [self setViews];
    }
    return self;
}

-(void)setViews{
    self.centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImg = [UIImage imageNamed:@"home"];
    
    self.centerBtn.frame = CGRectMake(0, 0, normalImg.size.width, normalImg.size.height);
    [self.centerBtn setImage:normalImg forState:UIControlStateNormal];
    //btn center的位置位于tabbar的上边沿
    self.centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - normalImg.size.width)/2.0, -normalImg.size.height/2.0, normalImg.size.width, normalImg.size.height);
    
    [self addSubview:self.centerBtn];
}

//超出区域外点击无效
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.hidden) {
        return [super hitTest:point withEvent:event];
    }else{
        //将centerBtn上的点转化成父View上的点
        CGPoint touch = [self.centerBtn convertPoint:point fromView:self];
        //判断点击的点是否在按钮的区域内
        if (CGRectContainsPoint(self.centerBtn.bounds, touch)) {
            return _centerBtn;
        }else{
            return [super hitTest:point withEvent:event];
        }  
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
