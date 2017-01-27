//
//  NotificationCell.m
//  HSEApp
//
//  Created by Kirill Korolev on 24/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "NotificationCell.h"
#import "CategoryButton.h"

@implementation NotificationCell

@synthesize category = _category;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel sizeToFit];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
