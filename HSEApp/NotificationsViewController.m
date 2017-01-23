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

@interface NotificationsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NotificationManager* manager;
@property (weak, nonatomic) IBOutlet UITableView* dataTable;

@end

@implementation NotificationsViewController

@synthesize dataTable;
@synthesize manager;

- (void)viewDidLoad {
    [super viewDidLoad];

    
    dataTable.delegate = self;
    dataTable.dataSource = self;
    
    manager = [[NotificationManager alloc] init];
    
    dataTable.estimatedRowHeight = 44.f;
    dataTable.rowHeight = UITableViewAutomaticDimension;
    dataTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.title = @"Доска объявлений";
}


#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dataTable.bounds.size.width, 1.f)];
    [headerView setBackgroundColor:[UIColor colorWithRed:216/255.f green:216/255.f blue:216/255.f alpha:1.f]];
    
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(15,0,dataTable.bounds.size.width,30.f)];
    headerLabel.textColor = [UIColor blackColor];
    NotificationSection* NSSection = [manager.notifications objectAtIndex:section];
    
    headerLabel.text = [NSString stringWithFormat:@"%@",  NSSection.date];
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


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [dataTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSIndexPath* path = [dataTable indexPathForCell:cell];
    NSInteger sectionNumber = path.section;
    
    cell.preservesSuperviewLayoutMargins = false;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
    Notification* currentNotification = [[[manager.notifications objectAtIndex:sectionNumber] notifications] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = currentNotification.title;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    [cell.textLabel sizeToFit];
    
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
    NotificationDescriptionController* destinationController = [segue destinationViewController];
    
    UITableViewCell* tempCell = (UITableViewCell*)sender;
    NSIndexPath* path = [dataTable indexPathForCell:tempCell];
    NSInteger sectionIndex = path.section;
    NSInteger cellIndex = [[dataTable indexPathForSelectedRow] row];
    destinationController.descriptionText = [[[[manager.notifications objectAtIndex:sectionIndex] notifications] objectAtIndex:cellIndex] title];
    destinationController.subDescriptionText = [[[[manager.notifications objectAtIndex:sectionIndex] notifications] objectAtIndex:cellIndex] descriptionText];
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
