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
    
    self.title = self.student.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(id)sender {
    
    self.user.name = @"Lars van Beek";
    
    if ([self.transition  isEqual: @"yes"]) {
        self.observation.altertness = [NSNumber numberWithInt:self.evaluationSegmentedControl.selectedSegmentIndex];
        self.observation.comment = self.notesTextField.text;
        self.observation.forActivity = self.activity;
        self.observation.fromStudent = self.student;
        self.observation.byUser = self.user;
        NSLog(@"%@", self.observation.fromStudent.name);
        //self.student.observations = self.observation;
    } else {
        self.observation.altertness = [NSNumber numberWithInt:self.evaluationSegmentedControl.selectedSegmentIndex];
        self.observation.comment = self.notesTextField.text;
        self.observation.forActivity = self.activity;
        self.observation.fromStudent = self.student;
        self.observation.byUser = self.user;
        NSLog(@"%@", self.observation.fromStudent.name);
        //self.student.observations = self.observation;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
