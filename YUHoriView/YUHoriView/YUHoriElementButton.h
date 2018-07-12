//
//  YUHoriElementButton.h
//  YUHoriView
//
//  Created by objc94~yxy on 2018/7/11.
//  Copyright © 2018 YU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUHoriElementButton : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *underlineView;
@property (assign,nonatomic) int pos;
@property (strong,nonatomic) void (^onTap)(YUHoriElementButton *sender ,int pos);

- (void)showUnderLine;
- (void)hideUnderLine;

+ (instancetype)xib_YUHoriElementButton;

@end
