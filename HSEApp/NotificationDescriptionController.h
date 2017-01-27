//
//  NotificationDescriptionController.h
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface NotificationDescriptionController : UIViewController

@property (strong, nonatomic) NSString* descriptionText;
@property (strong, nonatomic) NSString* subDescriptionText;
@property (assign, nonatomic) NSString* date;
@end
