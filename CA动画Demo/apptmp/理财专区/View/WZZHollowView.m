//
//  WZZHollowView.m
//  apptmp
//
//  Created by 王泽众 on 2018/1/10.
//  Copyright © 2018年 王泽众. All rights reserved.
//

#import "WZZHollowView.h"

@implementation WZZHollowView
{
    CGRect contentFrame;
    CAShapeLayer *fillLayer;
}

+ (instancetype)getHollowView {
    WZZHollowView * aView = [[WZZHollowView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [aView setBackgroundColor:[UIColor clearColor]];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [aView addSubview:button];
    [button setFrame:aView.bounds];
    [button addTarget:aView action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    return aView;
}

- (void)showWithHollowRect:(CGRect)frame {
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    contentFrame = frame;
    
    //中间镂空的矩形框
    CGRect myRect = contentFrame;
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:myRect cornerRadius:10];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    
    //layer
    fillLayer = [CAShapeLayer layer];
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;//中间镂空的关键点 填充规则
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity = 0.5f;
    [self.layer addSublayer:fillLayer];
    
    //动画
    CABasicAnimation * anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = @(0.0f);
    anim.toValue = @(0.5f);
    anim.duration = 0.3f;
    [fillLayer addAnimation:anim forKey:@"alphy1"];
}

- (void)dismiss {
    CABasicAnimation * anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = @(0.5f);
    anim.toValue = @(0.0f);
    anim.duration = 0.3f;
    [anim setRemovedOnCompletion:NO];
    [fillLayer addAnimation:anim forKey:@"alphy2"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(anim.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}

@end
