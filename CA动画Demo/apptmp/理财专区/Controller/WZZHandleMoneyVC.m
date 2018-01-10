//
//  WZZHandleMoneyVC.m
//  DuoDuoFu
//
//  Created by 王泽众 on 2018/1/8.
//  Copyright © 2018年 hongfuPay. All rights reserved.
//

#import "WZZHandleMoneyVC.h"
#import "WZZHandleMoneyCell.h"
#import "WZZHollowView.h"

#define WZZHandleMoneyVC_border 20//空隙
#define WZZHandleMoneyVC_column 4//列

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define WZZHandleMoneyVC_navH [[UIApplication sharedApplication] statusBarFrame].size.height + 44

@interface WZZHandleMoneyVC ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
{
    UICollectionView * mainCollectionView;
    NSMutableArray * dataArr;
    UIView * bannerView;
    NSMutableArray * imageUrlsArr;
    NSMutableArray * imageHrefArr;
    UIView * line;
}
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *downView;

@end

@implementation WZZHandleMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"理财专区"];
    
    [self creatUI];
    NSArray * arr = @[
                      @{@"title":@"小资钱包",
                        @"image":@"小资钱包",
                        @"url":@"http://www.baidu.com"
                        },
                      @{@"title":@"银联理财",
                        @"image":@"银联理财",
                        @"url":@"http://www.github.com"
                        }
                      ];
    dataArr = [NSMutableArray arrayWithArray:arr];
    [mainCollectionView reloadData];
}

- (void)creatLineWithView:(UIView *)aView frame:(CGRect)rect {
    CGRect fr = [aView convertRect:rect toView:self.view];
#if 0
    [line removeFromSuperview];
    line = [[UIView alloc] initWithFrame:CGRectMake(fr.origin.x, fr.origin.y+fr.size.height, fr.size.width, 1)];
    [self.view addSubview:line];
    [line setBackgroundColor:[self getcolor:0xFFFFFF]];
#endif
    
    WZZHollowView * av = [WZZHollowView getHollowView];
    [av showWithHollowRect:fr];
}
- (UIColor *)getcolor2:(UInt32)rgb {
    UInt32 r = rgb>>16;
    UInt32 g = rgb>>8&0xFF;
    UInt32 b = rgb&0xFF;
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
}
- (UIColor *)getcolor:(UInt32)rgb {
    int r = rgb>>16;
    int g = rgb>>8&0xFF;
    int b = rgb&0xFF;
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
}

- (void)creatUI {
    //collectionView
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    [_downView addSubview:mainCollectionView];
    [mainCollectionView setDelegate:self];
    [mainCollectionView setDataSource:self];
    [mainCollectionView registerNib:[UINib nibWithNibName:@"WZZHandleMoneyCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [mainCollectionView setBackgroundColor:[UIColor lightGrayColor]];
    
    [self loadMainCollectionHeader];
}

- (void)loadMainCollectionHeader {
    [mainCollectionView setContentInset:UIEdgeInsetsMake(WZZHandleMoneyVC_border+bannerView.frame.size.height+8, WZZHandleMoneyVC_border, 0, WZZHandleMoneyVC_border)];
}

#pragma mark - collection代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString * titleStr = dataArr[indexPath.row][@"title"];
    UIImage * image = [UIImage imageNamed:dataArr[indexPath.row][@"image"]];
    
    WZZHandleMoneyCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor whiteColor]];
    [cell cellWithTitle:titleStr iconImage:image];
    
    return cell;
}

- (void)loadShowView {
    UICollectionViewCell * cell = [mainCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    CGRect re = [mainCollectionView convertRect:cell.frame toView:mainCollectionView];
    [self creatLineWithView:mainCollectionView frame:re];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (SCREEN_WIDTH-(WZZHandleMoneyVC_column+1)*WZZHandleMoneyVC_border)/WZZHandleMoneyVC_column;
    CGFloat height = width;
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return WZZHandleMoneyVC_border;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return WZZHandleMoneyVC_border;
}

@end
