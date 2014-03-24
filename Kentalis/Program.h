//
//  Program.h
//  Kentalis
//
//  Created by Bob Van hees on 11-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Activity.h"


@interface Program : NSManagedObject

@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) NSString * dayWeek;
@property (nonatomic, retain) Activity *fromActivity;

@end
