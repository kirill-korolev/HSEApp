//
//  Lesson.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "Lesson.h"

@implementation Lesson

@synthesize title = _title;
@synthesize professor = _professor;
@synthesize address = _address;
@synthesize startingTime = _startingTime;
@synthesize lessonType = _lessonType;

-(id)initWithTitle:(NSString *)title professor:(NSString *)professor address:(NSString *)address startingTime:(NSString*)time lessonType:(LessonType)type
{
    self = [super init];
    
    if(self)
    {
        self.title = title;
        self.professor = professor;
        self.address = address;
        self.startingTime = time;
        self.lessonType = type;
    }
    
    return  self;
}

@end
