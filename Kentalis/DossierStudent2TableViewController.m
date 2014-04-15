//
//  DossierStudent2TableViewController.m
//  Kentalis
//
//  Created by Bob Van hees on 15-04-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "DossierStudent2TableViewController.h"

@interface DossierStudent2TableViewController (){
    int slaap;
    int doezelig;
    int alert;
    int hoogalert;
    int stress;
    
}

@end

@implementation DossierStudent2TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        slaap = 0;
        doezelig = 0;
        alert = 0;
        hoogalert = 0;
        stress = 0;
        
        
        //Do a for each for all the observations
        for (Observations *ob in _observation) {
            
            
            if(ob.altertness.intValue == 0) slaap++;
            if(ob.altertness.intValue == 1) doezelig++;
            if(ob.altertness.intValue == 2) alert++;
            if(ob.altertness.intValue == 3) hoogalert++;
            if(ob.altertness.intValue == 4) stress++;

                
        }
    }
    return self;
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

    // Return the number of rows in the section.
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"table" forIndexPath:indexPath];
    
    // Configure the cell's
    // Slaap
    // Doezelig
    // Alert
    // Hoog Alert
    // Stress
    
    if(indexPath.row == 0 )cell.textLabel.text = [NSString stringWithFormat:@"%i - Slaap", slaap];
    if(indexPath.row == 1 )cell.textLabel.text = [NSString stringWithFormat:@"%i - Doezelig", doezelig];
    if(indexPath.row == 2 )cell.textLabel.text = [NSString stringWithFormat:@"%i - Alert", alert];
    if(indexPath.row == 3 )cell.textLabel.text = [NSString stringWithFormat:@"%i - Hoog Alert",hoogalert];
    if(indexPath.row == 4 )cell.textLabel.text = [NSString stringWithFormat:@"%i - Stress", stress];
    
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
