//
//  ViewController.m
//  apptmp
//
//  Created by 王泽众 on 2018/1/10.
//  Copyright © 2018年 王泽众. All rights reserved.
//

#import "ViewController.h"
#import "WZZHandleMoneyVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    WZZHandleMoneyVC * vc = [[WZZHandleMoneyVC alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        [vc loadShowView];
    }];
}

@end
