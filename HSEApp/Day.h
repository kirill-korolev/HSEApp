//
//  Day.h
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Lesson;

@interface Day : NSObject

@property (strong, nonatomic) NSMutableArray* lessons;
@property (strong, nonatomic) NSString* dayOfWeek;
@property (strong, nonatomic) NSString* date;


-(id)initWithLessons:(NSMutableArray*)lessons dayOfWeek:(NSString*)dayOfWeek date:(NSString*) date;

@end
