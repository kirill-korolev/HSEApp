//
//  NotificationCell.h
//  HSEApp
//
//  Created by Kirill Korolev on 24/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"

@interface NotificationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (assign, nonatomic) Category category;

@end
