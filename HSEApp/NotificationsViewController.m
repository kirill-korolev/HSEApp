//
//  NotificationsViewController.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "NotificationsViewController.h"
#import "NotificationManager.h"
#import "Notification.h"
#import "NotificationSection.h"
#import "NotificationDescriptionController.h"
#import "NotificationCell.h"
#import "TabBarController.h"

@interface NotificationsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NotificationManager* manager;
@property (weak, nonatomic) IBOutlet UITableView* dataTable;
@property (strong, nonatomic) UIBarButtonItem* categoryPicker;

@end

@implementation NotificationsViewController

@synthesize dataTable;
@synthesize manager;
@synthesize categoryPicker;

- (void)viewDidLoad {
    [super viewDidLoad];

    
    dataTable.delegate = self;
    dataTable.dataSource = self;
    
    manager = [[NotificationManager alloc] init];
    
    dataTable.estimatedRowHeight = 60.f;
    dataTable.rowHeight = UITableViewAutomaticDimension;
    dataTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    UINib* nib = [UINib nibWithNibName:@"NotificationCell" bundle:nil];
    [dataTable registerNib:nib forCellReuseIdentifier:@"Cell"];
 
    
    UIImage* categoryPickerImage = [UIImage imageNamed:@"notifications.png"];
    categoryPicker = [[UIBarButtonItem alloc] initWithImage:categoryPickerImage style:UIBarButtonItemStyleDone target:self action:@selector(didTouchBarButtonItem:)];
    categoryPicker.tintColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didTouchBarButtonItem:(id) sender
{
    [self performSegueWithIdentifier:@"categoryPickSegue" sender:self];
}


-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.title = TabBarNotificationsLiteral;
    self.parentViewController.navigationItem.rightBarButtonItem = categoryPicker;
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dataTable.bounds.size.width, 1.f)];
    [headerView setBackgroundColor:[UIColor colorWithRed:216/255.f green:216/255.f blue:216/255.f alpha:1.f]];
    
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(15,0,dataTable.bounds.size.width,30.f)];
    headerLabel.textColor = [UIColor blackColor];
    NotificationSection* notificationSection = [manager.notifications objectAtIndex:section];
    
    headerLabel.text = [NSString stringWithFormat:@"%@", notificationSection.date];
    headerLabel.font = [UIFont fontWithName:@"SFUIText-Regular" size:12.f];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return manager.notifications.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[[manager.notifications objectAtIndex:section] notifications] count];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dataTable.bounds.size.width, 5.f)];
    
    UIView* line = [[UIView alloc] initWithFrame:CGRectZero];
    line.backgroundColor = [UIColor colorWithRed:230/255.f green:230/255.f  blue:230/255.f  alpha:1.f];
    line.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint* widthConstraint = [NSLayoutConstraint constraintWithItem:footerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:line attribute:NSLayoutAttributeWidth multiplier:1.f constant:0.0];
 
    NSLayoutConstraint* heightConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NSConstantValueExpressionType attribute:NSLayoutAttributeHeight multiplier:1.f constant:1.f];
    
    [footerView addConstraint:widthConstraint];
    [line addConstraint:heightConstraint];
    
    [footerView addSubview:line];
    footerView.backgroundColor = nil;
    
    return footerView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 25.f;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NotificationCell* cell = [dataTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.preservesSuperviewLayoutMargins = false;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
    Notification* currentNotification = [[[manager.notifications objectAtIndex:indexPath.section] notifications] objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = currentNotification.title;
    
    UIView* customView = [[UIView alloc] init];
    customView.backgroundColor = [UIColor colorWithRed:230/255.f green:230/255.f  blue:230/255.f alpha:1.f];
    cell.selectedBackgroundView = customView;
    [cell sizeToFit];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"descriptionSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"categoryPickSegue"])
    {
        
    }
    else
    {
        NotificationDescriptionController* destinationController = [segue destinationViewController];
        
        NSIndexPath* path = [dataTable indexPathForSelectedRow];
        NSInteger sectionIndex = path.section;
        NSInteger cellIndex = [[dataTable indexPathForSelectedRow] row];
        
        NotificationSection* section = [manager.notifications objectAtIndex:sectionIndex];
        Notification* notification = [section.notifications objectAtIndex:cellIndex];
        
        destinationController.descriptionText = notification.title;
        destinationController.subDescriptionText = notification.descriptionText;
        destinationController.date = section.date;
    }
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
