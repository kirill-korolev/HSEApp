//
//  LessonsManager.h
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LessonsManager : NSObject

@property (strong, nonatomic) NSMutableArray* data;

+(id)sharedManager;

@end
