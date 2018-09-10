


  <img src="https://github.com/objc94/YUHoriView/raw/master/README_IMG/logo.png" alt="YUHoriView" title="YUHoriView">


### 使用案例

``` objective-c
    //_btnsView 为YUHoriView
    _btnsView.titles = [[NSMutableArray alloc]initWithArray:@[@"肥仔水",@"计生用品避孕套",@"美妆",@"男装",@"童装",@"男鞋",@"厨房用品",@"工具",@"母婴",@"玩物",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡",@"书籍",@"饮料",@"薯片",@"软件",@"免费吃鸡"]];
    // 默认位置
    _btnsView.defaultButtonPos = 2;
    // 位置改变的事件
    _btnsView.onPosChange = ^(YUHoriElementButton *sender, int pos, NSString *title) {
        NSLog(@"pos: %d ,title :%@",pos,title);
    };
    // 刷新
    [_btnsView refresh];
```

