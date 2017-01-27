//
//  Professor.m
//  HSEApp
//
//  Created by Kirill Korolev on 27/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "Professor.h"

@implementation Professor

@synthesize fullname;
@synthesize post;

-(id)initWithName:(NSString *)name position:(NSString *)position
{
    if(self = [super init])
    {
        self.fullname = fullname;
        self.post = position;
    }
    
    return self;
}

@end
