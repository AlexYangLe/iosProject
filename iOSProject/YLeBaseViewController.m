//
//  YLeBaseViewController.m
//  iOSProject
//
//  Created by yanglele on 2018/4/20.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import "YLeBaseViewController.h"
#import "YLeBaseNavigationController.h"
#import "YLeCenterTabbar.h"

@interface YLeBaseViewController ()<UITabBarControllerDelegate>

@property(nonatomic, strong) YLeCenterTabbar *yLeCenterTab;
@property(nonatomic, assign) NSInteger selectItem;
@end

@implementation YLeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.yLeCenterTab = [[YLeCenterTabbar alloc] init];
    self.yLeCenterTab.tintColor = [UIColor redColor];
    
    [self.yLeCenterTab.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    //利用kvc 将自己的tabbar赋值给系统的tabbar
    [self setValue:self.yLeCenterTab forKeyPath:@"tabBar"];
    
    [self initWithTabbar];
    self.selectItem = 0;
    
    self.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initWithTabbar{
    [UITabBar appearance].translucent = YES;//不透明
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    YLeBaseNavigationController *navClub = (YLeBaseNavigationController *)[[YLeBaseNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    YLeBaseNavigationController *navVideo = [(YLeBaseNavigationController *)[YLeBaseNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    YLeBaseNavigationController *navHome = [(YLeBaseNavigationController *)[YLeBaseNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    YLeBaseNavigationController *navLive = [(YLeBaseNavigationController *)[YLeBaseNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    YLeBaseNavigationController *navMe = [(YLeBaseNavigationController *)[YLeBaseNavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    
    [self addChildVC:navClub title:@"" image:@"club_n" selectedImage:@"club"];//Club
    [self addChildVC:navVideo title:@"" image:@"video_n" selectedImage:@"video"];//Live
    [self addChildVC:navHome title:@"Home" image:@"" selectedImage:@""];
    [self addChildVC:navLive title:@"" image:@"live_n" selectedImage:@"live"];//Video
    [self addChildVC:navMe title:@"" image:@"me_n" selectedImage:@"me"];//Me
    
}

-(void)addChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 5, -5, -5);
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateSelected];
    [self addChildViewController:childVC];
}

-(void)centerBtnClick:(id *)sender{
    NSLog(@"center btn click");
    self.selectedIndex = 2;
    if (self.selectItem != 2) {
        [self rotationAnimation];
    }
    self.selectItem = 2;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if(tabBarController.selectedIndex == 2){
        if (self.selectItem != 2) {
            [self rotationAnimation];
        }
    }else{
        [self.yLeCenterTab.centerBtn.layer removeAnimationForKey:@"shark"];
//        [self.yLeCenterTab.centerBtn.layer removeAllAnimations];
    }
    self.selectItem = tabBarController.selectedIndex;
}


//抖动
-(void)rotationAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.rotation";
//    animation.repeatCount = 20;
    animation.repeatDuration = 60.0;
    animation.values = @[@(-M_PI_4 * 0.3),@(M_PI_4 * 0.3),@(-M_PI_4 * 0.3)];
    [self.yLeCenterTab.centerBtn.layer addAnimation:animation forKey:@"shark"];
}


@end
