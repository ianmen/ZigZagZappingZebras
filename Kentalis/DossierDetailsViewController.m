//
//  DossierDetailsViewController.m
//  Kentalis
//
//  Created by Bob Van hees on 25-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "DossierDetailsViewController.h"
#import "Observations.h"
#import "Activity.h"
#import "DossierOverviewViewController.h"
#import "DossierStudent2TableViewController.h"
#import "DossierStudent2TableViewController.h"

@interface DossierDetailsViewController ()

@end

@implementation DossierDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

       
    }
    return self;
}

-(void)loadData {
    
    // Custom initialization
    // Instalization by searching for the assosiated activites which are belloning to this student.
    
    
    _observationArray = [Observations where:@{@"fromStudent": self.student}];

    
    

    //Do a DISTINCT on them
    NSArray *states = [_observationArray valueForKey:@"forActivity"];
    _orderedSet = [NSOrderedSet orderedSetWithArray:states];
     NSLog(@"Array after distinct: %i", [_orderedSet count]);
    
    //So the OrderdSet should only contain activities of this student with a Distinct on them.
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set view title
    self.title = [NSString stringWithFormat:@"%@ - Selecteer activiteit",self.student.name];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [self loadData];

    return [_orderedSet count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"reusableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    _ac23 = [_orderedSet objectAtIndex:indexPath.row];

    
    //Fill in the cell.
    cell.textLabel.text = _ac23.title;
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //Load in the new detail view controller of the dossier
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    

    _ac23 = [_orderedSet objectAtIndex:indexPath.row];
    
    DossierStudent2TableViewController *destination = (DossierStudent2TableViewController *)[segue destinationViewController];
    
    //Set the student of the destination view controllerer
    destination.student = self.student;
    destination.ac1 = self.ac23;
    
    

    _observationArray = [Observations where:@{@"fromStudent": self.student,
                                              @"forActivity": self.ac23}];
    

    
    
    destination.observation = _observationArray;
    
}

@end
