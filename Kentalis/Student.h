//
//  Student.h
//  Kentalis
//
//  Created by Bob Van hees on 10-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ObjectiveRecord.h"


@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * name;

@end
