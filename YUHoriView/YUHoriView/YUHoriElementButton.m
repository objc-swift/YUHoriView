//
//  YUHoriElementButton.m
//  YUHoriView
//
//  Created by objc94~yxy on 2018/7/11.
//  Copyright © 2018 YU. All rights reserved.
//

#import "YUHoriElementButton.h"

@implementation YUHoriElementButton
+ (instancetype)xib_YUHoriElementButton
{
    // 封装Xib的加载过程
    return [[NSBundle mainBundle] loadNibNamed:@"YUHoriElementButton" owner:nil options:nil].firstObject;
    
}
- (void)showUnderLine {
    [_underlineView setHidden:NO];
    
}
- (void)hideUnderLine {
    [_underlineView setHidden:YES];
}
- (void)awakeFromNib {
    [self hideUnderLine];
    
}
- (IBAction)tapSelf:(id)sender {
    if( _onTap ) {
        _onTap(self,_pos);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
