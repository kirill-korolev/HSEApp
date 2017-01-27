//
//  NotificationSection.m
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "NotificationSection.h"

@implementation NotificationSection

@synthesize notifications;
@synthesize date;

-(id)initWithNotifications:(NSArray *)latestNotifications date:(NSString *)currentDate
{
    self = [super init];
    
    if(self)
    {
        self.notifications = [NSArray arrayWithArray:latestNotifications];
        self.date = currentDate;
    }
    
    return self;
}

@end
