//
//  NotificationDescriptionController.h
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationDescriptionController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;
@property (strong, nonatomic) NSString* descriptionText;
@property (weak, nonatomic) IBOutlet UILabel *subDescriptionLabel;
@property (strong, nonatomic) NSString* subDescriptionText;
@end
