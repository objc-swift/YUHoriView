//
//  YUHoriView.h
//  YUHoriView
//
//  Created by objc94~yxy on 2018/7/11.
//  Copyright © 2018 YU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YUHoriElementButton;
@interface YUHoriView : UIView
@property (strong,nonatomic) void (^onPosChange)(YUHoriElementButton *sender ,int pos,NSString *title);
@property (strong,nonatomic) NSMutableArray *titles;
@property (assign,nonatomic) int defaultButtonPos;
@property (assign,nonatomic) CGFloat span; // 按钮与按钮之间间距 #-span-#


/**
 初始化参数

 @param titles 一个array，里面放你想要展示的标题
 @param pos 默认点亮位置，如 pos = 0 默认选第一个按钮， pos = 1 ，默认选第二个按钮
 */
- (void)setUpByTitles:(NSMutableArray *)titles defaultButtonPos:(int)pos ;

/**
 点亮某个按钮

 @param pos 为位置，从 0开始
 */
- (void)selectPos:(int)pos;

/**
 熄灭所有按钮
 */
- (void)selectNone ;

/**
 刷新布局，一般在设置titles之后调用
 */
- (void)refresh;
@end
