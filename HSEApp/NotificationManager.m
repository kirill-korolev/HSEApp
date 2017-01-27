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
        
        Notification* notification1 = [[Notification alloc] initWithTitle:@"Отчисление студентов, зачисленных на основании межправительственных соглашений" descriptionText:@"23 и 24 февраля-выходные дни (четверг-пятница). 25 февраля (суббота)-учебный день согласно расписанию субботы. В марте только один выходной-8 марта(среда)." category:ScheduleCategory];
 
        Notification* notification2 = [[Notification alloc] initWithTitle:@"2 курс-27 января-изменения в расписании занятий" descriptionText:@"В связи с проведением олимпиады, 27 января (пятница) в расписании есть некоторые изменения. Время проведения занятий -не меняется, только: Английский язык -занятия в группах преподавателя Кашкаровой Т.П , пройдут в 830 комп. классе (8 этаж) Английский язык занятия в группах преподавателя Смыгуновой Е,А., пройдут в ауд. 208. Занятие в группе 152(2)-преп. Вайсман А.С.- пройдет в 401 комп. классе" category:PaymentCategory];
 
        Notification* notification3 = [[Notification alloc] initWithTitle:@"3 курс-27 января -изменения в расписании" descriptionText:@"Внимание! В связи с проведением олимпиады, 27 января (пятница) лекция по инновационному менеджменту (преп.Дискин И.Е.) переносится на 7 февраля (вторник) на 15.10 (две пары) ауд.534. Судьба лекции по Анализу и совершенствованию БП-решается. Все семинарские занятия по расписанию." category:DifferentCategory];
        
        NotificationSection* section1 = [[NotificationSection alloc] initWithNotifications:@[notification1, notification2] date:@"10.01.2017"];

        NotificationSection* section2 = [[NotificationSection alloc] initWithNotifications:@[notification3, notification2] date:@"12.01.2017"];
        
        self.notifications = @[section1, section2];
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
