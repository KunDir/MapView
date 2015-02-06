//
//  FKDescAnnotationView.m
//  05-自定义大头针
//
//  Created by kun on 15/2/5.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKDescAnnotationView.h"
#import "FKDescView.h"
#import "UIView+FK.h"
#import "FKTuangou.h"
#import "FKDescAnnotation.h"

@interface FKDescAnnotationView ()
@property (nonatomic, weak) FKDescView *descView;

@end
@implementation FKDescAnnotationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        FKDescView *descView = [FKDescView descView];
        descView.y = 30;
        [self addSubview:descView];
        
        self.descView = descView;
        
        self.bounds = CGRectMake(0, 0, descView.frame.size.width, descView.frame.size.height + 60);
    }
    return self;
}

+ (instancetype)annotationViewWithMapView:(MKMapView *)mapView
{
    static NSString *ID = @"tuangou_desc";
    FKDescAnnotationView *annoView = (FKDescAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    if(!annoView)
    {
        annoView = [[FKDescAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:ID];
    }
    return annoView;
}

- (void)setAnnotation:(id<MKAnnotation>)annotation
{
    [super setAnnotation:annotation];
    
    FKDescAnnotation *anno = annotation;
    
    self.descView.tuangou = anno.tuangou;
    
}

- (void)didMoveToSuperview
{
    self.alpha = 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
    }];
}
@end
