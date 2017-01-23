//
//  LessonsManager.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "LessonsManager.h"
#import "Day.h"
#import "Lesson.h"
#import "Week.h"

@implementation LessonsManager

@synthesize data = _data;

-(instancetype)init
{
    self = [super init];
    
    if(self)
    {
        
        Lesson* lesson1 = [[Lesson alloc] initWithTitle:@"Теория вероятностей и математическая статистика (рус)" professor:@"Кирсанов Александр Петрович" address:@"Кирпичная ул., д.33, 902" startingTime:@"10:30" lessonType:LessonTypeLecture];
 
        Lesson* lesson2 = [[Lesson alloc] initWithTitle:@"Дискретная математика (рус)" professor:@"Лебедев Алексей Николаевич" address:@"Кирпичная ул., д.33, 534" startingTime:@"12:10" lessonType:LessonTypeLecture];
        
        Lesson* lesson3 = [[Lesson alloc] initWithTitle:@"Проектный семинар (рус)" professor:@"Гостев Иван Михайлович" address:@"Кирпичная ул., д.33, 404" startingTime:@"13:40" lessonType:LessonTypeScientificResearchSeminar];
        
        Day* day1 = [[Day alloc] initWithLessons:[[NSMutableArray alloc] initWithObjects:lesson1, lesson2, lesson3, nil] dayOfWeek:@"Понедельник" date:@"16.01.2017"];
        
        Day* day2 = [[Day alloc] initWithLessons:[[NSMutableArray alloc] initWithObjects:lesson1, lesson2, lesson3, nil] dayOfWeek:@"Вторник" date:@"17.01.2017"];

        Day* day3 = [[Day alloc] initWithLessons:nil dayOfWeek:@"Среда" date:@"18.01.2017"];
        
        
        Week* week1 = [[Week alloc] initWithDays:@{@"Понедельник": day1, @"Вторник":day2, @"Среда":day3}];
        
        Week* week2 = [[Week alloc] initWithDays:@{@"Понедельник": day2, @"Вторник":day3, @"Среда":day1}];
        
        self.data = [[NSMutableArray alloc] initWithArray:[[NSMutableArray alloc] initWithObjects:week1, week2, nil]];
        
    }
    
    return self;
}

+(id)sharedManager
{
    LessonsManager* sharedManager = nil;
    
    @synchronized (self) {
        if(sharedManager == nil)
        {
            sharedManager = [[LessonsManager alloc] init];
        }
    }
    
    return sharedManager;
    
    
}


@end
