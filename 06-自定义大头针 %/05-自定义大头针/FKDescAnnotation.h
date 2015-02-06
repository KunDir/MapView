//
//  FKDescAnnotation.h
//  05-自定义大头针
//
//  Created by kun on 15/2/5.
//  Copyright (c) 2015年 kun. All rights reserved.
//  描述

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@class FKTuangou;

@interface FKDescAnnotation : NSObject <MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) FKTuangou *tuangou;
@end
