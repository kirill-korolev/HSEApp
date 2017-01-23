//
//  NotificationDescriptionController.m
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "NotificationDescriptionController.h"

@interface NotificationDescriptionController ()

@end

@implementation NotificationDescriptionController

@synthesize descriptionLabel;
@synthesize descriptionText;
@synthesize subDescriptionText;
@synthesize subDescriptionLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [descriptionLabel setText:descriptionText];
    descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    descriptionLabel.numberOfLines = 0;
    [descriptionLabel sizeToFit];

    [subDescriptionLabel setText:descriptionText];
    subDescriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    subDescriptionLabel.numberOfLines = 0;
    [subDescriptionLabel sizeToFit];
    
    self.navigationController.navigationBar.topItem.title = @"";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
