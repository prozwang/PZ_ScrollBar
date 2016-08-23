//
//  PZScrollView.h
//  PZScrollBar
//
//  Created by ProZ on 16/8/19.
//  Copyright © 2016年 ProZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PZButtonInfo.h"
@interface PZScrollView : UIView
@property (nonatomic, copy) NSArray <PZButtonInfo *>* btnInfos;
@property(nonatomic,assign)NSInteger selectedIdx;
@property(nonatomic,strong)UIColor *sliderColor;
@property(nonatomic,assign)BOOL isDevice;
/**
 *  1.通过initWithFrame方法创建
 *  2.创建一个包含"标题" 和 对应点击操作的 block 的btnInfos数组
 *  3.把数组赋值给 NBSliderView 的 btnInfos 属性
 */

/*
 PZScrollView *sliderView = [[PZScrollView alloc] initWithFrame:CGRectMake(0, 64, width, 50)];
 //创建一个数组
 PZButtonInfo *btnInfo1 = [PZButtonInfo sliderBtnInfoWithTitle:[NSString stringWithFormat:@"未使用"] block:^{
 NSLog(@"点击了未使用");
 }];
 PZButtonInfo *btnInfo2 = [PZButtonInfo sliderBtnInfoWithTitle:[NSString stringWithFormat:@"已使用"] block:^{
 NSLog(@"点击了已使用");
 }];
 PZButtonInfo *btnInfo3 = [PZButtonInfo sliderBtnInfoWithTitle:[NSString stringWithFormat:@"已过期"] block:^{
 NSLog(@"点击了已过期");
 }];
 NSArray *btnInfoArr = @[btnInfo1,btnInfo2,btnInfo3];
 sliderView.btnInfos = btnInfoArr;
 */


@end
