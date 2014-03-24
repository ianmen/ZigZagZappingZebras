//
//  StudentDetailsViewController.h
//  Kentalis
//
//  Created by Lars van Beek on 17/03/14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "Student.h"
#import "Program.h"
#import "Activity.h"

#import <UIKit/UIKit.h>

@interface StudentDetailsViewController : UITableViewController

@property (nonatomic, strong) Student *student;
@property (nonatomic, strong) NSArray *program;

@property (strong, nonatomic) IBOutlet UILabel *activityCellLabel;
@property (strong, nonatomic) IBOutlet UILabel *transitionToActivityLabel;

@end
