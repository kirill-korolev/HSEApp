//
//  NotificationManager.h
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationManager : NSObject

@property (strong, nonatomic) NSArray* notifications;

+(id)sharedManager;

@end
