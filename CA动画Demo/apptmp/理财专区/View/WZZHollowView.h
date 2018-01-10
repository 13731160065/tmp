//
//  WZZHollowView.h
//  apptmp
//
//  Created by 王泽众 on 2018/1/10.
//  Copyright © 2018年 王泽众. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZZHollowView : UIView

/**
 获取本视图

 @return 视图
 */
+ (instancetype)getHollowView;

/**
 显示视图

 @param frame 挖掉部分的frame，相对于window
 */
- (void)showWithHollowRect:(CGRect)frame;

@end
