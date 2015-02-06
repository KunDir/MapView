//
//  FKTuangouAnnotationView.m
//  05-自定义大头针
//
//  Created by kun on 15/2/5.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKTuangouAnnotationView.h"
#import "FKAnnotation.h"
#import "FKTuangou.h"

@implementation FKTuangouAnnotationView
+ (instancetype)annotationViewWithMapView:(MKMapView *)mapView
{
    static NSString *ID = @"tuangou";
    
    // 从缓存池中取出可以循环利用的大头针view
    FKTuangouAnnotationView *annoView = (FKTuangouAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    if(annoView == nil)
    {
        annoView = [[FKTuangouAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:ID];
    }
    return annoView;
}

- (void)setAnnotation:(id<MKAnnotation>)annotation
{
    [super setAnnotation:annotation];
    
    FKAnnotation *anno = annotation;
    
    self.image = [UIImage imageNamed:anno.tuangou.icon];
}

@end
