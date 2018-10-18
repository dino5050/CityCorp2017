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
#import "Functions.h"
#import "Button.h"
#import "MapView.h"

@implementation Reykjavik

@synthesize districtName;
NSString *corporation;
NSString *faction;
NSArray *districts1;
static NSUserDefaults *preferences3;
int number;
static UIView *cancel2;
static UIView *dismiss2;
static NSString *timestamp;
static int secondsLeft;
static NSTimer *timer;

-(void)drawRect:(CGRect)rect {
    int x = 51;
    int y = 51+90;
    int x1 = 16;
    int y1 = 29;
    int i = 0;
  //  while(y>100/3 && y<900/8){
    number = 0;
    Functions *disricts = [[Functions alloc] init];
    @try{faction = [disricts httprequest:@"city" :[NSString stringWithFormat:@"%@",@"Reykjavik"] :@"techfaction.php"];
        districts1 = [faction componentsSeparatedByString: @"|"];
    }@catch(NSException *error){}
    
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
                if([districts1[number] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                else if([districts1[number] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                else if([districts1[number] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}//east globalists
 /*               if((number >= 8 && number <= 13) || (number >= 23 && number <= 28))
                {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                    corporation = @"CityCorp+West";
                    faction = @"capitalists";
                }
                else if((number >= 0 && number <= 7) || (number >= 12 && number <= 16) || number == 17){
                    CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                    corporation = @"CityCorp+North";
                    faction = @"statists";
                }
                else if((number >= 29 && number <= 31) || (number >= 38 && number <= 47)){
                    CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                    corporation = @"CityCorp+South";
                    faction = @"outlaws";
                }
                else {
                    CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                    corporation = @"CityCorp+East";
                    faction = @"globalists";
                } */
            CGContextSetLineWidth(context, 2);
            CGContextStrokePath(context);
            
  /*          NSString *name = [NSString stringWithFormat:@"ReyTD_%d",number];
            Functions *tech = [[Functions alloc] init];
            @try{[tech httprequest:@"name,district,coorx,coory,corporation,faction,city" :[NSString stringWithFormat:@"%@,%d,%f,%f,%@,%@,%@", name,number,center.x,center.y,corporation,faction,@"Reykjavik"] :@"techdistricts.php"];
            }@catch(NSException *error){}
   */
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
                if([districts1[number] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                else if([districts1[number] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                else if([districts1[number] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
  /*              if((number >= 8 && number <= 13) || (number >= 23 && number <= 28)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                    corporation = @"CityCorp+West";
                    faction = @"capitalists";
                }
                else if((number >= 0 && number <= 7) || (number >= 12 && number <= 16) || number == 17) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                    corporation = @"CityCorp+North";
                    faction = @"statists";
                }
                else if((number >= 29 && number <= 31) || (number >= 38 && number <= 47)){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                    corporation = @"CityCorp+South";
                    faction = @"outlaws";
                }
                else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                    corporation = @"CityCorp+East";
                    faction = @"globalists";
                } */
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
                if([districts1[number] isEqualToString:@"statists"]){CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);}//north statists
                else if([districts1[number] isEqualToString:@"capitalists"]){CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);}//west capitalists
                else if([districts1[number] isEqualToString:@"outlaws"]){CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);}//south outlaws
                else {CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);}
                //    CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 0.5);
                //    CGContextFillPath(context);
   /*             if((number >= 8 && number <= 13) || (number >= 23 && number <= 28))
                {   CGContextSetRGBStrokeColor(context, 180/255.0, 150/255.0, 29/255.0, 1.0);
                    corporation = @"CityCorp+West";
                    faction = @"capitalists";
                }
                else if((number >= 0 && number <= 7) || (number >= 12 && number <= 16) || number == 17){
                    CGContextSetRGBStrokeColor(context, 75/255.0, 0.0, 130/255.0, 1.0);
                    corporation = @"CityCorp+North";
                    faction = @"statists";
                }
                else if((number >= 29 && number <= 31) || (number >= 38 && number <= 47)){
                    CGContextSetRGBStrokeColor(context, 255/255.0, 69/255.0, 0/255.0, 1.0);
                    corporation = @"CityCorp+South";
                    faction = @"outlaws";
                }
                else {
                    CGContextSetRGBStrokeColor(context, 0.0, 100/255.0, 0.0, 1.0);
                    corporation = @"CityCorp+East";
                    faction = @"globalists";
                } */
                CGContextSetLineWidth(context, 2);
                CGContextStrokePath(context);
                
   /*             NSString *name = [NSString stringWithFormat:@"ReyTD_%d",number];
                Functions *tech = [[Functions alloc] init];
                @try{[tech httprequest:@"name,district,coorx,coory,corporation,faction,city" :[NSString stringWithFormat:@"%@,%d,%f,%f,%@,%@,%@", name,number,center.x,center.y,corporation,faction,@"Reykjavik"] :@"techdistricts.php"];
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
                
                if([districts1[number] isEqualToString:@"statists"]){CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);}//north statists
                else if([districts1[number] isEqualToString:@"capitalists"]){CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);}//west capitalists
                else if([districts1[number] isEqualToString:@"outlaws"]){CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);}//south outlaws
                else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);}
   /*             if((number >= 8 && number <= 13) || (number >= 23 && number <= 28)){ CGContextSetRGBFillColor(context, 255/255.0, 215/255.0, 0/255.0, 0.4);
                    corporation = @"CityCorp+West";
                    faction = @"capitalists";
                }
                else if((number >= 0 && number <= 7) || (number >= 12 && number <= 16) || number == 17) {CGContextSetRGBFillColor(context, 75/255.0, 0.0, 130/255.0, 0.4);
                    corporation = @"CityCorp+North";
                    faction = @"statists";
                }
                else if((number >= 29 && number <= 31) || (number >= 38 && number <= 47)){ CGContextSetRGBFillColor(context, 255/255.0, 69/255.0, 0/255.0, 0.4);
                    corporation = @"CityCorp+South";
                    faction = @"outlaws";
                }
                else {CGContextSetRGBFillColor(context, 0.0, 100/255.0, 0.0, 0.4);
                    corporation = @"CityCorp+East";
                    faction = @"globalists";
                } */
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
 //   number = 0;
    
    int add = 48+1;
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
                if((number >= 0+add && number <= 2+add) || (number >= 10+add && number <= 11+add) || number==4+add || (number>=6+add && number<=7+add) || number==18+add || number>18+add) CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                else if((number >= 2+add && number <= 4+add) || (number >= 12+add && number <= 13+add) || number==16+add) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
                else CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
                CGContextSetLineWidth(context, 2);
                CGContextStrokePath(context);
       /*         int level;
                if(number==53 || (number>=55 && number<=60) || number==68 || number==69) {level = 10;}
                else if(number==54 || (number>=61 && number<=62) || number==64 || number==65) {level = 20;}
                else {level = 30;}
                
                NSString *name = [NSString stringWithFormat:@"ReyID_%d",number];
                 Functions *tech = [[Functions alloc] init];
                 @try{[tech httprequest:@"name,district,level,coorx,coory,city" :[NSString stringWithFormat:@"%@,%d,%d,%f,%f,%@", name,number,level,center.x,center.y,@"Reykjavik"] :@"industrialdistricts.php"];
                 }@catch(NSException *error){}
                */
                
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
                if((number >= 0+add && number <= 2+add) || (number >= 10+add && number <= 11+add) || number==4+add || (number>=6+add && number<=7+add) || number==18+add || number>18+add) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                else if((number >= 2+add && number <= 4+add) || (number >= 12+add && number <= 13+add) || number==16+add) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
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
                    if((number >= 0+add && number <= 1+add) || (number >= 10+add && number <= 11+add) || (number>=6+add && number<=7+add) || number==17+add)  CGContextSetRGBStrokeColor(context, 165/255.0, 42/255.0, 42/255.0, 1.0);
                    else if((number >= 2+add && number <= 4+add) || number==5+add || (number >= 12+add && number <= 13+add) || number==15+add) CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
                    else CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
                    CGContextSetLineWidth(context, 2);
                    CGContextStrokePath(context);
           /*
                    if(number==53 || (number>=55 && number<=60) || number==68 || number==69) {level = 10;}
                    else if(number==54 || (number>=61 && number<=62) || number==64 || number==65) {level = 20;}
                    else {level = 30;}
                    
                    NSString *name = [NSString stringWithFormat:@"ReyID_%d",number];
                    Functions *tech = [[Functions alloc] init];
                    @try{[tech httprequest:@"name,district,level,coorx,coory,city" :[NSString stringWithFormat:@"%@,%d,%d,%f,%f,%@", name,number,level,center.x,center.y,@"Reykjavik"] :@"industrialdistricts.php"];
                    }@catch(NSException *error){}
                    */
                    
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
                    if((number >= 0+add && number <= 1+add) || (number >= 10+add && number <= 11+add) || (number>=6+add && number<=7+add) || number==17+add) CGContextSetRGBFillColor(context, 165/255.0, 42/255.0, 42/255.0, 0.4);
                    else if((number >= 2+add && number <= 4+add) || number==5+add || (number >= 12+add && number <= 13+add) || number==15+add) CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.4);
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
    if((int)clicked.tag>48){
        NSNumber* level;
        if((int)clicked.tag==53 || ((int)clicked.tag>=55 && (int)clicked.tag<=60) || (int)clicked.tag==68 || (int)clicked.tag==69) {level = [NSNumber numberWithInt:10];}
        else if((int)clicked.tag==54 || ((int)clicked.tag>=61 && (int)clicked.tag<=62) || (int)clicked.tag==64 || (int)clicked.tag==65) {level = [NSNumber numberWithInt:20];}
        else {level = [NSNumber numberWithInt:30];}
        NSString *district = [NSString stringWithFormat:@"ReyID_%d", (int)clicked.tag];
        MapView *view1 = [[MapView alloc] init];
        [view1 hackDistrict:district:@"industrial":level];
    }
    else{
        NSString *district = [NSString stringWithFormat:@"ReyTD_%d", (int)clicked.tag];
        MapView *view1 = [[MapView alloc] init];
        NSNumber *level = [NSNumber numberWithInt:0];
        [view1 hackDistrict:district:@"tech":level];
    }
  //  NSLog(@"ReyTD_%d",(int)clicked.tag);
 
}
@end
