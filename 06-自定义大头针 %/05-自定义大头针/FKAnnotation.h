//
//  FKAnnotation.h
//  05-自定义大头针
//
//  Created by kun on 15/2/5.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@class FKTuangou;

@interface FKAnnotation : NSObject <MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, strong) FKTuangou *tuangou;

@property (nonatomic, assign, getter = isShowDesc) BOOL showDesc;
@end
