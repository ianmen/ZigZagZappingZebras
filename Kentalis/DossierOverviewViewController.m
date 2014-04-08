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
    
    JBBarChartView *barChartView = [[JBBarChartView alloc] init];
    barChartView.delegate = self;
    barChartView.dataSource = self;
    [self.view addSubview:barChartView];
    
    barChartView.frame = CGRectMake(5, 5, 315, 50);
    [barChartView reloadData];
    

}

- (NSInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    return 10;
}

- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtAtIndex:(NSInteger)index
{
    return 100;
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
