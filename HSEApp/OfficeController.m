//
//  OfficeController.m
//  HSEApp
//
//  Created by Kirill Korolev on 27/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "OfficeController.h"
#import "EmployeeManager.h"
#import "Professor.h"
#import "TabBarController.h"
#import "OfficeStaffCell.h"

@interface OfficeController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UISegmentedControl* segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *dataTable;
@property (strong, nonatomic) EmployeeManager* manager;

@end

@implementation OfficeController

@synthesize dataTable;
@synthesize manager;
@synthesize segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataTable.delegate = self;
    dataTable.dataSource = self;
    
    manager = [[EmployeeManager alloc] init];
    
    segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Учебный офис",@"Преподаватели"]];
    [self handleSegmentedControl];
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self action:@selector(didChangeSegment:) forControlEvents:UIControlEventValueChanged];
    
    dataTable.estimatedRowHeight = segmentedControl.selectedSegmentIndex ? 45.f : 65.f;
    dataTable.rowHeight = UITableViewAutomaticDimension;
    
    dataTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didChangeSegment:(id)sender
{
    [dataTable reloadData];
    dataTable.rowHeight = segmentedControl.selectedSegmentIndex ? 45.f : 65.f;
}

-(void)handleSegmentedControl
{
    [segmentedControl sizeToFit];
    segmentedControl.tintColor = [UIColor whiteColor];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.rightBarButtonItem = nil;
    self.parentViewController.navigationItem.titleView = segmentedControl;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.parentViewController.navigationItem.titleView = nil;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return segmentedControl.selectedSegmentIndex ? manager.professors.count : manager.office.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OfficeStaffCell* cell = [dataTable dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.fullnameLabel.text = segmentedControl.selectedSegmentIndex ? [[manager.professors objectAtIndex:indexPath.row] fullname] : [[manager.office objectAtIndex:indexPath.row] fullname];
    
    cell.postLabel.text = segmentedControl.selectedSegmentIndex ? [[manager.professors objectAtIndex:indexPath.row] post] : [[manager.office objectAtIndex:indexPath.row] post];
    
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
    
    [cell sizeToFit];
    
    return cell;
}

#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"contactDetailsSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}


@end
