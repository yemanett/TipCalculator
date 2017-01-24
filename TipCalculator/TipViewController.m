//
//  ViewController.m
//  TipCalculator
//
//  Created by Yemane Tekleab on 1/23/17.
//  Copyright © 2017 Yemane Tekleab. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *defaultValue = [defaults objectForKey:@"defaultTip"];
    self.tipControl.selectedSegmentIndex = [defaultValue integerValue];
    
    [self updateValues];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (IBAction)onValueChanged:(UISegmentedControl *)sender {
     [self updateValues];
}

- (void)updateValues {
    // Get bill amount
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@0.15, @0.2,@0.25];
    

    
    //calculate tip amount
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = tipAmount + billAmount;
    
    //update the UI
    self.tipLabel.text = [NSString stringWithFormat: @"$%0.2f", tipAmount  ];
    self.totalLabel.text = [NSString stringWithFormat: @"$%0.2f", totalAmount  ];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

@end
