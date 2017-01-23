//
//  UserManager.h
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface UserManager : NSObject

+(id)sharedManager;
-(User*)getUserByMail:(NSString*)email;

@end
