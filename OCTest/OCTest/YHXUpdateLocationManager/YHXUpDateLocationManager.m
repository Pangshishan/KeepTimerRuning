//
//  YHXUpDateLocationManager.m
//  OCTest
//
//  Created by 山不在高 on 17/6/23.
//  Copyright © 2017年 山不在高. All rights reserved.
//

#import "YHXUpDateLocationManager.h"


@interface YHXUpDateLocationManager ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) void(^handle)();

@end

@implementation YHXUpDateLocationManager

// duration: 时间间隔
+ (instancetype)shareManager
{
    return [[YHXUpDateLocationManager alloc] init];
}
- (instancetype)init
{
    static YHXUpDateLocationManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [super init];
            manager.duration = 5;
        }
    });
    return manager;
}

- (void)startUpdateLocation
{
    if (self.isRunning) {
        return;
    }
    _isRunning = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:_duration target:self selector:@selector(timerRunning) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)endUpdateLocation
{
    if (self.isRunning == NO) {
        return;
    }
    _isRunning = NO;
    [self.timer invalidate];
    self.timer = nil;
}
// 在这里写上传代码
- (void)timerRunning
{
    if (_handle) {
        _handle();
        return;
    }
    // 如果不设置block，在这后面写上传位置信息代码
    NSLog(@"内部发送-位置信息");
}
- (void)handleUpdateLoction:(void(^)())handle
{
    _handle = handle;
}

- (void)setDuration:(NSTimeInterval)duration
{
    _duration = duration;
    if (_isRunning) {
        [self endUpdateLocation];
        [self startUpdateLocation];
    }
}

@end
