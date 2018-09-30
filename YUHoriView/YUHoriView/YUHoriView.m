//
//  YUHoriView.m
//  YUHoriView blog :objc94.com
//
//  Created by objc94~yxy on 2018/7/11.
//  Copyright © 2018 YU. All rights reserved.
//  18768492805


#import "YUHoriView.h"
#import "YUHoriElementButton.h"
#import <Masonry.h>
@interface YUHoriView()<UIScrollViewDelegate>

@property (strong,nonatomic) NSMutableArray *buttons;
@property (strong,nonatomic) YUHoriElementButton *curButton;
@property (strong,nonatomic) UIView *movLine;
@end

@implementation YUHoriView
//  #pragma mark System ------> 系统方法/系统控件的代理
//  #pragma mark Init   ------> 初始化方法
//  #pragma mark View Logic --> 视图逻辑/自定义控件的代理
//  #pragma mark Event Setting -> 事件设置
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

/**
    scrollview 发送滚动时系统会调用此方法
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateUnderLinePos];
}

#pragma mark Init
- (void)initSelfSetting {
    self.clipsToBounds = YES;
    self.xSpan = dxSpan;
    self.ySpan = dySpan;

}
- (void)initSubViews {
    [self addSubview:self.scrollview];
    [self addSubview:self.movLine];
    self.scrollview.delegate = self;
    self.scrollview.showsHorizontalScrollIndicator = NO;
    self.scrollview.showsVerticalScrollIndicator = NO;
    [self.movLine setBackgroundColor:[UIColor colorWithRed:1.0 green:51/255.0 blue:0 alpha:1]];
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
- (void)setUpByTitles:(NSMutableArray *)titles defaultButtonPos:(int)pos {
    self.titles = titles;
    self.defaultButtonPos = pos;
}
#pragma mark View Logic
/**
    重新刷新布局界面
 */
- (void)refresh {
    [self resetButtons];
    [self makeButtonsByTitles];
    [self buttonsEventSetting];
    NSAssert(self.defaultButtonPos >=0 && self.defaultButtonPos< self.buttons.count, @"#defaultButtonPos 错误，defaultButtonPos 的范围是否在 [0,titles.count-1] 中") ;
    [self layoutIfNeeded];
    [self selectPos:self.defaultButtonPos]; // 选择默认的按钮
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
    int pos = 0 ;
    for( NSString *title in _titles ) {
        YUHoriElementButton *btn =[YUHoriElementButton xib_YUHoriElementButton];
        btn.pos = pos++;
        [btn.titleLabel setText:title];
        [self.scrollview addSubview:btn]; //加入到scrollview
        [self.buttons addObject:btn]; // 将按钮保存起来，以便之后做清理工作
        [btn.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            // titlelabel ～ 标题标签的约束
            make.leading.equalTo(btn).with.offset(self.xSpan / 2.0);
            make.trailing.equalTo(btn).with.offset(-self.xSpan / 2.0);
            make.centerY.equalTo(btn);
        }];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            //按钮的约束 ，尚未设置width ，由titlelabel 内容撑开
            make.leading.equalTo(lastView.mas_trailing).with.offset(0);
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

- (void)selectPos:(int)pos {
    
    NSAssert(pos >=0 && pos< self.buttons.count, @"#Pos 错误，Pos 的范围是否在 [0,titles.count-1] 中") ;
    [self layoutIfNeeded];
    YUHoriElementButton *hbtn = _buttons[pos];
    hbtn.onTap(hbtn, hbtn.pos);
}

- (void)selectPosWithNONE_notify:(int)pos {
    NSAssert(pos >=0 && pos< self.buttons.count, @"#Pos 错误，Pos 的范围是否在 [0,titles.count-1] 中") ;
    [self layoutIfNeeded];
    YUHoriElementButton *hbtn = _buttons[pos];
    [self buttonMoveToPos:pos sender:hbtn needNotify:NO];
    
}

- (void)selectNone {
    if ( self.curButton ) {
        self.curButton.titleLabel.textColor = cOff;
        self.movLine.hidden = YES;
    }
    self.curButton = nil;
}
/**
    更新下滑线的位置
 */
- (void)updateUnderLinePos {
    if( self.curButton ) {
        self.movLine.hidden = NO;
        CGFloat lWidth = self.curButton.titleLabel.frame.size.width;
   
        
        CGPoint curBtnCenter = CGPointMake(self.curButton.frame.size.width / 2.0, CGRectGetMaxY(self.curButton.titleLabel.frame ) + self.ySpan) ;
        CGPoint desPt = [self.curButton convertPoint:curBtnCenter toView:self];
        self.isAnimatingNow = YES;
        [UIView animateWithDuration:0.1 animations:^{
            [self.movLine setFrame:CGRectMake(CGRectGetMinX(self.movLine.frame), CGRectGetMinY(self.movLine.frame), lWidth, CGRectGetHeight(self.movLine.frame))];
            [self.movLine setCenter:desPt];
          
        } completion:^(BOOL finished) {
             self.isAnimatingNow = NO;
        }];
    }
}

- (void)moveToButtonWithAnimate:(YUHoriElementButton *)sender {
    CGFloat shouldX = sender.frame.origin.x - self.scrollview.frame.size.width / 2.0 + sender.frame.size.width / 2.0;
    // 右侧的补偿x，offsetRight意味着 scrollview右侧被隐藏部分的宽度。
    CGFloat offsetRight =
    + self.scrollview.contentSize.width
    - self.scrollview.frame.size.width
    - shouldX;
    CGPoint shouldPoint = CGPointMake(0, 0);
    if( shouldX > 0 && offsetRight >0) {
        shouldPoint = CGPointMake(shouldX, 0) ;
    }else {
        if( shouldX <=0 )
            shouldPoint = CGPointMake(0, 0) ;
        if( offsetRight <=0 )
            shouldPoint = CGPointMake(self.scrollview.contentSize.width - self.scrollview.frame.size.width, 0);
    }
    [self updateUnderLinePos];
    [self.scrollview setContentOffset:shouldPoint animated:YES];
}
#pragma mark Event Setting
- (void)buttonsEventSetting {
    __weak typeof (self)wsf = self;
    for( YUHoriElementButton *button_i in self.buttons ) {
        //设置第i个button的tap事件
        button_i.onTap = ^(YUHoriElementButton *sender, int pos) {
            [wsf buttonMoveToPos:pos sender:sender needNotify:YES];
        };
    }
}
- (void)buttonMoveToPos:(int)pos sender:(YUHoriElementButton *)sender needNotify:(BOOL)needNotify {
    
    self.curPos = pos;
    if( self.onPosChange  && needNotify ) {
        // 位置放生改变，通知外部
        NSString *title = self.titles[pos];
        self.onPosChange(sender, pos,title);
    }
    self.curButton.titleLabel.textColor = cOff;
    self.curButton = sender;
    self.curButton.titleLabel.textColor = cOn;
    if( self.scrollview.contentSize.width > self.scrollview.frame.size.width ) {
        [self moveToButtonWithAnimate:sender];
    }else{
        [self updateUnderLinePos];
    }
    
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
- (UIView *)movLine {
    if( !_movLine ) {
        _movLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 23, 2)];
    }
    return _movLine;
}
@end
