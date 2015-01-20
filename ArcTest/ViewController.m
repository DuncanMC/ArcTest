//
//  ViewController.m
//  ArcTest
//
//  Created by Duncan Champney on 1/20/15.
//  Copyright (c) 2015 WareTo. All rights reserved.
//

#import "ViewController.h"
#import "ArcView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  theClockwiseSwitch.on = YES;
  [self handleClockwiseSwitch: theClockwiseSwitch];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)handleClockwiseSwitch:(id)sender
{
  theArcView.drawArcClockwise = theClockwiseSwitch.isOn;
}


@end
