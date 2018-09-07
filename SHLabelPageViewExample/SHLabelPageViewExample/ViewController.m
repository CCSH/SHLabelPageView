//
//  ViewController.m
//  SHLabelPageView
//
//  Created by CSH on 2018/7/10.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import "ViewController.h"
#import "SHLabelPageView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *bigScroll;
@property (weak, nonatomic) IBOutlet UILabel *num;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.bigScroll.delegate = self;
    
    NSArray *pageList = @[@"最新",@"热门",@"精华"];
    
    //初始化
    SHLabelPageView *pageView = [SHLabelPageView shareSHLabelPageView];
    pageView.frame = CGRectMake(0, 64, self.view.frame.size.width, 50);
    pageView.pageList = pageList;
    pageView.type = SHLabelPageType_one;
    //回调
    pageView.pageViewBlock = ^(SHLabelPageView *pageView) {
        self.num.text = [NSString stringWithFormat:@"当前内容\n 《%@》",pageView.pageList[pageView.index]];
        //最好不要加动画
        [self.bigScroll setContentOffset:CGPointMake(pageView.index *self.view.frame.size.width, 0) animated:NO];
    };
    
    pageView.index = 1;
    //刷新界面
    [pageView reloadView];
    
    [self.view addSubview:pageView];
    
    [self addScrollPage];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isEqual:self.bigScroll]) {

        CGFloat value = scrollView.contentOffset.x / scrollView.frame.size.width;
        
        //设置偏移
        [SHLabelPageView shareSHLabelPageView].contentOffsetX = value;
    }
}
- (IBAction)btnAction:(id)sender {
    
    SHLabelPageView *pageView = [SHLabelPageView shareSHLabelPageView];
    NSArray *pageList;
    
    if (pageView.type == SHLabelPageType_one) {
        
        pageView.type = SHLabelPageType_more;
        pageList = @[@"头条",@"娱乐",@"热点",@"体育",@"泉州",@"网易号",@"财经",@"科技",@"汽车",@"时尚",@"图片",@"跟贴",@"房产",@"直播",@"轻松一刻",@"段子",@"军事",@"历史",@"家居",@"独家",@"游戏",@"健康",@"政务",@"哒哒趣闻",@"美女",@"NBA",@"社会",@"彩票",@"漫画",@"影视歌",@"中国足球",@"国际足球",@"CBA",@"跑步",@"手机",@"数码",@"移动互联",@"云课堂",@"态度公开课",@"旅游",@"读书",@"酒香",@"教育",@"亲子",@"暴雪游戏",@"情感",@"艺术",@"博客",@"论坛",@"型男",@"萌宠"];
        pageView.index = 0;
    }else{
        
        pageView.type = SHLabelPageType_one;
        pageList = @[@"最新",@"热门",@"精华"];
        pageView.index = 1;
    }
    pageView.pageList = pageList;
    [pageView reloadView];
    
    [self addScrollPage];
}

- (void)addScrollPage{
    
    for (UIView *view in self.bigScroll.subviews) {
        [view removeFromSuperview];
    }
    
    for (int i = 0; i < [SHLabelPageView shareSHLabelPageView].pageList.count; i++) {
        
        UILabel *lab = [[UILabel alloc]init];
        lab.frame = CGRectMake(i*self.view.frame.size.width,30, self.view.frame.size.width, 30);
        lab.backgroundColor = [UIColor redColor];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = [NSString stringWithFormat:@"当前是第  %d   个",i];
        [self.bigScroll addSubview:lab];
    }
    self.bigScroll.contentSize = CGSizeMake([SHLabelPageView shareSHLabelPageView].pageList.count * self.view.frame.size.width, self.bigScroll.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
