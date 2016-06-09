//
//  WeatherInterfaceController.m
//  WatchKitDemo
//
//  Created by Shinancao on 16/6/6.
//  Copyright © 2016年 ZhangNan. All rights reserved.
//

#import "WeatherInterfaceController.h"
#import "DayRowController.h"
#import "Weather.h"

@interface WeatherInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *weatherForecastTitleLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *dayTable;

@property (nonatomic, strong) Weather *weather;

@end

@implementation WeatherInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    _weather = (Weather *)context;
    [self setTitle:_weather.cityName];
    
    NSInteger count = _weather.dayWeathers.count;
    [_weatherForecastTitleLabel setText:[NSString stringWithFormat:@"%d日天气预报", count]];
    [_dayTable setNumberOfRows:count withRowType:@"Cell"];
    for (int i = 0; i < count; i++) {
        DayRowController *row = [_dayTable rowControllerAtIndex:i];
        [row setup:_weather.dayWeathers[i]];
    }
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



