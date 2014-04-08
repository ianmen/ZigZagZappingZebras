//
//  DossierOverviewViewController.h
//  Kentalis
//
//  Created by Bob Van hees on 08-04-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Activity.h"
#import "JBBarChartView.h"
#import "JBChartView.h"
#import "JBLineChartView.h"


@interface DossierOverviewViewController : UIViewController<JBBarChartViewDataSource,JBBarChartViewDelegate>


@property(nonatomic, strong) Student *student;
@property(nonatomic, strong) Activity *ac1;
@property(nonatomic, strong) NSArray *observation;
@end
