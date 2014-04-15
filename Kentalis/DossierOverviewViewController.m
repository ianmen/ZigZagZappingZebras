//
//  DossierOverviewViewController.m
//  Kentalis
//
//  Created by Bob Van hees on 08-04-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "DossierOverviewViewController.h"
#import "DSBarChart.h"
#import "JBColorConstants.h"
#import "JBConstants.h"
#import "JBFontConstants.h"
#import "JBStringConstants.h"
#import "JBUIConstants.h"
#import "JBBarChartView.h"
#import "JBChartHeaderView.h"
#import "JBBarChartFooterView.h"
#import "JBChartInformationView.h"
#import "Observations.h"

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
    
    //Set some numerics
    
    // Numerics
    CGFloat const kJBBarChartViewControllerChartHeight = 250.0f;
    CGFloat const kJBBarChartViewControllerChartPadding = 10.0f;
    CGFloat const kJBBarChartViewControllerChartHeaderHeight = 80.0f;
    CGFloat const kJBBarChartViewControllerChartHeaderPadding = 10.0f;
    CGFloat const kJBBarChartViewControllerChartFooterHeight = 25.0f;
    CGFloat const kJBBarChartViewControllerChartFooterPadding = 5.0f;
    //CGFloat const kJBBarChartViewControllerBarPadding = 1;
    //NSInteger const kJBBarChartViewControllerNumBars = 12;
    //NSInteger const kJBBarChartViewControllerMaxBarHeight = 10;
    //NSInteger const kJBBarChartViewControllerMinBarHeight = 5;
    CGFloat const kJBBaseChartViewControllerAnimationDuration = 0.25f;
    
    [_monthlySymbols addObject:@"First"];
    [_monthlySymbols addObject:@"Last"];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kJBColorBarChartControllerBackground;
    
    self.barChartView = [[JBBarChartView alloc] init];
    self.barChartView.frame = CGRectMake(kJBBarChartViewControllerChartPadding, kJBBarChartViewControllerChartPadding, self.view.bounds.size.width - (kJBBarChartViewControllerChartPadding * 2), kJBBarChartViewControllerChartHeight);
    self.barChartView.delegate = self;
    self.barChartView.dataSource = self;
    self.barChartView.headerPadding = kJBBarChartViewControllerChartHeaderPadding;
    self.barChartView.backgroundColor = kJBColorBarChartBackground;
    
    JBChartHeaderView *headerView = [[JBChartHeaderView alloc] initWithFrame:CGRectMake(kJBBarChartViewControllerChartPadding, ceil(self.view.bounds.size.height * 0.5) - ceil(kJBBarChartViewControllerChartHeaderHeight * 0.5), self.view.bounds.size.width - (kJBBarChartViewControllerChartPadding * 2), kJBBarChartViewControllerChartHeaderHeight)];
    headerView.titleLabel.text = [kJBStringLabelAverageMonthlyTemperature uppercaseString];
    headerView.subtitleLabel.text = kJBStringLabel2012;
    headerView.separatorColor = kJBColorBarChartHeaderSeparatorColor;
    self.barChartView.headerView = headerView;
    
    JBBarChartFooterView *footerView = [[JBBarChartFooterView alloc] initWithFrame:CGRectMake(kJBBarChartViewControllerChartPadding, ceil(self.view.bounds.size.height * 0.5) - ceil(kJBBarChartViewControllerChartFooterHeight * 0.5), self.view.bounds.size.width - (kJBBarChartViewControllerChartPadding * 2), kJBBarChartViewControllerChartFooterHeight)];
    footerView.padding = kJBBarChartViewControllerChartFooterPadding;
    footerView.leftLabel.text = [[_monthlySymbols firstObject] uppercaseString];
    footerView.leftLabel.textColor = [UIColor whiteColor];
    footerView.rightLabel.text = [[_monthlySymbols lastObject] uppercaseString];
    footerView.rightLabel.textColor = [UIColor whiteColor];
    self.barChartView.footerView = footerView;
    JBChartInformationView *view;
    
    self.informationView = [view initWithFrame:CGRectMake(self.view.bounds.origin.x, CGRectGetMaxY(self.barChartView.frame), self.view.bounds.size.width, self.view.bounds.size.height - CGRectGetMaxY(self.barChartView.frame) - CGRectGetMaxY(self.navigationController.navigationBar.frame))];
    
    
    [self.view addSubview:self.barChartView];
    
    [self.view addSubview:self.barChartView];
    [self.barChartView reloadData];

}

- (NSInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    return 5;
}

- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtAtIndex:(NSInteger)index
{
  
    NSLog(@"%i", arc4random() % 20);
    //We need array for each of the arguments
    // 1 Slaap
    // 2 doezelig
    // 3 Alert
    // 4 Hoog Alert
    // 5 Stress
    
    int a = 0;
    
    for (Observations* key in _observation) {
       // a + key.altertness;
    }
    
    
 
    
      return arc4random() % 20;
    
}



- (UIColor *)barSelectionColorForBarChartView:(JBBarChartView *)barChartView
{
    return [UIColor whiteColor];
}

- (void)barChartView:(JBBarChartView *)barChartView didSelectBarAtIndex:(NSUInteger)index touchPoint:(CGPoint)touchPoint
{
   // NSNumber *valueNumber = [self.chartData objectAtIndex:index];
    NSNumber *valueNumber = [NSNumber numberWithInt:1];
    [self.informationView setValueText:[NSString stringWithFormat:kJBStringLabelDegreesFahrenheit, [valueNumber intValue], kJBStringLabelDegreeSymbol] unitText:nil];
    [self.informationView setTitleText:kJBStringLabelWorldwideAverage];
    [self.informationView setHidden:NO animated:YES];
    [self setTooltipVisible:YES animated:YES atTouchPoint:touchPoint];
    [self.tooltipView setText:[[self.monthlySymbols objectAtIndex:index] uppercaseString]];
    
}

- (void)didUnselectBarChartView:(JBBarChartView *)barChartView
{
    [self.informationView setHidden:YES animated:YES];
    [self setTooltipVisible:NO animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated atTouchPoint:(CGPoint)touchPoint
{
    _tooltipVisible = tooltipVisible;
    
    JBChartView *chartView = [self chartView];
    
    
        self.tooltipView = [JBChartTooltipView init];
        self.tooltipView.alpha = 0.0;
        [self.view addSubview:self.tooltipView];
    
    
    dispatch_block_t adjustTooltipPosition = ^{
        CGPoint originalTouchPoint = [self.view convertPoint:touchPoint fromView:chartView];
        CGPoint convertedTouchPoint = originalTouchPoint; // modified
        JBChartView *chartView = [self chartView];
        if (chartView)
        {
            CGFloat minChartX = (chartView.frame.origin.x + ceil(self.tooltipView.frame.size.width * 0.5));
            if (convertedTouchPoint.x < minChartX)
            {
                convertedTouchPoint.x = minChartX;
            }
            CGFloat maxChartX = (chartView.frame.origin.x + chartView.frame.size.width - ceil(self.tooltipView.frame.size.width * 0.5));
            if (convertedTouchPoint.x > maxChartX)
            {
                convertedTouchPoint.x = maxChartX;
            }
            self.tooltipView.frame = CGRectMake(convertedTouchPoint.x - ceil(self.tooltipView.frame.size.width * 0.5), CGRectGetMaxY(chartView.headerView.frame), self.tooltipView.frame.size.width, self.tooltipView.frame.size.height);
            
            CGFloat minTipX = (chartView.frame.origin.x + self.tooltipView.frame.size.width);
            if (originalTouchPoint.x < minTipX)
            {
                originalTouchPoint.x = minTipX;
            }
            CGFloat maxTipX = (chartView.frame.origin.x + chartView.frame.size.width - self.tooltipView.frame.size.width);
            if (originalTouchPoint.x > maxTipX)
            {
                originalTouchPoint.x = maxTipX;
            }
            self.tooltipView.frame = CGRectMake(originalTouchPoint.x - ceil(self.tooltipView.frame.size.width * 0.5), CGRectGetMaxY(self.tooltipView.frame), self.tooltipView.frame.size.width, self.tooltipView.frame.size.height);
        }
    };
    
    dispatch_block_t adjustTooltipVisibility = ^{
        self.tooltipView.alpha = _tooltipVisible ? 1.0 : 0.0;
        self.tooltipView.alpha = _tooltipVisible ? 1.0 : 0.0;
	};
    
    if (tooltipVisible)
    {
        adjustTooltipPosition();
    }
    
    if (animated)
    {
        CGFloat const kJBBaseChartViewControllerAnimationDuration = 0.25f;
        [UIView animateWithDuration: kJBBaseChartViewControllerAnimationDuration animations:^{
            adjustTooltipVisibility();
        } completion:^(BOOL finished) {
            if (!tooltipVisible)
            {
                adjustTooltipPosition();
            }
        }];
    }
    else
    {
        adjustTooltipVisibility();
    }
}


- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated
{
    [self setTooltipVisible:tooltipVisible animated:animated atTouchPoint:CGPointZero];
}

- (void)setTooltipVisible:(BOOL)tooltipVisible
{
    [self setTooltipVisible:tooltipVisible animated:NO];
}

#pragma mark - Getters

- (JBChartView *)chartView
{
    // Subclasses should return chart instance for tooltip functionality
    return nil;
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
