//
//  DossierOverviewViewController.m
//  Kentalis
//
//  Created by Bob Van hees on 08-04-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "DossierOverviewViewController.h"
#import "DSBarChart.h"
@interface DossierOverviewViewController ()

@end

@implementation DossierOverviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    
//    NSArray *vals = [NSArray arrayWithObjects:
//                     [NSNumber numberWithInt:30],
//                     [NSNumber numberWithInt:40],
//                     [NSNumber numberWithInt:20],
//                     [NSNumber numberWithInt:56],
//                     [NSNumber numberWithInt:70],
//                     [NSNumber numberWithInt:34],
//                     [NSNumber numberWithInt:43],
//                     nil];
//    NSArray *refs = [NSArray arrayWithObjects:@"M", @"Tu", @"W", @"Th", @"F", @"Sa", @"Su", nil];
//    DSBarChart *chrt = [[DSBarChart alloc] initWithFrame:ChartView.bounds
//                                                   color:[UIColor greenColor]
//                                              references:refs
//                                               andValues:vals];
//    chrt.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    chrt.bounds = ChartView.bounds;
//    [ChartView addSubview:chrt];
//    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
