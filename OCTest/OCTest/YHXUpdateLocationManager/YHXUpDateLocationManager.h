//
//  YHXUpDateLocationManager.h
//  OCTest
//
//  Created by 山不在高 on 17/6/23.
//  Copyright © 2017年 山不在高. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHXUpDateLocationManager : NSObject

@property (nonatomic, assign, readonly) BOOL isRunning;

// 默认值为5
@property (nonatomic, assign) NSTimeInterval duration;


+ (instancetype)shareManager;

- (void)startUpdateLocation;
- (void)endUpdateLocation;

// 如果调用：会将handle存成单例属性，定时器触发时调用，可以在handle实现体体中上传位置信息
// 如果不调用，也可以在 .m 文件的定时器方法中上传位置信息
// 因为是单例，设置多次每次也只调用一次，只不过调用最后一次的设置
- (void)handleUpdateLoction:(void(^)())handle;

@end
