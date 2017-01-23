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


-(id)initWithTitle:(NSString *)headerTitle descriptionText:(NSString *)text
{
    self = [super init];
    
    if(self)
    {
        self.title = headerTitle;
        self.descriptionText = text;
    }
    return self;
}

@end
