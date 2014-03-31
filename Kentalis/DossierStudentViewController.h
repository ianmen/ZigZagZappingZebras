//
//  DossierStudentViewController.h
//  Kentalis
//
//  Created by Bob Van hees on 31-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
#import "Student.h"

@interface DossierStudentViewController : UIViewController


@property (nonatomic , strong) Student *student;
@property (nonatomic , strong) Observations *obser;
 
@end
