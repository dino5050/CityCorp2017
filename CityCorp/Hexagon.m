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


int number;

-(void)drawRect:(CGRect)rect {
    int x = 51;
    int y = 51;
    int x1 = 16;
    int y1 = 29;
    int i = 0;
  //  while(y>100/3 && y<900/8){
    number = 0;
    while(i<4){
        y = y + 175/3;
        x = 51/3;
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<6){
            x = x + 100/3;
            if((i!=0 || j!=0) && (i!=0 || j!=4) && (i!=3 || j!=4) && (i!=3 || j!=0) && (i!=0 || j!=5) && (i!=3 || j!=5)){
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
            CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.4);
            CGContextFillPath(context);
            
            [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
            number = number+1;
            center = CGPointMake(x+x1, y+y1);
            //  rotate slope equation 30 degrees
            if((i!=2 || j!=2) && (i!=1 || j!=3)){
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
            [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
            number = number+1;
            center = CGPointMake(x+x1, y+y1);
            
            CGContextMoveToPoint(context, center.x, center.y-radius);
            for (NSUInteger k=1; k<sides; k++) {
                float x = radius * sin(k * theta);
                float y = radius * cos(k * theta);
                CGContextAddLineToPoint(context, center.x+x, center.y-y);
            }
            CGContextClosePath(context);
            CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.4);
            CGContextFillPath(context);
            }
            }
            j++;
        }
        
        i++;
    }
    
    
}
-(UIButton *) button: (CGRect) rect {
  //  SEL selector1 = NSSelectorFromString(name);
  //  NSString *number1 = [[NSString alloc] initWithFormat:@"%@", [@(number) stringValue]];
  //  [self performSelector:@selector(district:) withObject:number1];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = number;
    
    [button addTarget:self action:@selector(district:) forControlEvents:UIControlEventTouchUpInside];
  //  [button setTitle:name forState:UIControlStateNormal];
    button.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor clearColor]];
    button.layer.borderWidth = 0.0f;
    button.layer.borderColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:255].CGColor;
    [button.titleLabel setFont:[UIFont fontWithName:@"Abduction" size:14]];
    return button;
}
-(void)district: (id)sender{
 //   NSString *str = [@(number) stringValue];
 //   NSLog(@"ReyT_%@", str);
    UIButton *clicked = (UIButton *) sender;
    NSLog(@"ReyTD_%d",(int)clicked.tag);
}
@end
