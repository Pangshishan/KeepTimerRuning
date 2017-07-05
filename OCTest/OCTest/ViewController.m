//
//  ViewController.m
//  OCTest
//
//  Created by 山不在高 on 17/6/21.
//  Copyright © 2017年 山不在高. All rights reserved.
//

#define kDictionaryStringValue(dict, key) ((NSString *)([((NSArray *)([dict isKindOfClass:[NSDictionary class]] ? dict.allKeys : @[])) containsObject:key] ? dict[key] : @""))

#import "ViewController.h"
//#import <Masonry.h>
#import "YHXUpDateLocationManager.h"
#import "OCTest-swift.h"
@interface ViewController ()

@property (nonatomic, strong) UIView *viewS;
@property (nonatomic, strong) UIView *view1;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
- (IBAction)start:(id)sender {
    YHXUpDateLocationManager *manager = [YHXUpDateLocationManager shareManager];
    [manager startUpdateLocation];
    
    // 不解开注释试试，解开再试试
//    [manager handleUpdateLoction:^{
//        NSLog(@"用Block外部发送定时信息");
//    }];
}Test111

- (IBAction)end:(id)sender {
    [[YHXUpDateLocationManager shareManager] endUpdateLocation];
}
- (IBAction)subTwoSecond:(id)sender {
    if ([YHXUpDateLocationManager shareManager].duration > 2) {
        [YHXUpDateLocationManager shareManager].duration -= 2;
    }
}


@end
