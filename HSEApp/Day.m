//
//  Day.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "Day.h"
#import "Lesson.h"

@implementation Day

@synthesize lessons = _lessons;
@synthesize dayOfWeek = _dayOfWeek;
@synthesize date = _date;

-(id)initWithLessons:(NSMutableArray *)lessons dayOfWeek:(NSString *)dayOfWeek date:(NSString *)date
{
    self = [super init];
    
    if(self)
    {
        self.lessons = [[NSMutableArray alloc] initWithArray:lessons];
        self.dayOfWeek = dayOfWeek;
        self.date = date;
    }
    
    return  self;
}

@end
