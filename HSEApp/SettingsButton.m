//
//  SettingsButton.m
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "SettingsButton.h"

@implementation SettingsButton

@synthesize topBorder = _topBorder;
@synthesize bottomBorder = _bottomBorder;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.topBorder = 1.0;
        self.bottomBorder = 1.0;
    }
    return self;
}

-(void)setTopBorder:(CGFloat)topBorder
{
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, topBorder)];
    
    line.backgroundColor = [UIColor colorWithRed:230/255.f green:230/255.f  blue:230/255.f  alpha:1.f];
    line.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:line];
    _topBorder = topBorder;
}

-(void)setBottomBorder:(CGFloat)bottomBorder
{
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.frame.size.height + 1.f, self.frame.size.width, bottomBorder)];
    
    line.backgroundColor = [UIColor colorWithRed:230/255.f green:230/255.f  blue:230/255.f  alpha:1.f];
    line.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:line];
    _bottomBorder = bottomBorder;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    }];
    
}

@end
