//
//  NotificationCategoryController.m
//  HSEApp
//
//  Created by Kirill Korolev on 28/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "NotificationCategoryController.h"

@interface NotificationCategoryController () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray* coursePickerData;
    NSArray* categoryPickerData;
    NSArray* pickerViews;
}
@property (weak, nonatomic) IBOutlet UIPickerView *coursePickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPickerView;

@end

@implementation NotificationCategoryController

@synthesize coursePickerView;
@synthesize categoryPickerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    coursePickerData = @[@"1", @"2", @"3", @"4"];
    categoryPickerData = @[@"Изменение в расписании", @"Оплата обучения", @"Разное"];
    
    self.coursePickerView.delegate = self;
    self.coursePickerView.dataSource = self;
    
    self.categoryPickerView.delegate = self;
    self.categoryPickerView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    pickerViews = @[coursePickerView, categoryPickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.title = @"Категории";
}

#pragma mark - UIPickerViewDelegate

-(UIView *)viewForRow:(NSInteger)row forComponent:(NSInteger)component
{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, coursePickerView.bounds.size.width, coursePickerView.bounds.size.height)];
    
    label.text = [coursePickerData objectAtIndex:row];
    
    return label;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.tableView.bounds.size.width, 25.f)];
    
    return headerView;
}

#pragma mark - UIPickerViewDataSource

-(void)viewDidLayoutSubviews
{
    for(UIPickerView* pickerView in pickerViews)
    {
        for(UIView* subview in pickerView.subviews){
            if(subview.frame.origin.y != 0){
                [subview setHidden:YES];
            }
        }
    }

}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if([pickerView isEqual:coursePickerView])
    {
        return coursePickerData.count;
    }
    return categoryPickerData.count;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* label = (id)view;
    
    if(!label)
    {
        label = [[UILabel alloc] initWithFrame:pickerView.bounds];
    }
    
    NSString* tempString;
    
    if([pickerView isEqual:coursePickerView])
    {
        tempString = [coursePickerData objectAtIndex:row];
    }
    else
    {
        tempString = [categoryPickerData objectAtIndex:row];
    }
    
    
    [label setText: tempString];
    label.textAlignment = NSTextAlignmentRight;
    [label setTextColor:[UIColor blackColor]];
    label.font = [UIFont fontWithName:@"SFUIText-Regular" size:17.f];
    
    
    return label;
}



@end
