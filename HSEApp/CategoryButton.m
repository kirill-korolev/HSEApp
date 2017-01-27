//
//  CategoryButton.m
//  HSEApp
//
//  Created by Kirill Korolev on 24/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "CategoryButton.h"

@implementation CategoryButton

@synthesize borderRadius = _borderRadius;
@synthesize color = _color;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.masksToBounds = YES;
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.contentEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8);
    self.enabled = NO;
}

-(void)setBorderRadius:(CGFloat)borderRadius
{
    self.layer.cornerRadius = borderRadius;
}


@end
