//
//  StudentDetailsViewController.m
//  Kentalis
//
//  Created by Lars van Beek on 17/03/14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "StudentDetailsViewController.h"
#import "EvaluateActivityViewController.h"

@interface StudentDetailsViewController ()

@end

@implementation StudentDetailsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set view title
    self.title = self.student.name;
    
    // Get current day of the week
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dayOfWeek = [[dateFormatter stringFromDate:[NSDate date]] lowercaseString];
    
    // Get program for current day
    self.program = [Program where:@{ @"dayWeek" : dayOfWeek }];
    self.enumerator = self.program.objectEnumerator;
    
    // Get the first activity of the program
    self.tempProgram = self.enumerator.nextObject;
    self.currentActivity = self.tempProgram.fromActivity;
    
    // Set program dependent cell content
    self.activityCellLabel.text = [NSString stringWithFormat:@"Activiteit: %@", self.currentActivity.title];
    
    // Get next activity for transition cell
    self.tempProgram = self.enumerator.nextObject;
    self.nextActivity = self.tempProgram.fromActivity;
    
    self.transitionToActivityLabel.text = [NSString stringWithFormat:@"Overgang naar: %@", self.nextActivity.title];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EvaluateActivityViewController *destination = (EvaluateActivityViewController *)[segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"evaluateCurrentActivity"]) {
        destination.student = self.student;
        destination.activity = self.currentActivity;
    } else if ([segue.identifier isEqualToString:@"evaluateOtherActivity"]) {
        destination.student = self.student;
    } else if ([segue.identifier isEqualToString:@"evaluateNextActivity"]) {
        destination.student = self.student;
        destination.activity = self.nextActivity;
        
        // Set the new current activity
        self.currentActivity = self.nextActivity;
        
        // Get the new next activity
        self.tempProgram = self.enumerator.nextObject;
        self.nextActivity = self.tempProgram.fromActivity;
        
        if (self.nextActivity == NULL) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            
            // Disable the rotating cell
            cell.userInteractionEnabled = NO;
            
            // Set new content of the activity cells
            self.activityCellLabel.text = [NSString stringWithFormat:@"Activiteit: %@", self.currentActivity.title];
            self.transitionToActivityLabel.text = [NSString stringWithFormat:@"Dit was de laatste activiteit"];
        } else {
            // Set new content of the activity cells
            self.activityCellLabel.text = [NSString stringWithFormat:@"Activiteit: %@", self.currentActivity.title];
            self.transitionToActivityLabel.text = [NSString stringWithFormat:@"Overgang naar: %@", self.nextActivity.title];
        }
    }
}

#pragma mark - Table view data source
/*

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
