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
@property (weak, nonatomic) IBOutlet YUHoriView *v;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _v.titles = [[NSMutableArray alloc]initWithArray:@[@"abcdsdsd",@"efg",@"efg",@"efg"]];
    [_v refresh];
    _v.titles = [[NSMutableArray alloc]initWithArray:@[@"肥仔水",@"计生用品避孕套",@"美妆",@"男装",@"童装",@"男鞋",@"厨房用品",@"工具",@"母婴",@"玩物",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡"]];
    _v.defaultButtonPos = 2;
    
    [_v refresh];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
