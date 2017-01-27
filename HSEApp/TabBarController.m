//
//  TabBarController.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "TabBarController.h"

NSString* const TabBarTimeTableLiteral = @"Расписание";
NSString* const TabBarNotificationsLiteral = @"Доска объявлений";
NSString* const TabBarSettingsLiteral = @"Настройки";
NSString* const TabBarOfficeLiteral = @"Контакты";

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
