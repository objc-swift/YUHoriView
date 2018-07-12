//
//  YUHoriView.h
//  YUHoriView
//
//  Created by objc94~yxy on 2018/7/11.
//  Copyright © 2018 YU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUHoriView : UIView
@property (strong,nonatomic) NSMutableArray *titles;
@property (assign,nonatomic) int defaultButtonPos;

- (void)setUpByTitles:(NSMutableArray *)titles defaultButtonPos:(int)pos ;


- (void)refresh;
@end
