//
//  EvaluateActivityViewController.h
//  Kentalis
//
//  Created by Lars van Beek on 25/03/14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "Activity.h"
#import "Student.h"

#import <UIKit/UIKit.h>

@interface EvaluateActivityViewController : UIViewController

@property (strong, nonatomic) Activity *activity;

@property (strong, nonatomic) Student *student;

@end
