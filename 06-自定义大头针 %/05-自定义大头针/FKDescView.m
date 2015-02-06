//
//  FKDescView.m
//  05-自定义大头针
//
//  Created by kun on 15/2/5.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKDescView.h"
#import "FKTuangou.h"

@interface FKDescView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation FKDescView
+ (instancetype)descView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"FKDescView" owner:nil options:nil] lastObject];
}

- (void)setTuangou:(FKTuangou *)tuangou
{
    _tuangou = tuangou;
    
    self.iconView.image = [UIImage imageNamed:tuangou.image];
    self.titleLabel.text = tuangou.title;
    self.descLabel.text = tuangou.desc;
}
@end
