//
//  Professor.h
//  HSEApp
//
//  Created by Kirill Korolev on 27/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Professor : NSObject

@property (strong, nonatomic) NSString* fullname;
@property (strong, nonatomic) NSString* post;


-(id)initWithName :(NSString*) name position: (NSString*) position;

@end
