//
//  ArcView.m
//  ArcTest
//
//  Created by Duncan Champney on 1/20/15.
//  Copyright (c) 2015 WareTo. All rights reserved.
//

#import "ArcView.h"

@implementation ArcView

- (void) setDrawArcClockwise:(BOOL)drawArcClockwise
{
  if (drawArcClockwise == _drawArcClockwise)
    return;
  _drawArcClockwise = drawArcClockwise;
  [self setShapeFromBoundsWithAnimation: YES];
}


- (void) setShapeFromBoundsWithAnimation: (BOOL) animate;
{
  maskLayer.frame = self.layer.bounds;
  CGMutablePathRef path = CGPathCreateMutable();
  CGRect bounds = self.layer.bounds;
  CGFloat height, width;
  height = bounds.size.height;
  width = bounds.size.width;
  CGFloat radius = sqrtf(width * width + height * height)/2;
  maskLayer.lineWidth = radius;

  CGFloat start =_drawArcClockwise ? M_PI * 1.5 :-M_PI_2;
  CGFloat end = !_drawArcClockwise ? M_PI * 1.5 :-M_PI_2;
  CGPathAddArc(path,
               nil,
               CGRectGetMidX(bounds),
               CGRectGetMidY(bounds),
               radius/2,
               start,
               end,
               _drawArcClockwise
               );
  maskLayer.path = path;
  CGPathRelease(path);
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  
  animation.duration = 1;
  
  animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  animation.autoreverses = YES;
  animation.fromValue = [NSNumber numberWithFloat: 1.0];
  
  animation.toValue = [NSNumber numberWithFloat: 0.0];
  [maskLayer addAnimation: animation forKey: @"Woof"];
  
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  if (CGRectEqualToRect(self.bounds, oldBounds))
    return;
  [self setShapeFromBoundsWithAnimation: NO];
  oldBounds = self.bounds;
}

- (void) doInitSetup
{
  self.layer.borderWidth = 1;
  self.layer.borderColor = [UIColor blueColor].CGColor;
  maskLayer = [CAShapeLayer layer];
  maskLayer.frame = self.layer.bounds;
  maskLayer.fillColor = [UIColor clearColor].CGColor;
  maskLayer.strokeColor = [UIColor blackColor].CGColor;
  self.layer.mask = maskLayer;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder: aDecoder];
  if (!self)
    return nil;
  
  maskLayer.fillColor = [UIColor clearColor].CGColor;
  
  [self doInitSetup];
  [self setShapeFromBoundsWithAnimation: NO];
  
  return self;
}
@end
