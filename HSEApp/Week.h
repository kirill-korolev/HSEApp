//
//  Week.h
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Week : NSObject

@property (strong, nonatomic) NSDictionary* days;

-(id)initWithDays:(NSDictionary*) days;

@end
