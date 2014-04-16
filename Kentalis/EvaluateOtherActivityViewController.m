//
//  EvaluateOtherActivityViewController.m
//  Kentalis
//
//  Created by Lars van Beek on 16/04/14.
//  Copyright (c) 2014 Tilburg University. All rights reserved.
//

#import "EvaluateOtherActivityViewController.h"

@interface EvaluateOtherActivityViewController ()

@end

@implementation EvaluateOtherActivityViewController

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
    
    self.activities = [Activity all];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.activities != nil) {
        return [self.activities count];
    } else {
        return 0;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    //you can also write code here to descide what data to return depending on the component ("column")
    if (self.activities != nil) {
        Activity *activity = [self.activities objectAtIndex:row];
        return activity.title;//assuming the array contains strings..
    }
    return @"";//or nil, depending how protective you are
}

- (IBAction)saveButtonPressed:(id)sender {
    
    //Creation of the user
    NSArray *user = [User where:@"name == 'Lars van Beek'"];
    User *userLars = user[0];
    
    Observations *observation = [Observations create];
    observation.altertness = [NSNumber numberWithInt:self.evaluationSegmentedControl.selectedSegmentIndex];
    observation.comment = self.notesTextField.text;
    observation.date = [NSDate date];
    observation.forActivity = self.activity;
    observation.fromStudent = self.student;
    observation.byUser = userLars;
    [observation save];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
