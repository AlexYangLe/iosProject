//
//  YLeIntroductoryPagesView.m
//  iOSProject
//
//  Created by yanglele on 2018/4/25.
//  Copyright © 2018年 alexYang. All rights reserved.
//

#import "YLeIntroductoryPagesView.h"
@interface YLeIntroductoryPagesView()<UIScrollViewDelegate>

@property(nonatomic, strong) NSArray<NSString *> *imageArray;
@property(nonatomic, strong) UIPageControl *pageControl;
@property(nonatomic, weak) UIScrollView *scrollView;

@end

@implementation YLeIntroductoryPagesView

+(instancetype)pagesViewWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images{
    YLeIntroductoryPagesView *pagesView = [[YLeIntroductoryPagesView alloc] initWithFrame:frame];
    pagesView.imageArray = images;
    return pagesView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpOnce];
    }
    return self;
}

-(void)setUpOnce{
    self.backgroundColor = [UIColor clearColor];
    
    //添加手势,单指单击
    UITapGestureRecognizer *singleRecongnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapFrom)];
    singleRecongnizer.numberOfTapsRequired = 1;
    [self.scrollView addGestureRecognizer:singleRecongnizer];
}

-(void)setImageArray:(NSArray<NSString *> *)imageArray{
    _imageArray = imageArray;
    [self loadPageView];
}

-(void)loadPageView{
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    self.scrollView.contentSize = CGSizeMake((self.imageArray.count + 1) * CGRectGetWidth(<#CGRect rect#>), <#CGFloat height#>)
}


@end
