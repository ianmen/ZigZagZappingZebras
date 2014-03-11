//
//  Activity.h
//  Kentalis
//
//  Created by Bob Van hees on 11-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Observations, Program;

@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Observations *observed;
@property (nonatomic, retain) Program *inProgram;

@end
