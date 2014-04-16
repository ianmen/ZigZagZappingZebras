//
//  DatumSelectTableViewController.m
//  Kentalis
//
//  Created by Bob Van hees on 16-04-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "DatumSelectTableViewController.h"
#import "Observations.h"
#import "DossierStudent2TableViewController.h"

@interface DatumSelectTableViewController ()

@end

@implementation DatumSelectTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        
    
        
        
    }
    return self;
}


-(void)loadData {
    
    // Custom initialization
    // Instalization by searching for the assosiated activites which are belloning to this student.
    
    
    //_observationArray = [Observations where:@{@"fromStudent": self.student,
                                            //  @"forActivity": self.ac23}];
  
    
    //So the OrderdSet should only contain activities of this student with a Distinct on them.
    
    NSArray *states = [_observationArray valueForKey:@"date"];
    _orderedSet = [NSOrderedSet orderedSetWithArray:states];
    //NSLog(@"Array after distinct: %i", [_orderedSet count]);
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    return [_observationArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"reusableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    _obj1 = [_observationArray objectAtIndex:indexPath.row];
    
    
    //Fill in the cell.
   
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    
    //Optionally for time zone converstions
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    NSString *stringFromDate = [formatter stringFromDate:_obj1.date];
    
    cell.textLabel.text = stringFromDate;
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //Load in the new detail view controller of the dossier
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    
    Observations *obj22 = [_orderedSet objectAtIndex:indexPath.row];
    
    DossierStudent2TableViewController *destination = (DossierStudent2TableViewController *)[segue destinationViewController];
    
    //Set the student of the destination view controllerer
    destination.student = self.student;
    destination.ac1 = self.ac23;
    
    
    
    _observationArray = [Observations where:@{@"fromStudent": self.student,
                                              @"forActivity": self.ac23,
                                              @"date": obj22.date}];
    
    
    
    
    destination.observation = _observationArray;
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
