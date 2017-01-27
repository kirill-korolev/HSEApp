//
//  Notification.m
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "Notification.h"

@implementation Notification

@synthesize title;
@synthesize descriptionText;
@synthesize category;

-(id)initWithTitle:(NSString *)headerTitle descriptionText:(NSString *)text category:(Category) group
{
    self = [super init];
    
    if(self)
    {
        self.title = headerTitle;
        self.descriptionText = text;
        self.category = group;
    }
    return self;
}

@end
