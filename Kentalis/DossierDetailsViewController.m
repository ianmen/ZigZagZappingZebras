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

@interface DossierDetailsViewController ()

@end

@implementation DossierDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // Instalization by searching for the assosiated activites which are belloning to this student.
        
  
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set view title
    self.title = self.student.name;

    
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
    //return [self.studentsArray count];
    
    for(Observations *ob in self.student.observations){
        
        NSLog(@"%@", ob.date);
        
    }

    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"reusableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Student *student = [self.studentsArray objectAtIndex:indexPath.row];
    
    //cell.textLabel.text = [student name];
    
    return cell;
}

@end
