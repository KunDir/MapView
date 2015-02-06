//
//  ViewController.m
//  05-自定义大头针
//
//  Created by kun on 15/2/5.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FKAnnotation.h"
#import "FKDescAnnotation.h"
#import "FKDescAnnotationView.h"
#import "FKTuangou.h"
#import "FKTuangouAnnotationView.h"

@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locMgr;
@property (nonatomic, strong) NSArray *tuangous;
@end

@implementation ViewController

- (NSArray *)tuangous
{
    if(!_tuangous)
    {
        FKTuangou *tg1 = [[FKTuangou alloc] init];
        tg1.title = @"xxx大饭店";
        tg1.desc = @"全场一律15折，会员20折";
        tg1.icon = @"category_1";
        tg1.image = @"me";
        tg1.location = CLLocationCoordinate2DMake(39, 116);
        
        FKTuangou *tg2 = [[FKTuangou alloc] init];
        tg2.title = @"xxx影院";
        tg2.desc = @"最新大片：美国队长";
        tg2.icon = @"category_5";
        tg2.image = @"other";
        tg2.location = CLLocationCoordinate2DMake(29, 110);
        
        _tuangous = @[tg1, tg2];
        
    }
    return _tuangous;
}

- (void)addAnnotation
{
    for(FKTuangou *tuangou in self.tuangous)
    {
        FKAnnotation *anno = [[FKAnnotation alloc] init];
        anno.coordinate = tuangou.location;
        anno.tuangou = tuangou;
        [self.mapView addAnnotation:anno];
    }
}

- (CLLocationManager *)locMgr
{
    if(!_locMgr)
    {
        _locMgr = [[CLLocationManager alloc] init];
    }
    return _locMgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
    {
//        [self.locMgr requestWhenInUseAuthorization];
        [self.locMgr requestAlwaysAuthorization];
    }
//    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    self.mapView.delegate = self;
    
    [self addAnnotation];
}


#pragma mark - MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // 如果不是自定义的大头针，就按照系统默认的处理
    if([annotation isKindOfClass:[FKAnnotation class]]) {
        FKTuangouAnnotationView *annoView = [FKTuangouAnnotationView annotationViewWithMapView:mapView];
        
        // 传递模型(避免重复利用时有错误)
        annoView.annotation = annotation;
        
        return annoView;
    }
    else if([annotation isKindOfClass:[FKDescAnnotation class]])
    {
        FKDescAnnotationView *annoView = [FKDescAnnotationView annotationViewWithMapView:mapView];
        
        annoView.annotation = annotation;
        
        return annoView;
    }
    return nil;
}

// 选中来某一个大头针
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if(![view isKindOfClass:[FKTuangouAnnotationView class]]) return;
    
    // 添加新的
    FKAnnotation *anno = view.annotation;
    if(anno.showDesc) return;
    
    // 删除
    for(id annotation in mapView.annotations)
    {
        if([annotation isKindOfClass:[FKDescAnnotation class]])
        {
            [mapView removeAnnotation:annotation];
        }
        else if ([annotation isKindOfClass:[FKAnnotation class]] && annotation != anno )
        {
            FKAnnotation *otherAnno = annotation;
            otherAnno.showDesc = NO;
        }
    }
    
    anno.showDesc = YES;
    
    // 在这颗被点击的大头针上面添加一颗用于描述的大头针
    FKDescAnnotation *descAnno = [[FKDescAnnotation alloc] init];
    descAnno.tuangou = anno.tuangou;
    [mapView addAnnotation:descAnno];
}
@end
