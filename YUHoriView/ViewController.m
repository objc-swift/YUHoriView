//
//  ViewController.m
//  YUHoriView
//
//  Created by jimi on 2018/7/11.
//  Copyright © 2018 YU. All rights reserved.
//

#import "ViewController.h"
#import "YUHoriView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YUHoriView *btns_small;
@property (weak, nonatomic) IBOutlet YUHoriView *btnsView;
@property (strong,nonatomic) YUHoriView* cod_btnsview;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self case0_dense];
    [self case1_sparse];
    [self case2_code];
    
}

// 例1
- (void)case0_dense {
    // 数据标题
    _btnsView.titles = @[@"肥仔水",@"计生用品避孕套",@"美妆",@"男装",@"童装",@"男鞋",@"厨房用品",@"工具",@"母婴",@"玩物",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡"];
    // 默认位置
    _btnsView.defaultButtonPos = 2;
    // 位置改变的事件
    _btnsView.onPosChange = ^(YUHoriElementButton *sender, int pos, NSString *title) {
        NSLog(@"pos: %d ,title :%@",pos,title);
    };
    // 刷新
    [_btnsView refresh];
}
// 例2 较少
- (void)case1_sparse {
    _btns_small.titles = @[@"我的关注",@"热门直播",@"同城直播"];
    // 左右间距
    _btns_small.xSpan = 25;
    [_btns_small refresh];
}
// 例3 纯代码

- (void)case2_code {
    CGRect r0 = CGRectMake(20, self.view.frame.size.height - 70, 200, 50);
    YUHoriView *view =[[YUHoriView alloc]initWithFrame:r0];
    view.titles =  @[@"纯代码构造",@"计生用品避孕套",@"美妆",@"男装",@"童装",@"男鞋",@"厨房用品"];
    view.onPosChange = ^(YUHoriElementButton *sender, int pos, NSString *title) {
        NSLog(@"pos: %d ,title :%@",pos,title);
    };
    [view refresh];
    [self.view addSubview:view];
    _cod_btnsview = view;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [_cod_btnsview setFrame:CGRectMake(30, CGRectGetMaxY(self.label3.frame) +20, self.view.frame.size.width - 60, 50)];
    
}
- (IBAction)last:(id)sender {
    int will = _btnsView.curPos - 1;
    if( will < 0  )return ;
    [_btnsView selectPos:will];
}
- (IBAction)next:(id)sender {
    int will = _btnsView.curPos + 1 ;
    if( will >= _btnsView.titles.count )return;
    [_btnsView selectPos:will];
}
@end
