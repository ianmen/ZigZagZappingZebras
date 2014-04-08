//
//  EvaluateActivityViewController.h
//  Kentalis
//
//  Created by Lars van Beek on 25/03/14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "Activity.h"
#import "Student.h"
#import "Observations.h"
#import "User.h"

#import <UIKit/UIKit.h>

@interface EvaluateActivityViewController : UIViewController

- (IBAction)saveButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UISegmentedControl *evaluationSegmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *notesTextField;

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Activity *activity;
@property (strong, nonatomic) Student *student;
@property (strong, nonatomic) Observations *observation;

@property (strong, nonatomic) NSString *transition;

@end
