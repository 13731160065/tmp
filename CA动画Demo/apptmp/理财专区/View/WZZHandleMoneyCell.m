//
//  WZZHandleMoneyCell.m
//  DuoDuoFu
//
//  Created by 王泽众 on 2018/1/9.
//  Copyright © 2018年 hongfuPay. All rights reserved.
//

#import "WZZHandleMoneyCell.h"

@interface WZZHandleMoneyCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation WZZHandleMoneyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.layer setCornerRadius:10];
    [self.layer setMasksToBounds:YES];
    [_titleLabel setNumberOfLines:2];
    
    [_titleLabel setAdjustsFontSizeToFitWidth:YES];
}

//复用
- (void)cellWithTitle:(NSString *)title
            iconImage:(UIImage *)image {
    [_titleLabel setText:title];
    [_iconImageView setImage:image];
}

@end
