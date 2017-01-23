//
//  NotificationManager.m
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "NotificationManager.h"
#import "Notification.h"
#import "NotificationSection.h"

@implementation NotificationManager

@synthesize notifications;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        Notification* notification1 = [[Notification alloc] initWithTitle:@"Задание по философии на 3 модуль" descriptionText:@"Описание задания"];
 
        Notification* notification2 = [[Notification alloc] initWithTitle:@"Задание по философии на 3 модуль" descriptionText:@"Описание задания"];
 
        Notification* notification3 = [[Notification alloc] initWithTitle:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore" descriptionText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."];
        
        NotificationSection* section1 = [[NotificationSection alloc] initWithNotifications:@[notification1, notification2] date:@"10.01.2017"];

        NotificationSection* section2 = [[NotificationSection alloc] initWithNotifications:@[notification3, notification2] date:@"12.01.2017"];
        
        self.notifications = @[section2, section1];
    }
    return self;
}


+(id)sharedManager
{
    NotificationManager* sharedManager = nil;
    
    @synchronized (self) {
        if(sharedManager == nil)
        {
            sharedManager = [[NotificationManager alloc] init];
        }
    }
    
    return sharedManager;
    
}

@end
