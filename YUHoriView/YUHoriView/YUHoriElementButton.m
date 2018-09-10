//
//  YUHoriElementButton.m
//  YUHoriView
//
//  Created by objc94~yxy on 2018/7/11.
//  Copyright © 2018 YUX. All rights reserved.
//
#import "YUHoriElementButton.h"
@implementation YUHoriElementButton
+ (instancetype)xib_YUHoriElementButton
{
    // 封装Xib的加载过程
    return [[NSBundle mainBundle] loadNibNamed:@"YUHoriElementButton" owner:nil options:nil].firstObject;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (IBAction)tapSelf:(id)sender {
    if( _onTap ) {
        _onTap(self,_pos);
    }
}
@end
