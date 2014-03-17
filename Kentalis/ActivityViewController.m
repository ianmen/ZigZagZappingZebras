//
//  ActivityViewController.m
//  Kentalis
//
//  Created by Bob Van hees on 11-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    
    
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Define the model
    [CoreDataManager sharedManager].modelName = @"Model";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)loadActivities

{
    //First load some dummy data
    //If there is nothing in the database load the predifned data in.
    if ([[Activity all] count] < 1){
        
        Activity *ac = [Activity create];
        ac.title = @"Opstaan";
        [ac save];
        
        Activity *ac1 = [Activity create];
        ac1.title = @"Toilet";
        [ac1 save];
        
        Activity *ac2 = [Activity create];
        ac2.title = @"Douche";
        [ac2 save];
        
        Activity *ac3 = [Activity create];
        ac3.title = @"Afdrogen";
        [ac3 save];
        
        Activity *ac4 = [Activity create];
        ac4.title = @"Lens in/deodorant";
        [ac4 save];
        
        Activity *ac5 = [Activity create];
        ac5.title = @"Aankleden";
        [ac5 save];
        
        Activity *ac6 = [Activity create];
        ac6.title = @"Tandenpoetsen";
        [ac6 save];
        
        Activity *ac7 = [Activity create];
        ac7.title = @"Kalenderboek";
        [ac7 save];
        
        Activity *ac8 = [Activity create];
        ac8.title = @"Overgang";
        [ac8 save];
        
        Activity *ac9 = [Activity create];
        ac9.title = @"Ontbijt";
        [ac9 save];
        
        
        Activity *ac10 = [Activity create];
        ac10.title = @"TV Kijken";
        [ac10 save];
        
        Activity *ac11 = [Activity create];
        ac11.title = @"Jas aan/wachten op stoel";
        [ac11 save];
        
        Activity *ac12 = [Activity create];
        ac12.title = @"Naar school lopen";
        [ac12 save];
        
        Activity *ac13 = [Activity create];
        ac13.title = @"Fruit eten";
        [ac13 save];
        
        Activity *ac14 = [Activity create];
        ac14.title = @"Lunchen";
        [ac14 save];
  
    }
    
    
    //Load them in array
    self.activtyArray = [Activity all];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    [self loadActivities];
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    
    
    return [self.activtyArray count];
}
- (IBAction)addActivity:(id)sender {
    
    //Display
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Activiteit" message:@"Nieuwe activiteit toevoegen" delegate:self cancelButtonTitle:@"Annuleren" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert addButtonWithTitle:@"Opslaan"];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 1) {  //
        
        //Create the new Activity
        UITextField *nieuweActiviteit = [alertView textFieldAtIndex:0];
        Activity *ac = [Activity create];
        ac.title = nieuweActiviteit.text;
        [ac save];
        
        //Refresh the table.
        [self.tableView reloadData];

    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    Activity *ac = [self.activtyArray objectAtIndex:[indexPath item]];
    
    cell.textLabel.text = ac.title;
    
    return cell;
}

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
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
