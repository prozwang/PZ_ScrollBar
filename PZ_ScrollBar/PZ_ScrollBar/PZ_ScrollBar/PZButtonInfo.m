//
//  PZButtonInfo.m
//  PZScrollBar
//
//  Created by ProZ on 16/8/19.
//  Copyright © 2016年 ProZ. All rights reserved.
//

#import "PZButtonInfo.h"

@implementation PZButtonInfo

+(instancetype)creatBtnInfoWithTitle:(NSString *)title block:(myBlock)block{

    PZButtonInfo *btnInfo = [PZButtonInfo new];
    btnInfo.headTitle = title;
    btnInfo.btnBlock = block;

    return btnInfo;
}

@end
