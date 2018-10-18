//
//  Torindor.m
//  CityCorp
//
//  Created by Dino Martinez on 8/18/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Torindor.h"
#import "Functions.h"
#import "MapView.h"

@implementation Torindor

NSString *corporation6;
NSString *faction6;
NSArray *districts16;
int number6;

-(void)drawRect:(CGRect)rect {
    int x = 51;
    int y = 51+90-136;
    int x1 = 16;
    int y1 = 29;
    int i = -1;
    Functions *disricts = [[Functions alloc] init];
    @try{faction6 = [disricts httprequest:@"city" :[NSString stringWithFormat:@"%@",@"Torindor"] :@"techfaction.php"];
        districts16 = [faction6 componentsSeparatedByString: @"|"];
    }@catch(NSException *error){}
    number6 = 0;
    while(i<5){
        y = y + 175/3;
        x = 51/3-17;
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<8){
            x = x + 100/3;
            if((i!=-1 || j<1) && (i!=0 || j<3) && (i!=1 || (j<5 || j>5)) && (i!=2 || (j<6 || j>6)) && (i!=4 || j!=0) && (i!=3 || j!=3)){
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
                        if([districts16[number6] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                 else if([districts16[number6] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                 else if([districts16[number6] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                 else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
                 /*               if((number6 >= 21 && number6 <= 28) || (number6 >= 34 && number6 <= 40))
                 {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                     corporation6 = @"CityCorp+West";
                     faction6 = @"capitalists";
                 }
                 else if((number6 >= 0 && number6 <= 14)){
                     CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                     corporation6 = @"CityCorp+North";
                     faction6 = @"statists";
                 }
                 else if((number6 >= 48 && number6 <= 59) || (number6 >= 41 && number6 <= 43)){
                     CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                     corporation6 = @"CityCorp+South";
                     faction6 = @"outlaws";
                 }
                 else {
                     CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                     corporation6 = @"CityCorp+East";
                     faction6 = @"globalists";
                 } */
            /*                NSString *name = [NSString stringWithFormat:@"TorTD_%d",number6];
                 Functions *tech = [[Functions alloc] init];
                 @try{[tech httprequest:@"name,district,coorx,coory,corporation,faction,city" :[NSString stringWithFormat:@"%@,%d,%f,%f,%@,%@,%@", name,number6,center.x,center.y,corporation6,faction6,@"Torindor"] :@"techdistricts.php"];
                 }@catch(NSException *error){}
                 */
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
                           if([districts16[number6] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                 else if([districts16[number6] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                 else if([districts16[number6] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                 /*              if((number6 >= 21 && number6 <= 28) || (number6 >= 34 && number6 <= 40)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                     corporation6 = @"CityCorp+West";
                     faction6 = @"capitalists";
                 }
                 else if((number6 >= 0 && number6 <= 14)) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                     corporation6 = @"CityCorp+North";
                     faction6 = @"statists";
                 }
                 else if((number6 >= 48 && number6 <= 59) || (number6 >= 41 && number6 <= 43)){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                     corporation6 = @"CityCorp+South";
                     faction6 = @"outlaws";
                 }
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                     corporation6 = @"CityCorp+East";
                     faction6 = @"globalists";
                 } */

                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number6 = number6+1;
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
                            if([districts16[number6] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                     else if([districts16[number6] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                     else if([districts16[number6] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                     else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
                     /*               if((number6 >= 21 && number6 <= 28) || (number6 >= 34 && number6 <= 40))
                     {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                         corporation6 = @"CityCorp+West";
                         faction6 = @"capitalists";
                     }
                     else if((number6 >= 0 && number6 <= 14)){
                         CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                         corporation6 = @"CityCorp+North";
                         faction6 = @"statists";
                     }
                     else if((number6 >= 48 && number6 <= 59) || (number6 >= 41 && number6 <= 43)){
                         CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                         corporation6 = @"CityCorp+South";
                         faction6 = @"outlaws";
                     }
                     else {
                         CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                         corporation6 = @"CityCorp+East";
                         faction6 = @"globalists";
                     } */
                    
           /*         NSString *name = [NSString stringWithFormat:@"TorTD_%d",number6];
                    Functions *tech = [[Functions alloc] init];
                    @try{[tech httprequest:@"name,district,coorx,coory,corporation,faction,city" :[NSString stringWithFormat:@"%@,%d,%f,%f,%@,%@,%@", name,number6,center.x,center.y,corporation6,faction6,@"Torindor"] :@"techdistricts.php"];
                    }@catch(NSException *error){}
                    */
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
                               if([districts16[number6] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                     else if([districts16[number6] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                     else if([districts16[number6] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                     else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                     /*              if((number6 >= 21 && number6 <= 28) || (number6 >= 34 && number6 <= 40)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                         corporation6 = @"CityCorp+West";
                         faction6 = @"capitalists";
                     }
                     else if((number6 >= 0 && number6 <= 14)) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                         corporation6 = @"CityCorp+North";
                         faction6 = @"statists";
                     }
                     else if((number6 >= 48 && number6 <= 59) || (number6 >= 41 && number6 <= 43)){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                         corporation6 = @"CityCorp+South";
                         faction6 = @"outlaws";
                     }
                     else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                         corporation6 = @"CityCorp+East";
                         faction6 = @"globalists";
                     } */

                    CGContextFillPath(context);
                    
                    number6 = number6+1;
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
 //   number6 = 0;
    int add = 59+1;
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
                if((number6 >= add + 0 && number6 <= add + 2) || (number6 >= add + 10 && number6 <= add + 11) || number6 == add +4 || (number6 >= add +6 && number6 <= add +7) || number6 == add +18 || number6>add+18) CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                else if((number6 >= add + 2 && number6 <= add + 4) || (number6 >= add + 12 && number6 <= add + 13) || number6 == add +16) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
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
                if((number6 >= add + 0 &&number6 <= add + 2) || (number6 >= add + 10 && number6 <= add + 11) || number6 == add +4 || (number6 >= add +6 && number6 <= add +7) || number6 == add +18 || number6>add+18) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                else if((number6 >= add + 2 && number6 <= add + 4) || (number6 >= add + 12 && number6 <= add + 13) || number6 == add +16) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number6 = number6+1;
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
                    if((number6 >= add + 0 && number6 <= add + 1) || (number6 >= add + 10 && number6 <= add + 11) || (number6 >= add +6 && number6 <= add +7) || number6 == add +17)  CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                    else if((number6 >= add + 2 && number6 <= add + 4) || number6 == add +5 || (number6 >= add + 12 && number6 <= add + 13) || number6 == add +15) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
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
                    if((number6 >= add + 0 && number6 <= add + 1) || (number6 >= add + 10 && number6 <= add + 11) || (number6 >= add +6 && number6 <= add +7) || number6 == add +17) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                    else if((number6 >= add + 2 && number6 <= add + 4) || number6 == add +5 || (number6 >= add + 12 && number6 <= add + 13) || number6 == add +15) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                    else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                    CGContextFillPath(context);
                    number6 = number6+1;
                }
                
            }else number6 = number6+2;
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
    button.tag = number6;
    
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
    if((int)clicked.tag>59){
        NSNumber* level;
        if((int)clicked.tag == 64 || ((int)clicked.tag>= 60 && (int)clicked.tag<=62) || ((int)clicked.tag>= 66 && (int)clicked.tag<=67) || (int)clicked.tag== 70 || (int)clicked.tag== 71 || (int)clicked.tag== 77 || (int)clicked.tag== 84 || (int)clicked.tag== 85) {level = [NSNumber numberWithInt:10];}
        else if((int)clicked.tag== 63 || (int)clicked.tag== 65 || ((int)clicked.tag>= 72 && (int)clicked.tag<= 73) || (int)clicked.tag== 75 || (int)clicked.tag== 76) {level = [NSNumber numberWithInt:20];}
        else {level = [NSNumber numberWithInt:30];}
        NSString *district = [NSString stringWithFormat:@"TorID_%d", (int)clicked.tag];
        MapView *view1 = [[MapView alloc] init];
        [view1 hackDistrict:district:@"industrial":level];
    }
    else{
        NSString *district = [NSString stringWithFormat:@"TorTD_%d", (int)clicked.tag];
        MapView *view1 = [[MapView alloc] init];
        NSNumber *level = [NSNumber numberWithInt:0];
        [view1 hackDistrict:district:@"tech":level];
    }
}

@end
