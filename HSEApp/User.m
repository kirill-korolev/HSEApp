//
//  User.m
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize email;
@synthesize fullname;

#pragma mark - NSCoding

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.fullname forKey:@"fullname"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.fullname = [aDecoder decodeObjectForKey:@"fullname"];
    }
    
    return self;
}



@end
