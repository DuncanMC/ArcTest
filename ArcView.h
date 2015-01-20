//
//  ArcView.h
//  ArcTest
//
//  Created by Duncan Champney on 1/20/15.
//  Copyright (c) 2015 WareTo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArcView : UIImageView
{
  CGRect oldBounds;
  CAShapeLayer *maskLayer;

}

@property (nonatomic, assign) BOOL drawArcClockwise;
@end
