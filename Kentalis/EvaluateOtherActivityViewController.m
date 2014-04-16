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
    [self.activityPickerVIew selectRow:6 inComponent:0 animated:NO];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
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
    if (self.activities != nil) {
        Activity *activity = [self.activities objectAtIndex:row];
        return activity.title;
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.activity = [self.activities objectAtIndex:row];
    
    //NSLog(@"Geselecteerde activiteit: %@. Index van de geselecteerde activiteit: %i", [self.activities objectAtIndex:row], row);
}

- (IBAction)saveButtonPressed:(id)sender {
    if (self.activity != nil) {
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
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Activiteit"
                                                        message:@"U dient een activiteit te selecteren."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
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
