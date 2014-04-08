//
//  User.h
//  Kentalis
//
//  Created by Bob Van hees on 11-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Observations;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) Observations *madeObservation;

@end
