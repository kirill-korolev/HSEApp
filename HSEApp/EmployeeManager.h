//
//  EmployeeManager.h
//  HSEApp
//
//  Created by Kirill Korolev on 27/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeManager : NSObject

@property (strong, nonatomic) NSArray* office;
@property (strong, nonatomic) NSArray* professors;

-(id)sharedManager;

@end
