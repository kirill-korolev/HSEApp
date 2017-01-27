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
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.bounds.size.width, topBorder)];
    
    line.backgroundColor = [UIColor colorWithRed:230/255.f green:230/255.f  blue:230/255.f  alpha:1.f];
    line.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:line];
    _topBorder = topBorder;
}

-(void)setBottomBorder:(CGFloat)bottomBorder
{
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.bounds.size.height+1.f, self.bounds.size.width, bottomBorder)];
    
    line.backgroundColor = [UIColor colorWithRed:230/255.f green:230/255.f  blue:230/255.f  alpha:1.f];
    line.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:line];
    _bottomBorder = bottomBorder;
}

/*-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for(UIView* view in self.subviews)
    {
        NSLayoutConstraint* widthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1.f constant:0.0];
        
        NSLayoutConstraint* heightConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NSConstantValueExpressionType attribute:NSLayoutAttributeHeight multiplier:1.f constant:self.topBorder];
        [self addConstraint:widthConstraint];
        [view addConstraint:heightConstraint];
    }
}
 */

@end
