//
//  Observations.h
//  Kentalis
//
//  Created by Bob Van hees on 11-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface Observations : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * altertness;
@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) Student *fromStudent;
@property (nonatomic, retain) NSManagedObject *byUser;
@property (nonatomic, retain) NSManagedObject *forActivity;

@end
