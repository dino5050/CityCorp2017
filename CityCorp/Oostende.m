//
//  Oostende.m
//  CityCorp
//
//  Created by Dino Martinez on 8/14/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Oostende.h"
#import "Functions.h"
#import "MapView.h"

@implementation Oostende

NSString *corporation3;
NSString *faction3;
NSArray *districts13;
NSUserDefaults *preferences6;
int number3;

-(void)drawRect:(CGRect)rect {
    int x = 51;
    int y = 51+90;
    int x1 = 16;
    int y1 = 29;
    int i = 0;
    //  while(y>100/3 && y<900/8){
    
    Functions *disricts = [[Functions alloc] init];
    preferences6 = [NSUserDefaults standardUserDefaults];
    @try{faction3 = [disricts httprequest:@"city,server" :[NSString stringWithFormat:@"%@,%ld",@"Oostende",[preferences6 integerForKey:@"server"]] :@"techfaction.php"];
        districts13 = [faction3 componentsSeparatedByString: @"|"];
    }@catch(NSException *error){}
    
    number3 = 0;
    while(i<4){
        y = y + 175/3;
        x = 51/3;
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<8){
            x = x + 100/3;
            if((i!=0 || j!=0) && (i!=0 || j!=7) && (i!=0 || j!=6)){
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
                        if([districts13[number3] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                 else if([districts13[number3] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                 else if([districts13[number3] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                 else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
                 /*               if((number3 >= 10 && number3 <= 15) || (number3 >= 25 && number3 <= 30))
                 {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                     corporation3 = @"CityCorp+West";
                     faction3 = @"capitalists";
                 }
                 else if((number3 >= 0 && number3 <= 9) || number3 == 16 || number3 == 17 || number3 == 18){
                     CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                     corporation3 = @"CityCorp+North";
                     faction3 = @"statists";
                 }
                 else if((number3 >= 39 && number3 <= 51)){
                     CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                     corporation3 = @"CityCorp+South";
                     faction3 = @"outlaws";
                 }
                 else {
                     CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                     corporation3 = @"CityCorp+East";
                     faction3 = @"globalists";
                 } */
      /*          NSString *name = [NSString stringWithFormat:@"OosTD_%d",number3];
                Functions *tech = [[Functions alloc] init];
                @try{[tech httprequest:@"name,district,coorx,coory,corporation,faction,city" :[NSString stringWithFormat:@"%@,%d,%f,%f,%@,%@,%@", name,number3,center.x,center.y,corporation3,faction3,@"Oostende"] :@"techdistricts.php"];
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
                           if([districts13[number3] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                 else if([districts13[number3] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                 else if([districts13[number3] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                 /*              if((number3 >= 10 && number3 <= 15) || (number3 >= 25 && number3 <= 30)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                     corporation3 = @"CityCorp+West";
                     faction3 = @"capitalists";
                 }
                 else if((number3 >= 0 && number3 <= 9) || number3 == 16 || number3 == 17 || number3 == 18) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                     corporation3 = @"CityCorp+North";
                     faction3 = @"statists";
                 }
                 else if((number3 >= 39 && number3 <= 51)){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                     corporation3 = @"CityCorp+South";
                     faction3 = @"outlaws";
                 }
                 else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                     corporation3 = @"CityCorp+East";
                     faction3 = @"globalists";
                 } */
                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number3 = number3+1;
                center = CGPointMake(x+x1, y+y1);
                //  rotate slope equation 30 degrees
                if((i!=2 || j!=2) && (i!=2 || j!=5) && (i!=1 || j!=3) && (i!=3 || j!=5) && (i!=3 || j!=2) && (i!=3 || j!=7)){
                    CGContextMoveToPoint(context, center.x, center.y-radius);
                    for (NSUInteger k=1; k<sides; k++) {
                        float x = radius * sin(k * theta);
                        float y = radius * cos(k * theta);
                        CGContextAddLineToPoint(context, center.x+x, center.y-y);
                    }
                    
                    CGContextClosePath(context);
                    //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
                    //    CGContextFillPath(context);
                            if([districts13[number3] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                     else if([districts13[number3] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                     else if([districts13[number3] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                     else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
                     /*               if((number3 >= 10 && number3 <= 15) || (number3 >= 25 && number3 <= 30))
                     {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                         corporation3 = @"CityCorp+West";
                         faction3 = @"capitalists";
                     }
                     else if((number3 >= 0 && number3 <= 9) || number3 == 16 || number3 == 17 || number3 == 18){
                         CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                         corporation3 = @"CityCorp+North";
                         faction3 = @"statists";
                     }
                     else if((number3 >= 39 && number3 <= 51)){
                         CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                         corporation3 = @"CityCorp+South";
                         faction3 = @"outlaws";
                     }
                     else {
                         CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                         corporation3 = @"CityCorp+East";
                         faction3 = @"globalists";
                     } */
                    CGContextSetLineWidth(context, 2);
                    CGContextStrokePath(context);
                    
                 /*                       NSString *name = [NSString stringWithFormat:@"OosTD_%d",number3];
                     Functions *tech = [[Functions alloc] init];
                     @try{[tech httprequest:@"name,district,coorx,coory,corporation,faction,city" :[NSString stringWithFormat:@"%@,%d,%f,%f,%@,%@,%@", name,number3,center.x,center.y,corporation3,faction3,@"Oostende"] :@"techdistricts.php"];
                     }@catch(NSException *error){}
                 */
                    
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
                               if([districts13[number3] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                     else if([districts13[number3] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                     else if([districts13[number3] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                     else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
                     /*              if((number3 >= 10 && number3 <= 15) || (number3 >= 25 && number3 <= 30)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                         corporation3 = @"CityCorp+West";
                         faction3 = @"capitalists";
                     }
                     else if((number3 >= 0 && number3 <= 9) || number3 == 16 || number3 == 17 || number3 == 18) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                         corporation3 = @"CityCorp+North";
                         faction3 = @"statists";
                     }
                     else if((number3 >= 39 && number3 <= 51)){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                         corporation3 = @"CityCorp+South";
                         faction3 = @"outlaws";
                     }
                     else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                         corporation3 = @"CityCorp+East";
                         faction3 = @"globalists";
                     } */
                    CGContextFillPath(context);
                    
                    number3 = number3+1;
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
    int y = -40+30;
    int x1 = 16;
    int y1 = 29;
    int i = 0;
    //  while(y>100/3 && y<900/8){
//    number3 = 0;
    int add = 51+1;
    while(i<3){
        y = y + 175/3;
        x = 51/3+96-65;
        int j = 0;
        int buttonSize = 100.0/3.5;
        //while(x>130 - y && x<900/5  - y/2 && x<900/10 + y/2 && x > -900/7 + y/2){
        while(j<5){
            x = x + 100/3;
            if((i!=0 || j!=0) && (i!=0 || j!=1) && (i!=0 || j!=4) && (i!=2 || j<4) && (i!=1 || j!=4)){
                
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
                if((number3 >= add + 0 && number3 <= add + 2) || (number3 >= add + 10 && number3 <= add + 11) || number3 == add +4 || (number3 >= add +6 && number3 <= add +7) || number3 == add +18 || number3>add+18) CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                else if((number3 >= add + 2 && number3 <= add + 4) || (number3 >= add + 12 && number3 <= add + 13) || number3 == add +16) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
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
                if((number3 >= add + 0 &&number3 <= add + 2) || (number3 >= add + 10 && number3 <= add + 11) || number3 == add +4 || (number3 >= add +6 && number3 <= add +7) || number3 == add +18 || number3>add+18) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                else if((number3 >= add + 2 && number3 <= add + 4) || (number3 >= add + 12 && number3 <= add + 13) || number3 == add +16) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                CGContextFillPath(context);
                
                [self addSubview:[self button:CGRectMake(center.x-buttonSize/2, center.y-buttonSize/2, buttonSize, buttonSize)]];
                number3 = number3+1;
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
                    if((number3 >= add + 0 && number3 <= add + 1) || (number3 >= add + 10 && number3 <= add + 11) || (number3 >= add +6 && number3 <= add +7) || number3 == add +17)  CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                    else if((number3 >= add + 2 && number3 <= add + 4) || number3 == add +5 || (number3 >= add + 12 && number3 <= add + 13) || number3 == add +15) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
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
                    if((number3 >= add + 0 && number3 <= add + 1) || (number3 >= add + 10 && number3 <= add + 11) || (number3 >= add +6 && number3 <= add +7) || number3 == add +17) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                    else if((number3 >= add + 2 && number3 <= add + 4) || number3 == add +5 || (number3 >= add + 12 && number3 <= add + 13) || number3 == add +15) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
                    else CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.4);
                    CGContextFillPath(context);
                    number3 = number3+1;
                }
                
            }else number3 = number3+2;
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
    button.tag = number3;
    
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
    if((int)clicked.tag>51){
        NSNumber* level;
        if((int)clicked.tag == 56 || ((int)clicked.tag>= 58 && (int)clicked.tag<=59) || ((int)clicked.tag>= 72 && (int)clicked.tag<=75) || (int)clicked.tag== 62 || (int)clicked.tag== 63 || (int)clicked.tag== 69) {level = [NSNumber numberWithInt:10];}
        else if((int)clicked.tag== 57 || ((int)clicked.tag>= 64 && (int)clicked.tag<= 65) || (int)clicked.tag== 67 || (int)clicked.tag== 68) {level = [NSNumber numberWithInt:20];}
        else {level = [NSNumber numberWithInt:30];}
        NSString *district = [NSString stringWithFormat:@"OosID_%d", (int)clicked.tag];
        MapView *view1 = [[MapView alloc] init];
        [view1 hackDistrict:district:@"industrial":level];
    }
    else{
        NSString *district = [NSString stringWithFormat:@"OosTD_%d", (int)clicked.tag];
        MapView *view1 = [[MapView alloc] init];
        NSNumber *level = [NSNumber numberWithInt:0];
        [view1 hackDistrict:district:@"tech":level];
    }
    
}

@end
