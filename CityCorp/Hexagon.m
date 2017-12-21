//
//  Hexagon.m
//  CityCorp
//
//  Created by Dino Martinez on 12/12/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Hexagon.h"

@implementation Hexagon

-(void)drawRect:(CGRect)rect {
    double x = 51;
    double y = 51;
    double x1 = 16;
    double y1 = 29;
    while(y>100/3 && y<900/3){
        y = y + 175/3;
        x = 51/3;
        while(x>50/3 && x<900/4 /* - y/2 && x<900/7 + y/2 && x > -900/7 + y/2 */){
            x = x + 100/3;
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            //   CGContextRotateCTM(context, 30*M_PI/180);
            int sides = 6;
            double size = 100.0/3;
            CGPoint center = CGPointMake(x, y);
            //  rotate slope equation 30 degrees
            double radius = size / 2.0;
            double theta = 2 * M_PI / sides;
    
            CGContextMoveToPoint(context, center.x, center.y-radius);
            for (NSUInteger k=1; k<sides; k++) {
                float x = radius * sin(k * theta);
                float y = radius * cos(k * theta);
                CGContextAddLineToPoint(context, center.x+x, center.y-y);
            }
    
            CGContextClosePath(context);
            //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
            //    CGContextFillPath(context);
            CGContextSetRGBStrokeColor(context, 1.0, 1.0, 0.0, 1.0);
            CGContextSetLineWidth(context, 2);
            CGContextStrokePath(context);
    
            context = UIGraphicsGetCurrentContext();
            //   CGContextRotateCTM(context, 30*M_PI/180);
            center = CGPointMake(x, y);
    
            CGContextMoveToPoint(context, center.x, center.y-radius);
            for (NSUInteger k=1; k<sides; k++) {
                float x = radius * sin(k * theta);
                float y = radius * cos(k * theta);
                CGContextAddLineToPoint(context, center.x+x, center.y-y);
            }
            CGContextClosePath(context);
            CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.1);
            CGContextFillPath(context);
            
     
            center = CGPointMake(x+x1, y+y1);
            //  rotate slope equation 30 degrees
            
            CGContextMoveToPoint(context, center.x, center.y-radius);
            for (NSUInteger k=1; k<sides; k++) {
                float x = radius * sin(k * theta);
                float y = radius * cos(k * theta);
                CGContextAddLineToPoint(context, center.x+x, center.y-y);
            }
            
            CGContextClosePath(context);
            //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
            //    CGContextFillPath(context);
            CGContextSetRGBStrokeColor(context, 1.0, 1.0, 0.0, 1.0);
            CGContextSetLineWidth(context, 2);
            CGContextStrokePath(context);
            
            context = UIGraphicsGetCurrentContext();
            //   CGContextRotateCTM(context, 30*M_PI/180);
            center = CGPointMake(x+x1, y+y1);
            
            CGContextMoveToPoint(context, center.x, center.y-radius);
            for (NSUInteger k=1; k<sides; k++) {
                float x = radius * sin(k * theta);
                float y = radius * cos(k * theta);
                CGContextAddLineToPoint(context, center.x+x, center.y-y);
            }
            CGContextClosePath(context);
            CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.1);
            CGContextFillPath(context);
     
        }
    }
    
    
}
@end
