//
//  Button.h
//  CityCorp
//
//  Created by Dino Martinez on 12/21/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

@interface Button : NSObject

@property(nonatomic, readwrite) NSString *name;
//+(UIButton *)button: (NSString *)name : (NSInteger *)x :  (NSInteger *)y : (NSInteger *)width : (NSInteger *)height;
-(UIButton *)button: (CGRect)rect;
-(UIButton *)button2: (CGRect)rect;
-(UIButton *)back: (CGRect)rect;
-(UIButton *)space: (CGRect)rect;
-(void)clicked:(UIButton *) button;

@end
