//
//  UserManager.m
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "UserManager.h"
#import "User.h"

@implementation UserManager

+(id)sharedManager
{
    static UserManager* manager = nil;
    
    @synchronized (self) {
        if(manager == nil)
        {
            manager = [[UserManager alloc] init];
        }
    }
    
    return manager;
    
}


-(nullable User *)getUserByMail:(NSString *)email
{
    
    for(NSString* key in [[self users] allKeys])
    {
        NSString* tempEmail = [[self users] valueForKey:key];
        
        if([email isEqualToString:tempEmail])
        {
            User* tempUser = [[User alloc] init];
            tempUser.email = email;
            tempUser.fullname = key;
            return tempUser;
        }
        
    }
    
    
    return nil;
}

-(NSDictionary*)users
{
    return @{@"админ":@"админ", @"admin":@"admin"};
}

@end
