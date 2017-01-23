//
//  AuthViewController.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "AuthViewController.h"
#import "SignInField.h"
#import "UserManager.h"
#import "NSUserDefaults+ModifiedDefaults.h"

@interface AuthViewController ()
{
    __weak IBOutlet SignInField *mailField;
    __weak IBOutlet SignInField *passField;
    UserManager* manager;
}

@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    manager = [[UserManager alloc] init];
    
    if([[NSUserDefaults standardUserDefaults] loadCustomObjectWithKey:@"user"])
    {
        [self performSegueWithIdentifier:@"authSegue" sender:self];
    }
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didTouchSignInButton:(id)sender
{
    if(![mailField.text isEqual:@""] && ![passField.text isEqual:@""] && mailField.text != nil && passField.text != nil)
    {
        NSString* tempMail = mailField.text;
        
        if([manager getUserByMail:tempMail])
        {
            User* tempUser = [manager getUserByMail:tempMail];
            
            [[NSUserDefaults standardUserDefaults] saveCustomObject:tempUser key:@"user"];
            [self performSegueWithIdentifier:@"authSegue" sender:self];
        }
    }
}

- (IBAction)signInTroubleShoot:(id)sender {
    
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
