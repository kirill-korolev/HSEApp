//
//  SignInField.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "SignInField.h"
#import <QuartzCore/QuartzCore.h>

@implementation SignInField

@synthesize borderWidth = _borderWidth;
@synthesize borderColor = _borderColor;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        [self updateProperties];
    }
    
    return self;
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    [self.layer setBorderWidth:borderWidth];
    self.borderStyle = UITextBorderStyleRoundedRect;
    [self updateProperties];
}

-(void)setBorderColor:(UIColor *)borderColor
{
    [self.layer setBorderColor:[borderColor CGColor]];
    [self updateProperties];
}

-(void)updateProperties
{
    self.layer.cornerRadius = 6.0f;
    self.layer.masksToBounds = YES;
}

@end
