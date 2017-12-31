//
//  Register.m
//  CityCorp
//
//  Created by Dino Martinez on 12/30/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "Register.h"
#import "Button.h"

@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Button* hacker = [[Button alloc] init];
    hacker.name = @"hacker";
    [self.view addSubview:[hacker button: CGRectMake(10, 120, 100, 50.0)]];
    
    UITextView *hacker_info = [[UITextView alloc] init];
    hacker_info.font = [UIFont fontWithName:@"Arial" size:14];
    hacker_info.frame = CGRectMake(120, 120, 1000, 100);
    [hacker_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [hacker_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    hacker_info.text = @"Hackers can .....";
    [self.view addSubview:hacker_info];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)hacker{
    
    [self performSegueWithIdentifier:@"registered" sender:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
