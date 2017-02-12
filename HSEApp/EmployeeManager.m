//
//  EmployeeManager.m
//  HSEApp
//
//  Created by Kirill Korolev on 27/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "EmployeeManager.h"
#import "Professor.h"

@implementation EmployeeManager

@synthesize office;
@synthesize professors;

-(id)sharedManager
{
    static EmployeeManager* sharedManager = nil;
    
    @synchronized (self) {
        if(sharedManager == nil)
        {
            sharedManager = [[EmployeeManager alloc] init];
        }
    }
    
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        office = @[[[Professor alloc] initWithName:@"Самохин Михаил Юрьевич" position:@"Начальник отдела"],[[Professor alloc] initWithName:@"Дробот Галина Борисовна" position:@"Диспетчер"],[[Professor alloc] initWithName:@"Кораблева Галина Юрьевна" position:@"Специалист по УМР (1 и 2 курс)"],[[Professor alloc] initWithName:@"Гурова Екатерина Васильевна" position:@"Специалист по УМР (3 и 4 курс)"]];
        
        professors = @[[[Professor alloc] initWithName:@"Самохин Михаил Юрьевич" position:@"Начальник отдела"],[[Professor alloc] initWithName:@"Дробот Галина Борисовна" position:@"Диспетчер"]];
        
    }
    return self;
}


@end
