//
//  FKDescAnnotation.m
//  05-自定义大头针
//
//  Created by kun on 15/2/5.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKDescAnnotation.h"
#import "FKTuangou.h"

@implementation FKDescAnnotation
- (void)setTuangou:(FKTuangou *)tuangou
{
    _tuangou = tuangou;
    self.coordinate = tuangou.location;
}

@end
