


  <img src="https://github.com/objc94/YUHoriView/raw/master/README_IMG/logo.png" alt="YUHoriView" title="YUHoriView">

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/mengxianliang/XLKit/blob/master/LICENSE)&nbsp;

### 效果预览


<img src="https://github.com/objc94/YUHoriView/raw/master/README_IMG/demogif.gif"  />


### 框架依赖

Masonry

### 快速上手（纯代码方式）

``` objective-c
     YUHoriView *view =[[YUHoriView alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height - 70, 200, 50)];
    view.titles =  @[@"纯代码构造",@"计生用品避孕套",@"美妆",@"男装",@"童装",@"男鞋",@"厨房用品"];
    view.onPosChange = ^(YUHoriElementButton *sender, int pos, NSString *title) {
        NSLog(@"pos: %d ,title :%@",pos,title);
    };
    [view refresh]; 
    [self.view addSubview:view];
```

### 在IB上使用

拖出view之后将Custom Class 中的class改成YUHoriView

<img src="https://github.com/objc94/YUHoriView/raw/master/README_IMG/t0.jpg"  />

然后与代码中的属性相关联接即可

```objective-c
@property (weak, nonatomic) IBOutlet YUHoriView *btnsView;
```

最后设置属性 

```objective-c
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
```
