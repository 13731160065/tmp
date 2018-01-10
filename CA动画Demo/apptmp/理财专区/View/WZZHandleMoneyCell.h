//
//  WZZHandleMoneyCell.h
//  DuoDuoFu
//
//  Created by 王泽众 on 2018/1/9.
//  Copyright © 2018年 hongfuPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZZHandleMoneyCell : UICollectionViewCell

/**
 cell复用

 @param title 标题
 @param image 图片
 */
- (void)cellWithTitle:(NSString *)title
            iconImage:(UIImage *)image;

@end
