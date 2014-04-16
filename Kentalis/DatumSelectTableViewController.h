//
//  DatumSelectTableViewController.h
//  Kentalis
//
//  Created by Bob Van hees on 16-04-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Activity.h"
#import "Observations.h"
@interface DatumSelectTableViewController : UITableViewController

-(void)loadData;

@property (strong, nonatomic) NSArray *observationArray;
@property (strong, nonatomic) NSOrderedSet *orderedSet;
@property(nonatomic, strong) Student *student;
@property(nonatomic, strong) Activity *ac23;
@property(nonatomic, strong) Observations *obj1;


@end
