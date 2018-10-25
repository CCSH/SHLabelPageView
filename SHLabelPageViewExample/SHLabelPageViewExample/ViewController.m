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

@property (nonatomic, strong) SHLabelPageView *pageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect frame = CGRectMake(90, 50, 15, 15);
    //添加标记
//    UIView *layer = [[UIView alloc]init];
//    layer.frame = frame;
//    layer.backgroundColor = [UIColor redColor];
    
    //添加标记
    CALayer *layer = [CALayer layer];
    layer.frame = frame;
    layer.cornerRadius = frame.size.height/2;
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"12345789765432123456789";
    lab.frame = CGRectMake(0, 300, self.view.width, 100);
    lab.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab];
    
    [lab.layer addSublayer:layer];
    
    self.bigScroll.delegate = self;
    
    //初始化
    self.pageView = [[SHLabelPageView alloc]init];
    self.pageView.frame = CGRectMake(0, 64, self.view.frame.size.width, 50);
    self.pageView.checkColor = [UIColor orangeColor];
    self.pageView.uncheckColor = [UIColor blackColor];
    //回调
    self.pageView.pageViewBlock = ^(SHLabelPageView *pageView) {
        
        self.num.text = [NSString stringWithFormat:@"当前内容\n 《%@》",pageView.pageList[pageView.index]];
        //最好不要加动画
        [self.bigScroll setContentOffset:CGPointMake(pageView.index *self.view.frame.size.width, 0) animated:NO];
    };
    
    [self btnAction:nil];
    
    [self.view addSubview:self.pageView];
    
    
    
    [self addScrollPage];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isEqual:self.bigScroll]) {

        CGFloat value = scrollView.contentOffset.x / scrollView.frame.size.width;
        
        //设置偏移
        self.pageView.contentOffsetX = value;
    }
}
- (IBAction)btnAction:(id)sender {
    

    if (self.pageView.type == SHLabelPageType_one) {
        
        self.pageView.startX = 10;
        self.pageView.spaceW = 20;
        self.pageView.type = SHLabelPageType_more;
        self.pageView.pageList = @[@"头条",@"娱乐",@"热点",@"体育",@"泉州",@"网易号",@"财经",@"科技",@"汽车",@"时尚",@"图片",@"跟贴",@"房产",@"直播",@"轻松一刻",@"段子",@"军事",@"历史",@"家居",@"独家",@"游戏",@"健康",@"政务",@"哒哒趣闻",@"美女",@"NBA",@"社会",@"彩票",@"漫画",@"影视歌",@"中国足球",@"国际足球",@"CBA",@"跑步",@"手机",@"数码",@"移动互联",@"云课堂",@"态度公开课",@"旅游",@"读书",@"酒香",@"教育",@"亲子",@"暴雪游戏",@"情感",@"艺术",@"博客",@"论坛",@"型男",@"萌宠"];
        self.pageView.index = 0;
    }else{

        self.pageView.startX = 0;
//        self.pageView.spaceW = 10;
        self.pageView.type = SHLabelPageType_one;
        self.pageView.pageList = @[@"关注",@"热门",@"最新"];
        self.pageView.labelTag = @{@"关注":[NSValue valueWithCGRect:CGRectMake(10, 20, 8, 8)]};
        self.pageView.index = 1;
    }

    [self.pageView reloadView];
    
    [self addScrollPage];
}

- (void)addScrollPage{
    
    for (UIView *view in self.bigScroll.subviews) {
        [view removeFromSuperview];
    }
    
    for (int i = 0; i < self.pageView.pageList.count; i++) {
        
        UILabel *lab = [[UILabel alloc]init];
        lab.frame = CGRectMake(i*self.view.frame.size.width,30, self.view.frame.size.width, 30);
        lab.backgroundColor = [UIColor redColor];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = [NSString stringWithFormat:@"当前是第  %d   个",i];
        [self.bigScroll addSubview:lab];
    }
    self.bigScroll.contentSize = CGSizeMake(self.pageView.pageList.count * self.view.frame.size.width, self.bigScroll.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
