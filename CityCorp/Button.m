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


@implementation Button

-(void)button:(NSString *)name :(NSInteger *)x :  (NSInteger *)y : (NSInteger *)width : (NSInteger *)height{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(name) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:name forState:UIControlStateNormal];
    button.frame = CGRectMake((int)x, (int)y, (int)width, (int)height);
    [button setTitleColor:[UIColor colorWithRed:0 green:0 blue:255 alpha:255] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    button.layer.borderWidth = 2.0f;
    button.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [button.titleLabel setFont:[UIFont fontWithName:@"Abduction" size:20]];
  //  [self.view addSubview:button];
    //return button;
}
@end
