//
//  PZButtonInfo.h
//  PZScrollBar
//
//  Created by ProZ on 16/8/19.
//  Copyright © 2016年 ProZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^myBlock)() ;

@interface PZButtonInfo : NSObject

@property (nonatomic, strong) NSString *headTitle;

@property (nonatomic, copy) void (^btnBlock)();

//提供一个快速创建的接口
+(instancetype)creatBtnInfoWithTitle:(NSString *)title block:(myBlock)block;


@end
