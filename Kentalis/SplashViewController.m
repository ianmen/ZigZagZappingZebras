//
//  SplashViewController.m
//  Kentalis
//
//  Created by Bob Van hees on 10-03-14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "SplashViewController.h"
#import "Student.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

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
    NSLog(@"Testing loadstudents");
    
    //After loading students from webservice create NSMangedObject for each of them.
    Student *bob = [Student create];
    bob.name = @"John";
    [bob save];

}


@end
