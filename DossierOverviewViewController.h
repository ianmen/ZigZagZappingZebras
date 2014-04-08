//
//  DossierOverviewViewController.h
//  Kentalis
//
//  Created by Bob Van hees on 08-04-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Observations.h"
#import "Activity.h"

@interface DossierOverviewViewController : UIViewController


@property(nonatomic ,strong) Student *student;
@property(nonatomic ,strong) NSArray *observations;
@property(nonatomic ,strong) Activity *activity;


@end
