//
//  Notification.h
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    ScheduleCategory,
    DifferentCategory,
    PaymentCategory
}Category;

@interface Notification : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* descriptionText;
@property (assign, nonatomic) Category category;

-(id)initWithTitle:(NSString*)headerTitle descriptionText:(NSString*) text category:(Category) group;

@end
