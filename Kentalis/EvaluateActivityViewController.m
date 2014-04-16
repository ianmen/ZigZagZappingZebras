//
//  EvaluateActivityViewController.m
//  Kentalis
//
//  Created by Lars van Beek on 25/03/14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "EvaluateActivityViewController.h"

@interface EvaluateActivityViewController ()

@end

@implementation EvaluateActivityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(id)sender {
    
    //Creation of the user
    NSArray *user = [User where:@"name == 'Lars van Beek'"];
    User *userLars = user[0];
    
    Observations *observation = [Observations create];
    observation.altertness = [NSNumber numberWithInt:self.evaluationSegmentedControl.selectedSegmentIndex];
    observation.comment = self.notesTextField.text;
    
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
                                    fromDate:[NSDate date]];
    NSDate *startDate = [[NSCalendar currentCalendar]
                         dateFromComponents:components];
    
    
    observation.date = startDate;
    observation.forActivity = self.activity;
    observation.fromStudent = self.student;
    observation.byUser = userLars;
    [observation save];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
   // NSManagedObjectContext *context = [CoreDataManager sharedManager].managedObjectContext;
    //Observations *ob1 = [NSEntityDescription
     //                                 insertNewObjectForEntityForName:@"Observations"
     //                                 inManagedObjectContext:context];
    //ob1.altertness = [NSNumber numberWithInt:self.evaluationSegmentedControl.selectedSegmentIndex];
    //ob1.comment = self.notesTextField.text;
    //ob1.date = [NSDate date];
    //ob1.forActivity = self.activity;
    //ob1.fromStudent = self.student;
    //ob1.byUser = userLars;

    
    //NSError *error;
    //if (![context save:&error]) {
       // NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    //}
    
//
}

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
