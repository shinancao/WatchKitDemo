//
//  InterfaceController.m
//  WatchKitDemoWatch Extension
//
//  Created by Shinancao on 16/6/6.
//  Copyright © 2016年 ZhangNan. All rights reserved.
//

#import "InterfaceController.h"
#import "Weather.h"


@interface InterfaceController()

@property (nonatomic, strong) NSMutableArray<Weather *> *weathers;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    _weathers = @[].mutableCopy;
    NSArray *names = @[@"上海", @"杭州", @"苏州", @"北京", @"厦门"];
    for (int i = 0; i < names.count; i++) {
        Weather *weaher = [[Weather alloc]init];
        weaher.cityName = names[i];
        NSMutableArray *dayWeathers = @[].mutableCopy;
        int randomNum = 1 +  (arc4random() % 6);
        for (int i = 0; i < randomNum; i ++ ) {
            DayWeather *dayWeather = [[DayWeather alloc]init];
            [dayWeathers addObject:dayWeather];
        }
        weaher.dayWeathers = dayWeathers.copy;
        [_weathers addObject:weaher];
    }
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    NSMutableArray *controllers = @[].mutableCopy;
    for (int i = 0; i < _weathers.count; i++) {
        [controllers addObject:@"WeatherInterfaceController"];
    }
    //在执行完这句话后，InterfaceController变得不再可见，会被销毁掉
    [WKInterfaceController reloadRootControllersWithNames:controllers contexts:_weathers];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



