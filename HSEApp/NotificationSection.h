//
//  NotificationSection.h
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationSection : NSObject

@property (strong, nonatomic) NSArray* notifications;
@property (strong, nonatomic) NSString* date;

-(id)initWithNotifications:(NSArray*)latestNotifications date:(NSString*)currentDate;

@end
