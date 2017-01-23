//
//  TimeTableCell.h
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *startingTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *finishingTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lessonTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
