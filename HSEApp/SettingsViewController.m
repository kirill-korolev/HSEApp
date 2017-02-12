//
//  SettingsViewController.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "SettingsViewController.h"
#import "User.h"
#import "NSUserDefaults+ModifiedDefaults.h"
#import "SettingsButton.h"
#import "TabBarController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet SettingsButton *signOutButton;
@property (weak, nonatomic) IBOutlet UILabel *fullnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *mailLabel;

@end

@implementation SettingsViewController

@synthesize signOutButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    User* user = [userDefaults loadCustomObjectWithKey:@"user"];
    
    [_fullnameLabel setText:user.fullname];
    [_mailLabel setText:user.email];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.rightBarButtonItem = nil;
    self.parentViewController.navigationItem.title = TabBarSettingsLiteral;
}
- (IBAction)didTouchExitButton:(id)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"];
    
    [self performSegueWithIdentifier:@"exitSegue" sender:self];
    
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
