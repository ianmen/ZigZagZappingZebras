//
//  StudentsViewController
//  Kentalis
//
//  Created by Bob Van hees on 10-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "StudentsViewController.h"
#import "Student.h"

@interface StudentsViewController ()

@end

@implementation StudentsViewController

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

    // Define the model we would use
    [CoreDataManager sharedManager].modelName = @"Model";
    
    //Load the students
    [self loadStudents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadStudents
{
    //Method for loading students from Webserive.
    
    
    
    
    
    //After loading students from webservice create NSMangedObject for each of them.
    //Load in the dummy data
    
    int i = 0;
    while ( i < 10) {
        
        Student *bob = [Student create];
        bob.name = @"John";
        [bob save];
        i++;
        
    }


}


@end
