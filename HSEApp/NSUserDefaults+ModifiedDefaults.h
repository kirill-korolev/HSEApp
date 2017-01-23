//
//  NSUserDefaults+ModifiedDefaults.h
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface NSUserDefaults (ModifiedDefaults)

-(void)saveCustomObject:(User*) object key:(NSString*)key;
-(User*)loadCustomObjectWithKey:(NSString*)key;

@end
