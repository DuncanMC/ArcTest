//
//  ViewController.h
//  ArcTest
//
//  Created by Duncan Champney on 1/20/15.
//  Copyright (c) 2015 WareTo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArcView;

@interface ViewController : UIViewController
{
  __weak IBOutlet ArcView *theArcView;
  __weak IBOutlet UISwitch *theClockwiseSwitch;
}

@end

