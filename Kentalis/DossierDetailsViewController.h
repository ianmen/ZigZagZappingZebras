//
//  DossierDetailsViewController.h
//  Kentalis
//
//  Created by Bob Van hees on 25-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Observations.h"
#import "Activity.h"

@interface DossierDetailsViewController : UITableViewController

-(void)loadData;

@property (nonatomic, strong) Student *student;
@property (strong, nonatomic) NSArray *observationArray;
@property (strong, nonatomic) NSOrderedSet *orderedSet;
@property (strong, nonatomic) Activity *ac23;

@end
