//
//  DaYiJiProtocl.h
//  DelegateDemo
//
//  Created by 舒煜进 on 15-4-13.
//  Copyright (c) 2015年 启能教育. All rights reserved.
//

#import <Foundation/Foundation.h>

//@protocol 关键字
//DaYiJiProtocol 协议名称
@protocol DaYiJiProtocl <NSObject>

//必须实现的委托方法
@required
- (void)dayiweizi;

//可选的委托实现方法
@optional
- (void)dayiji;

@end
