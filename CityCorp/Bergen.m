//
//  Bergen.m
//  CityCorp
//
//  Created by Dino Martinez on 5/21/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Bergen.h"

@implementation Bergen

NSString *corporation2;
NSString *faction2;
NSArray *districts12;
int number2;

-(void)drawRect:(CGRect)rect {
    int x = 51;
    int y = 51+90-70;
    int x1 = 16;
    int y1 = 29;
    int i = 0;
    number2 = 0;
    while(i<5){
        y = y + 175/3;
        x = 51/3-17;
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<8){
            x = x + 100/3;
            if((i!=0 || j<3) && (i!=1 || j<3) && (i!=2 || j<6) && (i!=4 || j!=0)){
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
        /*        if([districts12[number2] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                else if([districts12[number2] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                else if([districts12[number2] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
                */               if((number2 >= 12 && number2 <= 16) || (number2 >= 23 && number2 <= 30))
                 {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                 corporation2 = @"CityCorp+West";
                 faction2 = @"capitalists";
                 }
                 else if((number2 >= 0 && number2 <= 11)){
                 CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                 corporation2 = @"CityCorp+North";
                 faction2 = @"statists";
                 }
                 else if((number2 >= 39 && number2 <= 50) || (number2 == 30) || number2 == 32){
                 CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                 corporation2 = @"CityCorp+South";
                 faction2 = @"outlaws";
                 }
                 else {
                 CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                 corporation2 = @"CityCorp+East";
                 faction2 = @"globalists";
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
     /*           if([districts12[number2] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                else if([districts12[number2] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                else if([districts12[number2] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                */              if((number2 >= 12 && number2 <= 16) || (number2 >= 23 && number2 <= 30)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                 corporation2 = @"CityCorp+West";
                 faction2 = @"capitalists";
                 }
                 else if((number2 >= 0 && number2 <= 11) || (number2 >= 12 && number2 <= 16) || number2 == 17) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                 corporation2 = @"CityCorp+North";
                 faction2 = @"statists";
                 }
                 else if((number2 >= 39 && number2 <= 50) || (number2 == 30) || number2 == 32){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                 corporation2 = @"CityCorp+South";
                 faction2 = @"outlaws";
                 }
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                 corporation2 = @"CityCorp+East";
                 faction2 = @"globalists";
                 }
                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number2 = number2+1;
                center = CGPointMake(x+x1, y+y1);
                //  rotate slope equation 30 degrees
                if((i!=2 || j!=2) && (i!=1 || j!=3) && (i!=4 || j!=2) && (i!=4 || j!=7) && (i!=3 || j!=9)){
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    
                    CGContextClosePath(context);
                    //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
                    //    CGContextFillPath(context);
      /*              if([districts12[number2] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                    else if([districts12[number2] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                    else if([districts12[number2] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                    else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
       */               if((number2 >= 12 && number2 <= 16) || (number2 >= 23 && number2 <= 30))
       {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
           corporation2 = @"CityCorp+West";
           faction2 = @"capitalists";
       }
       else if((number2 >= 0 && number2 <= 11)){
           CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
           corporation2 = @"CityCorp+North";
           faction2 = @"statists";
       }
       else if((number2 >= 39 && number2 <= 50) || (number2 == 30) || number2 == 32){
           CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
           corporation2 = @"CityCorp+South";
           faction2 = @"outlaws";
       }
       else {
           CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
           corporation2 = @"CityCorp+East";
           faction2 = @"globalists";
       }
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
    /*                if([districts12[number2] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                    else if([districts12[number2] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                    else if([districts12[number2] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                    else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                 */              if((number2 >= 12 && number2 <= 16) || (number2 >= 23 && number2 <= 30)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                     corporation2 = @"CityCorp+West";
                     faction2 = @"capitalists";
                 }
                 else if((number2 >= 0 && number2 <= 11) || (number2 >= 12 && number2 <= 16) || number2 == 17) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                     corporation2 = @"CityCorp+North";
                     faction2 = @"statists";
                 }
                 else if((number2 >= 39 && number2 <= 50) || (number2 == 30) || number2 == 32){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                     corporation2 = @"CityCorp+South";
                     faction2 = @"outlaws";
                 }
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                     corporation2 = @"CityCorp+East";
                     faction2 = @"globalists";
                 }
                    CGContextFillPath(context);
                    
                    number2 = number2+1;
                }
            }
            j++;
        }
        
        i++;
    }
    [self industrial];
    
}
-(void)industrial{
    int x = 51;   //don't change this
    int y = -40;  //change this
    int x1 = 16;
    int y1 = 29;
    int i = 0;
    number2 = 0;
    while(i<3){
        y = y + 175/3;
        x = 51/3+134;    //change this
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<5){
            x = x + 100/3;
            if((i!=0 || j!=4) && (i!=2 || j>1) && (i!=1 || j<4) && (i!=2 || j!=4)){
                
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
                if((number2 >= 0 && number2 <= 2) || (number2 >= 10 && number2 <= 11) || number2==4 || (number2>=6 && number2<=7) || number2==18 || number2>18) CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                else if((number2 >= 2 && number2 <= 4) || (number2 >= 12 && number2 <= 13) || number2==16) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
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
                if((number2 >= 0 &&number2 <= 2) || (number2 >= 10 && number2 <= 11) || number2==4 || (number2>=6 && number2<=7) || number2==18 || number2>18) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                else if((number2 >= 2 && number2 <= 4) || (number2 >= 12 && number2 <= 13) || number2==16) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number2 = number2+1;
                center = CGPointMake(x+x1, y+y1);
                //  rotate slope equation 30 degrees
                if(i!=2){
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    
                    CGContextClosePath(context);
                    //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
                    //    CGContextFillPath(context);
                    if((number2 >= 0 && number2 <= 1) || (number2 >= 10 && number2 <= 11) || (number2>=6 && number2<=7) || number2==17)  CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                    else if((number2 >= 2 && number2 <= 4) || number2==5 || (number2 >= 12 && number2 <= 13) || number2==15) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
                    else CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
                    CGContextSetLineWidth(context, 2);
                    CGContextStrokePath(context);
                    
                    context = UIGraphicsGetCurrentContext();
                    //   CGContextRotateCTM(context, 30*M_PI/180);
                    [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                    //           number2 = number2+1;
                    center = CGPointMake(x+x1, y+y1);
                    
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    CGContextClosePath(context);
                    if((number2 >= 0 && number2 <= 1) || (number2 >= 10 && number2 <= 11) || (number2>=6 && number2<=7) || number2==17) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                    else if((number2 >= 2 && number2 <= 4) || number2==5 || (number2 >= 12 && number2 <= 13) || number2==15) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                    else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                    CGContextFillPath(context);
                    number2 = number2+1;
                }
                
            }else number2 = number2+2;
            j++;
            
        }
        
        i++;
    }
}
-(UIButton *) button: (CGRect) rect {
    //  SEL selector1 = NSSelectorFromString(name);
    //  NSString *number21 = [[NSString alloc] initWithFormat:@"%@", [@(number2) stringValue]];
    //  [self performSelector:@selector(district:) withObject:number21];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = number2;
    
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
    //   NSString *str = [@(number2) stringValue];
    //   NSLog(@"ReyT_%@", str);
    UIButton *clicked = (UIButton *) sender;
    NSLog(@"ReyTD_%d",(int)clicked.tag);
}


@end
