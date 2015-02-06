//
//  FKDescView.h
//  05-自定义大头针
//
//  Created by kun on 15/2/5.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FKTuangou;
@interface FKDescView : UIView
+ (instancetype)descView;
@property (nonatomic, strong) FKTuangou *tuangou;
@end
