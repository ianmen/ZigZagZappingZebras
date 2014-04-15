//
//  DossierStudent2TableViewController.h
//  Kentalis
//
//  Created by Bob Van hees on 15-04-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Activity.h"
#import "Observations.h"

@interface DossierStudent2TableViewController : UITableViewController



@property(nonatomic, strong) Student *student;
@property(nonatomic, strong) Activity *ac1;
@property(nonatomic, strong) NSArray *observation;



@end
