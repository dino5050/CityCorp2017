//
//  Hexagon.m
//  CityCorp
//
//  Created by Dino Martinez on 12/12/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reykjavik.h"

@implementation Reykjavik


int number;

-(void)drawRect:(CGRect)rect {
    int x = 51;
    int y = 51+90;
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
        while(j<8){
            x = x + 100/3;
            if((i!=0 || j!=0) && (i!=0 || j!=7) && (i!=0 || j!=5) && (i!=3 || j!=6) && (i!=0 || j!=6)){
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
            if((number >= 8 && number <= 13) || (number >= 23 && number <= 28)) CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
            else if((number >= 0 && number <= 7) || (number >= 12 && number <= 16) || number == 17) CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
            else if((number >= 29 && number <= 31) || (number >= 38 && number <= 46)) CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
            else CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
            CGContextSetLineWidth(context, 2);
            CGContextStrokePath(context);
                
                if((number >= 0 && number <= 7) || (number >= 12 && number <= 16)){}//north statists
                else if((number >= 8 && number <= 13) || (number >= 23 && number <= 27)){}//west capitalists
                else if((number >= 28 && number <= 31) || (number >= 38 && number <= 45)){}//south outlaws
                else {}//east globalists
                
                context = UIGraphicsGetCurrentContext();
                //   CGContextRotateCTM(context, 30*M_PI/180);
                center = CGPointMake(x, y);
    
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
                if((number >= 8 && number <= 13) || (number >= 23 && number <= 28)) CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                else if((number >= 0 && number <= 7) || (number >= 12 && number <= 16) || number == 17) CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                else if((number >= 29 && number <= 31) || (number >= 38 && number <= 46)) CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                else CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
            CGContextFillPath(context);
            
            [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
            number = number+1;
            center = CGPointMake(x+x1, y+y1);
            //  rotate slope equation 30 degrees
            if((i!=2 || j!=2) && (i!=1 || j!=3) && (i!=3 || j!=5) && (i!=3 || j!=2) && (i!=3 || j!=7)){
                CGContextMoveToPoint(context, center.x, center.y-radius);
                for (NSUInteger k=1; k<sides; k++) {
                    float x = radius * sin(k * theta);
                    float y = radius * cos(k * theta);
                    CGContextAddLineToPoint(context, center.x+x, center.y-y);
                }
                
                CGContextClosePath(context);
                //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
                //    CGContextFillPath(context);
                if((number >= 8 && number <= 13) || (number >= 23 && number <= 28)) CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                else if((number >= 0 && number <= 7) || (number >= 12 && number <= 16) || number == 17) CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                else if((number >= 29 && number <= 31) || (number >= 38 && number <= 46)) CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                else CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                CGContextSetLineWidth(context, 2);
                CGContextStrokePath(context);
                
                context = UIGraphicsGetCurrentContext();
                //   CGContextRotateCTM(context, 30*M_PI/180);
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                
                center = CGPointMake(x+x1, y+y1);
                
                CGContextMoveToPoint(context, center.x, center.y-radius);
                for (NSUInteger k=1; k<sides; k++) {
                    float x = radius * sin(k * theta);
                    float y = radius * cos(k * theta);
                    CGContextAddLineToPoint(context, center.x+x, center.y-y);
                }
                CGContextClosePath(context);
                if((number >= 8 && number <= 13) || (number >= 23 && number <= 28)) CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                else if((number >= 0 && number <= 7) || (number >= 12 && number <= 16) || number == 17) CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                else if((number >= 29 && number <= 31) || (number >= 38 && number <= 46)) CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                else CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                CGContextFillPath(context);
                
                number = number+1;
            }
            }
                j++;
            }
        
        i++;
    }
    [self industrial];
    
}
-(void)industrial{
    int x = 51;
    int y = -40;
    int x1 = 16;
    int y1 = 29;
    int i = 0;
    //  while(y>100/3 && y<900/8){
    number = 0;
    while(i<3){
        y = y + 175/3;
        x = 51/3+96;
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<5){
            x = x + 100/3;
            if((i!=0 || j!=0) && (i!=0 || j!=1) && (i!=0 || j!=4) && (i!=2 || j<2) && (i!=1 || j!=4)){
                
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
                if((number >= 0 && number <= 2) || (number >= 10 && number <= 11) || number==4 || (number>=6 && number<=7) || number==18 || number>18) CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                else if((number >= 2 && number <= 4) || (number >= 12 && number <= 13) || number==16) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
                else CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
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
                if((number >= 0 &&number <= 2) || (number >= 10 && number <= 11) || number==4 || (number>=6 && number<=7) || number==18 || number>18) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                else if((number >= 2 && number <= 4) || (number >= 12 && number <= 13) || number==16) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number = number+1;
                center = CGPointMake(x+x1, y+y1);
                //  rotate slope equation 30 degrees
                if(i!=2 && (i!=1 || j<3)){
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    
                    CGContextClosePath(context);
                    //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
                    //    CGContextFillPath(context);
                    if((number >= 0 && number <= 1) || (number >= 10 && number <= 11) || (number>=6 && number<=7) || number==17)  CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                    else if((number >= 2 && number <= 4) || number==5 || (number >= 12 && number <= 13) || number==15) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
                    else CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
                    CGContextSetLineWidth(context, 2);
                    CGContextStrokePath(context);
                    
                    context = UIGraphicsGetCurrentContext();
                    //   CGContextRotateCTM(context, 30*M_PI/180);
                    [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
         //           number = number+1;
                    center = CGPointMake(x+x1, y+y1);
                    
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    CGContextClosePath(context);
                    if((number >= 0 && number <= 1) || (number >= 10 && number <= 11) || (number>=6 && number<=7) || number==17) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                    else if((number >= 2 && number <= 4) || number==5 || (number >= 12 && number <= 13) || number==15) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                    else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                    CGContextFillPath(context);
                    number = number+1;
                }
                
            }else number = number+2;
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
