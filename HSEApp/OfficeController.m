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

@interface OfficeController () <UITableViewDelegate, UITableViewDataSource>
{
    NSInteger activeSegment;
}

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
    
    activeSegment = 0;
    
    manager = [[EmployeeManager alloc] init];
    
    segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Учебный офис",@"Преподаватели"]];
    [self handleSegmentedControl];
    segmentedControl.selectedSegmentIndex = activeSegment;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleSegmentedControl
{
    [segmentedControl sizeToFit];
    segmentedControl.tintColor = [UIColor whiteColor];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.titleView = segmentedControl;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.parentViewController.navigationItem.titleView = nil;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc] init];
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
