//
//  AppDelegate.h
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

