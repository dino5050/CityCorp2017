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
    [self.view addSubview:[hacker button2: CGRectMake(5, 120, 120, 50.0)]];
    
    Button* corporate = [[Button alloc] init];
    hacker.name = @"corporate";
    [self.view addSubview:[hacker button2: CGRectMake(5, 240, 120, 50.0)]];
    
    Button* researcher = [[Button alloc] init];
    hacker.name = @"researcher";
    [self.view addSubview:[hacker button2: CGRectMake(5, 360, 120, 50.0)]];
    
    Button* constructor = [[Button alloc] init];
    hacker.name = @"constructor";
    [self.view addSubview:[hacker button2: CGRectMake(5, 480, 120, 50.0)]];
    
    UITextView *hacker_info = [[UITextView alloc] init];
    hacker_info.font = [UIFont fontWithName:@"Arial" size:12];
    hacker_info.frame = CGRectMake(130, 90, 195, 120);
    [hacker_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [hacker_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    hacker_info.text = @"A hackers specialty is in creating exploits for use in hacking which can be used or be sold to other players, and have bonuses when using exploits for hacking. They can also give their CEO bonuses for hacking tech districts.";
    [self.view addSubview:hacker_info];
    
    UITextView *corporate_info = [[UITextView alloc] init];
    corporate_info.font = [UIFont fontWithName:@"Arial" size:12];
    corporate_info.frame = CGRectMake(130, 210, 195, 120);
    [corporate_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [corporate_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    corporate_info.text = @"Corporate CEOs are the only ones that can hack tech districts as only they can create a corporation. Capturing these districts gives bonuses to their corporation as well as their entire faction.";
    [self.view addSubview:corporate_info];
    
    UITextView *researcher_info = [[UITextView alloc] init];
    researcher_info.font = [UIFont fontWithName:@"Arial" size:12];
    researcher_info.frame = CGRectMake(130, 330, 195, 120);
    [researcher_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [researcher_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    researcher_info.text = @"Researchers can use tools capable of identifying blueprints that are obtained from hacking industrial districts. They can also increase the quality of blueprints which can make them more valuable.";
    [self.view addSubview:researcher_info];
    
    UITextView *constructor_info = [[UITextView alloc] init];
    constructor_info.font = [UIFont fontWithName:@"Arial" size:12];
    constructor_info.frame = CGRectMake(130, 445, 195, 120);
    [constructor_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [constructor_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    constructor_info.text = @"Constructors are the richest of all the classes. They can use tools to create tech equipment from blueprints that are vital to all citizens. Using high quality blueprints, they can also add modification slots that make what they create more valuable.";
    [self.view addSubview:constructor_info];
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
