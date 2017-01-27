//
//  TimeTableViewController.m
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import "TimeTableViewController.h"
#import "LessonsManager.h"
#import "Week.h"
#import "Day.h"
#import "Lesson.h"
#import "TimeTableCell.h"
#import "WeekSwitchButton.h"
#import "TabBarController.h"

@interface TimeTableViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* daysOfWeek;
}

@property (weak, nonatomic) IBOutlet UITableView *dataTable;
@property (weak, nonatomic) IBOutlet WeekSwitchButton *prevButton;
@property (weak, nonatomic) IBOutlet WeekSwitchButton *nextButton;
@property (strong, nonatomic) LessonsManager* manager;
@property (assign, nonatomic) NSInteger numberOfWeek;
@property (strong, nonatomic) UIBarButtonItem* datePicker;


@end

@implementation TimeTableViewController

@synthesize dataTable;
@synthesize manager;
@synthesize numberOfWeek;
@synthesize datePicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    numberOfWeek = 0;
    dataTable.delegate = self;
    dataTable.dataSource = self;
    
    daysOfWeek = @[@"Понедельник",@"Вторник",@"Среда",@"Четверг",@"Пятница",@"Суббота"];
    manager = [[LessonsManager alloc] init];
    
    UINib* nib = [UINib nibWithNibName:@"TimeTableCell" bundle:nil];
    [self.dataTable registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    
    dataTable.estimatedRowHeight = 92.0f;
    dataTable.rowHeight = UITableViewAutomaticDimension;
    
    [self activateOrDeactivateButtons];
    
    UIImage* datePickerImage = [UIImage imageNamed:@"timetable.png"];
    datePicker = [[UIBarButtonItem alloc] initWithImage:datePickerImage style:UIBarButtonItemStyleDone target:self action:@selector(didTouchBarButtonItem:)];
    datePicker.tintColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.parentViewController.navigationItem.rightBarButtonItem = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.leftBarButtonItem = nil;
    self.parentViewController.navigationItem.rightBarButtonItem = datePicker;
    self.parentViewController.navigationItem.title = TabBarTimeTableLiteral;
}

-(void)didTouchBarButtonItem:(id)sender
{
    [self performSegueWithIdentifier:@"datePickerSegue" sender:self];
    
}

- (IBAction)didTouchPrevWeekButton:(id)sender {
    if(numberOfWeek > 0)
    {
        numberOfWeek--;
        [dataTable reloadData];
        [self activateOrDeactivateButtons];
    }
}

- (IBAction)didTouchNextWeekButton:(id)sender {
    if(numberOfWeek < manager.data.count - 1)
    {
        numberOfWeek++;
        [dataTable reloadData];
        [self activateOrDeactivateButtons];
    }
}

-(void)activateOrDeactivateButtons
{
    if(numberOfWeek > 0)
    {
        _prevButton.backgroundColor = [UIColor colorWithRed:0.f green:71/255.f blue:136/255.f alpha:1.f];
        _prevButton.enabled = YES;
    }
    else
    {
        _prevButton.backgroundColor = [UIColor colorWithRed:216/255.f green:216/255.f blue:216/255.f alpha:1.f];
        _prevButton.enabled = NO;
    }
    
    if(numberOfWeek < manager.data.count - 1)
    {
       _nextButton.backgroundColor = [UIColor colorWithRed:0.f green:71/255.f blue:136/255.f alpha:1.f];
        _nextButton.enabled = YES;
    }
    else
    {
        _nextButton.backgroundColor = [UIColor colorWithRed:216/255.f green:216/255.f blue:216/255.f alpha:1.f];
        _nextButton.enabled = NO;
    }
    
    
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[manager.data objectAtIndex:numberOfWeek] days] count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Week* week = [manager.data objectAtIndex:numberOfWeek];
    Day* day = [week.days valueForKey:[daysOfWeek objectAtIndex:section]];
    
    if([day.lessons count] > 0)
    {
        return [day.lessons count];
    }
    
    return 0;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dataTable.bounds.size.width, 1.f)];
    [headerView setBackgroundColor:[UIColor colorWithRed:216/255.f green:216/255.f blue:216/255.f alpha:1.f]];

    Week* week = [manager.data objectAtIndex:numberOfWeek];
    Day* day = [week.days objectForKey:[daysOfWeek objectAtIndex:section]];
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(15,0,dataTable.bounds.size.width,30.f)];
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.text = [NSString stringWithFormat:@"%@, %@", day.dayOfWeek, day.date];
    headerLabel.font = [UIFont fontWithName:@"SFUIText-Regular" size:12.f];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    Week* week = [manager.data objectAtIndex:numberOfWeek];
    Day* day = [week.days objectForKey:[daysOfWeek objectAtIndex:section]];
 
    UIView* footerView = [[UIView alloc] init];

    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, footerView.bounds.size.width, 1.f)];
    line.translatesAutoresizingMaskIntoConstraints = NO;
    line.backgroundColor = [UIColor colorWithRed:230/255.f green:230/255.f  blue:230/255.f  alpha:1.f];
    
    NSLayoutConstraint* lineWidthConstraint = [NSLayoutConstraint constraintWithItem:footerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:line attribute:NSLayoutAttributeWidth multiplier:1.f constant:0.0];
    NSLayoutConstraint* lineBottomConstraint = [NSLayoutConstraint constraintWithItem:footerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:line attribute:NSLayoutAttributeTop multiplier:1.f constant:0.0];
    NSLayoutConstraint* lineHeightConstraint = [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NSConstantValueExpressionType attribute:NSLayoutAttributeHeight multiplier:1.f constant:1.f];
    
    [footerView addConstraint:lineWidthConstraint];
    [footerView addConstraint:lineBottomConstraint];
    [line addConstraint:lineHeightConstraint];
    [footerView addSubview:line];
    
    if(day.lessons.count == 0)
    {
        footerView.frame = dataTable.bounds;
        [footerView setBackgroundColor:[UIColor colorWithRed:238/255.f green:238/255.f blue:238/255.f alpha:1.f]];
        
        UILabel* footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, footerView.bounds.size.width, 51.f)];
        [footerLabel setText:@"Нет занятий"];
        footerLabel.translatesAutoresizingMaskIntoConstraints = NO;
        footerLabel.font = [UIFont fontWithName:@"SFUIText-Regular" size:14.f];
        footerLabel.textAlignment = NSTextAlignmentCenter;
        [footerLabel setTextColor:[UIColor colorWithRed:128/255.f green:128/255.f blue:128/255.f alpha:1.f]];

        NSLayoutConstraint* labelWidthConstraint = [NSLayoutConstraint constraintWithItem:footerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:footerLabel attribute:NSLayoutAttributeWidth multiplier:1.f constant:0.0];
        
         NSLayoutConstraint* labelCenterXConstraint = [NSLayoutConstraint constraintWithItem:footerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:footerLabel attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.0];
        
        NSLayoutConstraint* labelHeightConstraint = [NSLayoutConstraint constraintWithItem:footerLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NSConstantValueExpressionType attribute:NSLayoutAttributeHeight multiplier:1.f constant:51.f];
        
        [footerView addConstraint:labelWidthConstraint];
        [footerView addConstraint:labelCenterXConstraint];
        [footerLabel addConstraint:labelHeightConstraint];
        [footerView addSubview:footerLabel];
    }
    
    return footerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    Week* week = [manager.data objectAtIndex:numberOfWeek];
    Day* day = [week.days objectForKey:[daysOfWeek objectAtIndex:section]];
    
    if(day.lessons.count == 0)
    {
        return 51.0f;
    }
    
    return 25.0f;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TimeTableCell* cell = [dataTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSIndexPath* path = [self.dataTable indexPathForCell:cell];
    NSInteger sectionNumber = path.section;
    
    Week* currentWeek = [manager.data objectAtIndex:numberOfWeek];
    Day* currentDay = [currentWeek.days valueForKey:[daysOfWeek objectAtIndex:sectionNumber]];
    Lesson* currentLesson = [currentDay.lessons objectAtIndex:indexPath.row];
    
    
    
    cell.startingTimeLabel.text = currentLesson.startingTime;
    cell.finishingTimeLabel.text = currentLesson.startingTime;
    
    NSString* lessonTypeString;
    
    switch(currentLesson.lessonType)
    {
        case LessonTypeLecture:
            lessonTypeString = @"Лекция";
            break;
        case LessonTypeSeminar:
            lessonTypeString = @"Семинар";
            break;
        case LessonTypeScientificResearchSeminar:
            lessonTypeString = @"Научно-исследовательский семинар";
            break;
    }
    
    cell.lessonTypeLabel.text = lessonTypeString;
    cell.titleLabel.text = currentLesson.title;
    
    
    cell.preservesSuperviewLayoutMargins = false;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
    
    return cell;
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
