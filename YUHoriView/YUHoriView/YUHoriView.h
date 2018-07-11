//
//  YUHoriView.h
//  YUHoriView
//
//  Created by jimi on 2018/7/11.
//  Copyright © 2018 YU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUHoriView : UIView
@property (strong,nonatomic) NSMutableArray *titles;
- (void)refresh;
@end
