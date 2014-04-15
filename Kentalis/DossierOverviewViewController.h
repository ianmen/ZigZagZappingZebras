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
#import "JBChartInformationView.h"
#import "JBChartTooltipView.h"


@interface DossierOverviewViewController : UIViewController<JBBarChartViewDataSource,JBBarChartViewDelegate>

- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated atTouchPoint:(CGPoint)touchPoint;
- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated;

@property(nonatomic, strong) Student *student;
@property(nonatomic, strong) Activity *ac1;
@property(nonatomic, strong) NSArray *observation;


@property(nonatomic, strong) JBBarChartView *barChartView;
@property(nonatomic, strong) JBChartInformationView *informationView;
@property(nonatomic, strong)  NSMutableArray *monthlySymbols;
@property (nonatomic, strong) JBChartTooltipView *tooltipView;
@property (nonatomic, assign) BOOL tooltipVisible;
@end
