//
//  Penzance.m
//  CityCorp
//
//  Created by Dino Martinez on 8/16/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Penzance.h"

@implementation Penzance

NSString *corporation4;
NSString *faction4;
NSArray *districts14;
int number4;

-(void)drawRect:(CGRect)rect {
    int x = 51;
    int y = 51-42;
    int x1 = 16;
    int y1 = 29;
    int i = -1;
    //  while(y>100/3 && y<900/8){
    number4 = 0;
    while(i<5){
        y = y + 175/3;
        x = 51/3-18;
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<8){
            x = x + 100/3;
            if((i!=-1 || j<2) && (i!=0 || j<5) && (i!=0 || j!=7) && (i!=0 || j!=6) && (i!=2 || j<7) && (i!=3 || j<7) && (i!=1 || j<7) && (i!=2 || j!=0)){
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
                /*        if([districts14[number4] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                 else if([districts14[number4] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                 else if([districts14[number4] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                 else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
                 */               if((number4 >= 14 && number4 <= 19) || (number4 >= 27 && number4 <= 31) || (number4 >= 37 && number4 <= 41))
                 {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                     corporation4 = @"CityCorp+West";
                     faction4 = @"capitalists";
                 }
                 else if((number4 >= 0 && number4 <= 13) || number4 == 20){
                     CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                     corporation4 = @"CityCorp+North";
                     faction4 = @"statists";
                 }
                 else if((number4 >= 49 && number4 <= 61) || number4 == 42 || number4 == 43){
                     CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                     corporation4 = @"CityCorp+South";
                     faction4 = @"outlaws";
                 }
                 else {
                     CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                     corporation4 = @"CityCorp+East";
                     faction4 = @"globalists";
                 }
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
                /*           if([districts14[number4] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                 else if([districts14[number4] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                 else if([districts14[number4] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                 */              if((number4 >= 14 && number4 <= 19) || (number4 >= 27 && number4 <= 31) || (number4 >= 37 && number4 <= 41)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                     corporation4 = @"CityCorp+West";
                     faction4 = @"capitalists";
                 }
                 else if((number4 >= 0 && number4 <= 13) || number4 == 20) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                     corporation4 = @"CityCorp+North";
                     faction4 = @"statists";
                 }
                 else if((number4 >= 49 && number4 <= 61) || number4 == 42 || number4 == 43){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                     corporation4 = @"CityCorp+South";
                     faction4 = @"outlaws";
                 }
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                     corporation4 = @"CityCorp+East";
                     faction4 = @"globalists";
                 }
                CGContextFillPath(context);
      //          here
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number4 = number4+1;
                
                center = CGPointMake(x+x1, y+y1);
                //  rotate slope equation 30 degrees
                if((i!=2 || j!=2) && (i!=2 || j!=5) && (i!=1 || j!=3) && (i!=3 || j!=5) && (i!=3 || j!=2) && (i!=3 || j!=7) && (i!=4 || j!=2) && (i!=4 || j!=6) && (i!=4 || j!=7)){
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    
                    CGContextClosePath(context);
                    //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
                    //    CGContextFillPath(context);
                    /*        if([districts14[number4] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                     else if([districts14[number4] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                     else if([districts14[number4] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                     else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
                     */               if((number4 >= 14 && number4 <= 19) || (number4 >= 27 && number4 <= 31) || (number4 >= 37 && number4 <= 41))
                     {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                         corporation4 = @"CityCorp+West";
                         faction4 = @"capitalists";
                     }
                     else if((number4 >= 0 && number4 <= 13) || number4 == 20){
                         CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                         corporation4 = @"CityCorp+North";
                         faction4 = @"statists";
                     }
                     else if((number4 >= 49 && number4 <= 61) || number4 == 42 || number4 == 43){
                         CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                         corporation4 = @"CityCorp+South";
                         faction4 = @"outlaws";
                     }
                     else {
                         CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                         corporation4 = @"CityCorp+East";
                         faction4 = @"globalists";
                     }
                    CGContextSetLineWidth(context, 2);
                    CGContextStrokePath(context);
                    
                    context = UIGraphicsGetCurrentContext();
                    //   CGContextRotateCTM(context, 30*M_PI/180);
          //          and here
                    [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                    
                    center = CGPointMake(x+x1, y+y1);
                    
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    CGContextClosePath(context);
                    /*           if([districts14[number4] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                     else if([districts14[number4] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                     else if([districts14[number4] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                     else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                     */              if((number4 >= 14 && number4 <= 19) || (number4 >= 27 && number4 <= 31) || (number4 >= 37 && number4 <= 41)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                         corporation4 = @"CityCorp+West";
                         faction4 = @"capitalists";
                     }
                     else if((number4 >= 0 && number4 <= 13) || number4 == 20) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                         corporation4 = @"CityCorp+North";
                         faction4 = @"statists";
                     }
                     else if((number4 >= 49 && number4 <= 61) || number4 == 42 || number4 == 43){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                         corporation4 = @"CityCorp+South";
                         faction4 = @"outlaws";
                     }
                     else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                         corporation4 = @"CityCorp+East";
                         faction4 = @"globalists";
                     }
                    CGContextFillPath(context);
                    
                    number4 = number4+1;
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
    int y = -40+0;
    int x1 = 16;
    int y1 = 29;
    int i = 0;
    //  while(y>100/3 && y<900/8){
    number4 = 0;
    while(i<3){
        y = y + 175/3;
        x = 51/3+96+35;
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<5){
            x = x + 100/3;
            if( (i!=0 || j!=4) && (i!=2 || (j<4 && j>2)) && (i!=1 || j!=4)){
                
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
                if((number4 >= 0 && number4 <= 2) || (number4 >= 10 && number4 <= 11) || number4==4 || (number4>=6 && number4<=7) || number4==18 || number4>18) CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                else if((number4 >= 2 && number4 <= 4) || (number4 >= 12 && number4 <= 13) || number4==16) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
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
                if((number4 >= 0 &&number4 <= 2) || (number4 >= 10 && number4 <= 11) || number4==4 || (number4>=6 && number4<=7) || number4==18 || number4>18) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                else if((number4 >= 2 && number4 <= 4) || (number4 >= 12 && number4 <= 13) || number4==16) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number4 = number4+1;
                center = CGPointMake(x+x1, y+y1);
                //  rotate slope equation 30 degrees
                if(i!=2 && (i!=1 || j<4)){
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    
                    CGContextClosePath(context);
                    //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
                    //    CGContextFillPath(context);
                    if((number4 >= 0 && number4 <= 1) || (number4 >= 10 && number4 <= 11) || (number4>=6 && number4<=7) || number4==17)  CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                    else if((number4 >= 2 && number4 <= 4) || number4==5 || (number4 >= 12 && number4 <= 13) || number4==15) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
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
                    if((number4 >= 0 && number4 <= 1) || (number4 >= 10 && number4 <= 11) || (number4>=6 && number4<=7) || number4==17) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                    else if((number4 >= 2 && number4 <= 4) || number4==5 || (number4 >= 12 && number4 <= 13) || number4==15) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                    else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                    CGContextFillPath(context);
                    number4 = number4+1;
                }
                
            }else number4 = number4+2;
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
    button.tag = number4;
    
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
