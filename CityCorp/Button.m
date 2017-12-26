//
//  Button.m
//  CityCorp
//
//  Created by Dino Martinez on 12/21/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Button.h"
#import "Login.h"


@implementation Button

@synthesize name;
UIButton *button;
//-(void)drawRect:(CGRect)rect{
    
  /*  button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(name) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:name forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setTitleColor:[UIColor colorWithRed:0 green:0 blue:255 alpha:255] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    button.layer.borderWidth = 2.0f;
    button.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [button.titleLabel setFont:[UIFont fontWithName:@"Abduction" size:20]]; */
    
//}

-(UIButton *) button: (CGRect) rect{
    SEL selector1 = NSSelectorFromString(name);
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:selector1 forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:name forState:UIControlStateNormal];
    button.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    [button setTitleColor:[UIColor colorWithRed:0 green:0 blue:255 alpha:255] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    button.layer.borderWidth = 2.0f;
    button.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [button.titleLabel setFont:[UIFont fontWithName:@"Abduction" size:20]];
    return button;
}

@end
