//
//  NotificationDescriptionController.m
//  HSEApp
//
//  Created by Kirill Korolev on 21/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "NotificationDescriptionController.h"
#import "CategoryButton.h"

@interface NotificationDescriptionController ()
@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *subDescriptionLabel;
@end

@implementation NotificationDescriptionController

@synthesize descriptionLabel;
@synthesize descriptionText;
@synthesize subDescriptionText;
@synthesize subDescriptionLabel;
@synthesize date;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* labels = @[descriptionLabel, subDescriptionLabel];
    
    for(UILabel* label in labels)
    {
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.numberOfLines = 0;
        [label sizeToFit];
    }
    
    [self didRecieveDataFromCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didRecieveDataFromCell
{
    [descriptionLabel setText:descriptionText];
    [subDescriptionLabel setText:subDescriptionText];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
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
