//
//  YUHoriView.m
//  YUHoriView
//
//  Created by jimi on 2018/7/11.
//  Copyright © 2018 YU. All rights reserved.
//


#import "YUHoriView.h"
#import "YUHoriElementButton.h"
#import <Masonry.h>
@interface YUHoriView()

@property (strong,nonatomic) UIScrollView *scrollview;
@property (strong,nonatomic) NSMutableArray *buttons;

@end

@implementation YUHoriView
//  #pragma mark System ------> 系统方法
//  #pragma mark Init   ------> 初始化方法
//  #pragma mark View Logic --> 视图逻辑
//  #pragma mark Lazy Load  --> 懒加载

#pragma mark System
/**
    初始化方法，纯代码创建会调用这个方法。
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if( self ) {
        [self initSelfSetting];
        [self initSubViews];
        [self initSubViewAutoLayout];
    }
    return self;
}

/**
    初始化方法，xib创建会调用这个方法。
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if( self ) {
        [self initSelfSetting];
        [self initSubViews];
        [self initSubViewAutoLayout];
    }
    return self;
}

/**
    布局子视图，父亲view的frame发生变化的时候会调用此方法。
 */
- (void)layoutSubviews {
    [super layoutSubviews];
}
#pragma mark Init
- (void)initSelfSetting {
    self.backgroundColor = [UIColor redColor];
    
}

- (void)initSubViews {
    [self addSubview:self.scrollview];
}

- (void)initSubViewAutoLayout {
    __weak typeof (self)wsf = self;
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(wsf);
        make.top.equalTo(wsf);
        make.width.equalTo(wsf);
        make.height.equalTo(wsf);
    }];
}
#pragma mark View Logic
/**
    重新刷新布局界面
 */
- (void)refresh {
    [self resetButtons];
    [self makeButtonsByTitles];
}

/**
    重置按钮,清空按钮
    1. 将所有按钮视图remove
    2. 初始化buttons
 */
- (void)resetButtons {
    for( UIView *view in self.buttons ) {
        [view removeFromSuperview];
    }
    _buttons = [[NSMutableArray alloc]init];
}

/**
    根据标题数组 重新制作按钮
 */
- (void)makeButtonsByTitles {
    __weak typeof (self)wsf = self;
    UIView *zeroView = [[UIView alloc]init];
    [self.scrollview addSubview:zeroView];
  
    [zeroView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@0);
        make.height.equalTo(@0);
        make.leading.top.equalTo(@0);
    }];
    UIView *lastView = zeroView;
    for( NSString *title in _titles ) {
        YUHoriElementButton *btn =[YUHoriElementButton xib_YUHoriElementButton];
        [btn.titleLabel setText:title];
        [self.scrollview addSubview:btn]; //加入到scrollview
        [self.buttons addObject:btn]; // 将按钮保存起来，以便之后做清理工作
        [btn.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(btn).with.offset(5);
            make.trailing.equalTo(btn).with.offset(-5);
            make.top.equalTo(btn).with.offset(0);
        }];
        [btn.underlineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@2);
            make.width.equalTo(@23);
            make.top.equalTo(btn.titleLabel.mas_bottom).with.offset(9);
            make.centerX.equalTo(btn.titleLabel);
        }];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(lastView.mas_trailing).with.offset(1);
            make.top.equalTo(wsf.scrollview);
            make.height.equalTo(wsf.scrollview);
        }];
        lastView = btn;
    }
    
    // 为了设置contentsize
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@0);
    }];
}

#pragma mark Lazy Load

- (UIScrollView *)scrollview {
    if( !_scrollview ) {
         _scrollview =  [[UIScrollView alloc]init];
    }
    return _scrollview;
}

- (NSMutableArray *)buttons {
    if( !_buttons ) {
        _buttons = [[NSMutableArray alloc]init];
    }
    return _buttons;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
