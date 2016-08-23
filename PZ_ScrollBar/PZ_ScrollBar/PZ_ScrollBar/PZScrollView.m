//
//  PZScrollView.m
//  PZScrollBar
//
//  Created by ProZ on 16/8/19.
//  Copyright © 2016年 ProZ. All rights reserved.
//

#import "PZScrollView.h"

#define width self.bounds.size.width
#define height self.bounds.size.height
@interface PZScrollView ()

@property (nonatomic, strong) UIView *redView;

@property (nonatomic, assign) int count;


@end

@implementation PZScrollView

#pragma mark - 添加滑动视图
-(void)setSelectedIdx:(NSInteger)selectedIdx {
    _selectedIdx = selectedIdx < self.btnInfos.count ? selectedIdx : self.btnInfos.count;
    _selectedIdx = _selectedIdx < 0 ? 0 : _selectedIdx;
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag == selectedIdx) {
                [self didClickBtn:btn];
                break;
            }
        }
    }
}

-(void)setBtnInfos:(NSArray<PZButtonInfo *> *)btnInfos{
    _btnInfos = btnInfos;
    self.count = (int)btnInfos.count;
    //创建button等
    [self creatSliderView];
}

-(void)creatSliderView{


    //创建底线
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, height - 1, width, 1)];
    bottomView.backgroundColor = [UIColor grayColor];
    [self addSubview:bottomView];

    //创建滑块view
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, height - 4, (width/self.count)*0.8, 3)];//80是现宽
    if (self.sliderColor) {

        redView.backgroundColor = self.sliderColor;
    }else {
        redView.backgroundColor = [UIColor redColor];
    }
    [self addSubview:redView];
    self.redView = redView;

    for (int i = 0; i < self.count; ++i) {

        if (self.isDevice) {

            if ( i != 0) {

                UIView *bannerView = [[UIView alloc] initWithFrame:CGRectMake(i*(width/self.count) +1, 0, 1, height)];
                bannerView.backgroundColor = [UIColor grayColor];
                [self addSubview:bannerView];
            }
        }


        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*(width/self.count), 0, width/self.count, height-5)];
        btn.tag = i;
        //取出实体模型
        PZButtonInfo *btnInfo = self.btnInfos[i];

        [btn setTitle:btnInfo.headTitle forState:UIControlStateNormal];

        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.titleLabel.textColor = [UIColor redColor];

        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:btn];
    }


}


-(void)layoutSubviews{

    [super layoutSubviews];

    [self selectedFirstBtn];
}

-(void)didClickBtn:(UIButton *)btn{
    //最开始选中第一个按钮    这是近来就选中的,此处不做考虑
    //遍历btn,找出选中按钮,如果是当前按钮,不做操作

    PZButtonInfo *btnInfo = self.btnInfos[btn.tag];

    if(btnInfo.btnBlock){
        btnInfo.btnBlock();
    }

    //如果不是当前按钮,取消之前选中按钮 并选中当前按钮
    for (id obj in self.subviews) {
        if([obj isKindOfClass:[UIButton class]]){
            if([(UIButton *)obj isSelected]){
                UIButton *btnNew = (UIButton *)obj;

                //执行btn的操作
                if(obj == btn){

                    CGFloat centerX = btn.center.x;
                    //x-40 就是redView的x点
                    CGFloat redViewChangeX = centerX - 0.8*(width/self.count)/2;
                    //取出redView的frame,赋值进去
                    CGRect frame = self.redView.frame;
                    frame.origin.x = redViewChangeX;
                    //frame赋值过去
                    self.redView.frame = frame;
                }else{


                    btnNew.selected = NO;
                    btn.selected = YES;

                    //执行动画
                    //取得btn的中心点x
                    CGFloat centerX = btn.center.x;
                    //x-40 就是redView的x点
                    CGFloat redViewChangeX = centerX - 0.8*(width/self.count)/2;
                    //取出redView的frame,赋值进去
                    CGRect frame = self.redView.frame;
                    frame.origin.x = redViewChangeX;
                    //frame赋值过去并动画
                    [UIView animateWithDuration:0.5 animations:^{
                        self.redView.frame = frame;
                    }];
                }


            }
        }
    }
}

//选中第一个按钮
-(void)selectedFirstBtn{

    for (id obj in self.subviews) {
        if([obj isKindOfClass:[UIButton class]]){
            UIButton *btn = (UIButton *)obj;
            PZButtonInfo *btnInfo = self.btnInfos[0];
            if([btn.titleLabel.text isEqualToString:btnInfo.headTitle]){//注意修改
                btn.selected = YES;
                [self didClickBtn:btn];
            }
        }
    }
}





@end
