//
//  Functions.m
//  CityCorp
//
//  Created by Dino Martinez on 12/28/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Functions.h"


@implementation Functions
//@synthesize name;

-(NSString*) httprequest: (NSString*) key : (NSString*) value : (NSString*) phpfile{
    //use array for input output values
    NSString *fetchedData;
       NSString *url = @"http://nezennin.com/citycorp/";
     NSMutableString *parameters = [[NSMutableString alloc] init];
     @try{NSArray *keys = [ key componentsSeparatedByString: @","];
     NSArray *values = [ value componentsSeparatedByString: @","];
         int i = 0;
         [parameters appendString:phpfile];
         [parameters appendString:@"?"];
     for (id tempObject in keys) {
         [parameters appendString:keys[i]];
         [parameters appendString:@"="];
         [parameters appendString:values[i]];
         [parameters appendString:@"&"];
     }
     
    
     NSString *fullURL = [[NSString alloc] initWithFormat:@"%@%@",url,parameters];
     NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString: fullURL]];
     NSURLResponse *response;
     NSError *error;
     NSError __block *err = NULL;
     NSData __block *data;
     BOOL __block reqProcessed = false;
     NSURLResponse __block *resp;
     
     [[[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable _response, NSError * _Nullable _error) {
     resp = _response;
     err = _error;
     data = _data;
     reqProcessed = true;
     }] resume];
     
     while (!reqProcessed) {
     [NSThread sleepForTimeInterval:0];
     }
     
     response = resp;
     error = err;
     fetchedData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
     }@catch(NSException *error){}

    return fetchedData;
}
/*
 int color2 = 0;
 char color3;
 @try{
 if(k==0) color3 = [color1[k] characterAtIndex:2];
 else color3 = [color1[k] characterAtIndex:0];
 color2 = (int)(color3 - '0');
 }@catch(NSException *error){}
 */
@end
