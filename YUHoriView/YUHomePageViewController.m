//
//  YUHomePageViewController.m
//  YUHoriView
//
//  Created by jimi on 2018/7/12.
//  Copyright © 2018 YU. All rights reserved.
//

#import "YUHomePageViewController.h"
#import "YUHoriView.h"
@interface YUHomePageViewController ()
@property (weak, nonatomic) IBOutlet YUHoriView *horiButtons;
@end
@implementation YUHomePageViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _horiButtons.titles = [[NSMutableArray alloc]initWithArray:@[@"肥仔水",@"计生用品避孕套",@"美妆",@"男装",@"童装",@"男鞋",@"厨房用品",@"工具",@"母婴",@"玩物",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡"]];
    _horiButtons.defaultButtonPos = 1;
    _horiButtons.span = 16;
    [_horiButtons refresh];
    _horiButtons.onPosChange = ^(YUHoriElementButton *sender, int pos, NSString *title) {
        NSLog(@"%@",title);
        
    };
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tap:(id)sender {
    [_horiButtons selectNone];
    
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
