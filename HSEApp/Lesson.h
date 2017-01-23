//
//  Lesson.h
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    LessonTypeLecture,
    LessonTypeSeminar,
    LessonTypeScientificResearchSeminar
}LessonType;

@interface Lesson : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* professor;
@property (strong, nonatomic) NSString* address;
@property (strong, nonatomic) NSString* startingTime;
@property (assign, nonatomic) LessonType lessonType;

-(id)initWithTitle:(NSString*)title professor:(NSString*)professor address:(NSString*)address startingTime:(NSString*)time lessonType:(LessonType) type;

@end
