//
//  ArcView.m
//  ArcTest
//
//  Created by Duncan Champney on 1/20/15.
//  Copyright (c) 2015 WareTo. All rights reserved.
//

//test change

#import "ArcView.h"

@implementation ArcView

- (void) setDrawArcClockwise:(BOOL)drawArcClockwise
{
  if (drawArcClockwise == _drawArcClockwise)
    return;
  _drawArcClockwise = drawArcClockwise;
  [self setShapeFromBounds];
}

+ (Class)layerClass
{
  return [CAShapeLayer class];
}


- (void) setShapeFromBounds;
{
    CGFloat startAngle, endAngle;

  CAShapeLayer *myLayer = (CAShapeLayer *)self.layer;
  CGMutablePathRef path = CGPathCreateMutable();
  CGRect bounds = myLayer.bounds;
  bounds = CGRectInset(bounds, myLayer.lineWidth, myLayer.lineWidth);
  
#define fix64BitBug 0
  
#if fix64BitBug
  startAngle = _drawArcClockwise ? 3*M_PI_2 : -M_PI_2;
  endAngle =   _drawArcClockwise ? -M_PI_2  : 3*M_PI_2;
#else
  startAngle = 3*M_PI_2;
  endAngle =   -M_PI_2;
#endif
  CGPathAddArc(path,
               nil,
               CGRectGetMidX(bounds),
               CGRectGetMidY(bounds),
               MIN(bounds.size.width/2, bounds.size.height/2),
               startAngle,
               endAngle,
               _drawArcClockwise
               );
  myLayer.path = path;
  CGPathRelease(path);
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  if (CGRectEqualToRect(self.bounds, oldBounds))
    return;
  [self setShapeFromBounds];
  oldBounds = self.bounds;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder: aDecoder];
  if (!self)
    return nil;
  
  CAShapeLayer *myLayer = (CAShapeLayer *)self.layer;
  myLayer.borderWidth = 1.0;
  myLayer.strokeColor = [UIColor blueColor].CGColor;
  myLayer.fillColor = [UIColor clearColor].CGColor;
  myLayer.lineWidth = 5.0;
  
  _drawArcClockwise = YES;

  //[self setShapeFromBounds];
  
  return self;
}
@end
