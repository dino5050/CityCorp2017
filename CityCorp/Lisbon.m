//
//  Lisbon.m
//  CityCorp
//
//  Created by Dino Martinez on 8/18/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Lisbon.h"
#import "Functions.h"

@implementation Lisbon

NSString *corporation5;
NSString *faction5;
NSArray *districts15;
int number5;

-(void)drawRect:(CGRect)rect {
    int x = 51;
    int y = 51+0;
    int x1 = 16;
    int y1 = 29;
    int i = 0;
    //  while(y>100/3 && y<900/8){
    Functions *disricts = [[Functions alloc] init];
    @try{faction5 = [disricts httprequest:@"city" :[NSString stringWithFormat:@"%@",@"Lisbon"] :@"techfaction.php"];
        districts15 = [faction5 componentsSeparatedByString: @"|"];
    }@catch(NSException *error){}
    number5 = 0;
    while(i<5){
        y = y + 175/3;
        x = 51/3-17;
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<8){
            x = x + 100/3;
            if((i!=0 || j!=0) && (i!=0 || j!=7) && (i!=0 || j!=5) && (i!=3 || j!=6) && (i!=0 || j!=6) && (i!=4 || j!=0)){
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
                        if([districts15[number5] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                 else if([districts15[number5] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                 else if([districts15[number5] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                 else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
                 /*               if((number5 >= 8 && number5 <= 11) || (number5 >= 23 && number5 <= 30) || (number5 >= 38 && number5 <= 40))
                 {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                     corporation5 = @"CityCorp+West";
                     faction5 = @"capitalists";
                 }
                 else if((number5 >= 0 && number5 <= 7) || (number5 >= 12 && number5 <= 18)){
                     CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                     corporation5 = @"CityCorp+North";
                     faction5 = @"statists";
                 }
                 else if((number5 >= 41 && number5 <= 45) || (number5 >= 49 && number5 <= 59)){
                     CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                     corporation5 = @"CityCorp+South";
                     faction5 = @"outlaws";
                 }
                 else {
                     CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                     corporation5 = @"CityCorp+East";
                     faction5 = @"globalists";
                 } */
                /*            NSString *name = [NSString stringWithFormat:@"LisTD_%d",number5];
                 Functions *tech = [[Functions alloc] init];
                 @try{[tech httprequest:@"name,district,coorx,coory,corporation,faction,city" :[NSString stringWithFormat:@"%@,%d,%f,%f,%@,%@,%@", name,number5,center.x,center.y,corporation5,faction5,@"Lisbon"] :@"techdistricts.php"];
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
                           if([districts15[number5] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                 else if([districts15[number5] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                 else if([districts15[number5] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                 /*              if((number5 >= 8 && number5 <= 11) || (number5 >= 23 && number5 <= 30) || (number5 >= 38 && number5 <= 40)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                     corporation5 = @"CityCorp+West";
                     faction5 = @"capitalists";
                 }
                 else if((number5 >= 0 && number5 <= 7) || (number5 >= 12 && number5 <= 18)) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                     corporation5 = @"CityCorp+North";
                     faction5 = @"statists";
                 }
                 else if((number5 >= 41 && number5 <= 45) || (number5 >= 49 && number5 <= 59)){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                     corporation5 = @"CityCorp+South";
                     faction5 = @"outlaws";
                 }
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                     corporation5 = @"CityCorp+East";
                     faction5 = @"globalists";
                 } */
                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number5 = number5+1;
                center = CGPointMake(x+x1, y+y1);
                //  rotate slope equation 30 degrees
                if((i!=2 || j!=4) && (i!=1 || j!=3) && (i!=3 || j!=5) && (i!=3 || j!=1) && (i!=3 || j!=7) && (i!=4 || j!=7)){
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    
                    CGContextClosePath(context);
                    //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
                    //    CGContextFillPath(context);
                            if([districts15[number5] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                     else if([districts15[number5] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                     else if([districts15[number5] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                     else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
                     /*               if((number5 >= 8 && number5 <= 11) || (number5 >= 23 && number5 <= 30) || (number5 >= 38 && number5 <= 40))
                     {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                         corporation5 = @"CityCorp+West";
                         faction5 = @"capitalists";
                     }
                     else if((number5 >= 0 && number5 <= 7) || (number5 >= 12 && number5 <= 18)){
                         CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                         corporation5 = @"CityCorp+North";
                         faction5 = @"statists";
                     }
                     else if((number5 >= 41 && number5 <= 45) || (number5 >= 49 && number5 <= 59)){
                         CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                         corporation5 = @"CityCorp+South";
                         faction5 = @"outlaws";
                     }
                     else {
                         CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                         corporation5 = @"CityCorp+East";
                         faction5 = @"globalists";
                     } */
        /*            NSString *name = [NSString stringWithFormat:@"LisTD_%d",number5];
                    Functions *tech = [[Functions alloc] init];
                    @try{[tech httprequest:@"name,district,coorx,coory,corporation,faction,city" :[NSString stringWithFormat:@"%@,%d,%f,%f,%@,%@,%@", name,number5,center.x,center.y,corporation5,faction5,@"Lisbon"] :@"techdistricts.php"];
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
                               if([districts15[number5] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                     else if([districts15[number5] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                     else if([districts15[number5] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                     else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                     /*              if((number5 >= 8 && number5 <= 11) || (number5 >= 23 && number5 <= 30) || (number5 >= 38 && number5 <= 40)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                         corporation5 = @"CityCorp+West";
                         faction5 = @"capitalists";
                     }
                     else if((number5 >= 0 && number5 <= 7) || (number5 >= 12 && number5 <= 18)) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                         corporation5 = @"CityCorp+North";
                         faction5 = @"statists";
                     }
                     else if((number5 >= 41 && number5 <= 45) || (number5 >= 49 && number5 <= 59)){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                         corporation5 = @"CityCorp+South";
                         faction5 = @"outlaws";
                     }
                     else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                         corporation5 = @"CityCorp+East";
                         faction5 = @"globalists";
                     } */
                    number5 = number5+1;
                    CGContextFillPath(context);
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
    number5 = 0;
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
                if((number5 >= 0 && number5 <= 2) || (number5 >= 10 && number5 <= 11) || number5==4 || (number5>=6 && number5<=7) || number5==18 || number5>18) CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                else if((number5 >= 2 && number5 <= 4) || (number5 >= 12 && number5 <= 13) || number5==16) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
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
                if((number5 >= 0 &&number5 <= 2) || (number5 >= 10 && number5 <= 11) || number5==4 || (number5>=6 && number5<=7) || number5==18 || number5>18) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                else if((number5 >= 2 && number5 <= 4) || (number5 >= 12 && number5 <= 13) || number5==16) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number5 = number5+1;
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
                    if((number5 >= 0 && number5 <= 1) || (number5 >= 10 && number5 <= 11) || (number5>=6 && number5<=7) || number5==17)  CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                    else if((number5 >= 2 && number5 <= 4) || number5==5 || (number5 >= 12 && number5 <= 13) || number5==15) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
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
                    if((number5 >= 0 && number5 <= 1) || (number5 >= 10 && number5 <= 11) || (number5>=6 && number5<=7) || number5==17) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                    else if((number5 >= 2 && number5 <= 4) || number5==5 || (number5 >= 12 && number5 <= 13) || number5==15) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                    else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                    CGContextFillPath(context);
                    number5 = number5+1;
                }
                
            }else number5 = number5+2;
            j++;
            
        }
        
        i++;
    }
}
-(UIButton *) button: (CGRect) rect {
    //  SEL selector1 = NSSelectorFromString(name);
    //  NSString *number51 = [[NSString alloc] initWithFormat:@"%@", [@(number5) stringValue]];
    //  [self performSelector:@selector(district:) withObject:number51];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = number5;
    
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
    //   NSString *str = [@(number5) stringValue];
    //   NSLog(@"ReyT_%@", str);
    UIButton *clicked = (UIButton *) sender;
    NSLog(@"ReyTD_%d",(int)clicked.tag);
}

@end
