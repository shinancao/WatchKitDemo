//
//  Weather.h
//  WatchKitDemo
//
//  Created by Shinancao on 16/6/7.
//  Copyright © 2016年 ZhangNan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DayWeather.h"

@interface Weather : NSObject

@property (nonatomic, copy) NSString *cityName;

@property (nonatomic, strong) NSArray<DayWeather *> *dayWeathers;

@end
