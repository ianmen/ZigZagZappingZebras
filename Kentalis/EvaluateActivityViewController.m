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
    if ([self.transition  isEqual: @"yes"]) {
        self.observation.altertness = [NSNumber numberWithInt:self.evaluationSegmentedControl.selectedSegmentIndex];
        self.observation.comment = self.notesTextField.text;
    } else {
        self.observation.altertness = [NSNumber numberWithInt:self.evaluationSegmentedControl.selectedSegmentIndex];
        self.observation.comment = self.notesTextField.text;
    }
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
