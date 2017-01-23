//
//  Week.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "Week.h"

@implementation Week

@synthesize days = _days;

-(id)initWithDays:(NSDictionary*)days
{
    self = [super init];
    
    if(self)
    {
        self.days = [[NSDictionary alloc] initWithDictionary:days];
    }
    
    return self;
}

@end
