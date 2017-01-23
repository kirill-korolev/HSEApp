//
//  SignInButton.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "SignInButton.h"

@implementation SignInButton

@synthesize borderRadius = _borderRadius;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        self.layer.masksToBounds = YES;
    }
    
    return self;
}

-(void)setBorderRadius:(CGFloat)borderRadius
{
    self.layer.cornerRadius = borderRadius;
}

@end
