//
//  Register.m
//  CityCorp
//
//  Created by Dino Martinez on 12/30/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "Register.h"
#import "Button.h"
#import "Functions.h"

@interface Register ()

@end

@implementation Register

NSUserDefaults *preferences1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Button* hacker = [[Button alloc] init];
    hacker.name = @"hacker";
    [self.view addSubview:[hacker button2: CGRectMake(5, 120, 120, 50.0)]];
    
    Button* corporate = [[Button alloc] init];
    corporate.name = @"corporate";
    [self.view addSubview:[corporate button2: CGRectMake(5, 240, 120, 50.0)]];
    
    Button* researcher = [[Button alloc] init];
    researcher.name = @"researcher";
    [self.view addSubview:[researcher button2: CGRectMake(5, 360, 120, 50.0)]];
    
    Button* constructor = [[Button alloc] init];
    constructor.name = @"constructor";
    [self.view addSubview:[constructor button2: CGRectMake(5, 480, 120, 50.0)]];
    
    UITextView *hacker_info = [[UITextView alloc] init];
    hacker_info.font = [UIFont fontWithName:@"Arial" size:12];
    hacker_info.frame = CGRectMake(130, 90, 195, 120);
    [hacker_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [hacker_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    hacker_info.editable=NO;
    hacker_info.text = @"A hacker's specialty is in creating exploits for use in hacking which can be used or be sold to other players, and have bonuses when using exploits for hacking.";
    [self.view addSubview:hacker_info];
    
    UITextView *corporate_info = [[UITextView alloc] init];
    corporate_info.font = [UIFont fontWithName:@"Arial" size:12];
    corporate_info.frame = CGRectMake(130, 210, 195, 120);
    [corporate_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [corporate_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    corporate_info.editable=NO;
    corporate_info.text = @"Corporate CEOs are the only ones that can hack tech districts as only they can create a corporation. Capturing these districts gives bonuses to their corporation as well as their entire faction. (Note: You can only be in a corporation that you created)";
    [self.view addSubview:corporate_info];
    
    UITextView *researcher_info = [[UITextView alloc] init];
    researcher_info.font = [UIFont fontWithName:@"Arial" size:12];
    researcher_info.frame = CGRectMake(130, 330, 195, 120);
    [researcher_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [researcher_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    researcher_info.editable=NO;
    researcher_info.text = @"Researchers can use tools capable of identifying blueprints that are obtained from hacking industrial districts. They can also increase the quality of blueprints which can make them more valuable.";
    [self.view addSubview:researcher_info];
    
    UITextView *constructor_info = [[UITextView alloc] init];
    constructor_info.font = [UIFont fontWithName:@"Arial" size:12];
    constructor_info.frame = CGRectMake(130, 445, 195, 120);
    [constructor_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    constructor_info.editable=NO;
    [constructor_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    constructor_info.text = @"Constructors are the richest of all the classes. They can use tools to create tech equipment from blueprints that are vital to all citizens. Using high quality blueprints, they can also add modification slots that make what they create more valuable.";
    [self.view addSubview:constructor_info];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// if hasProfession characterChange.php
-(void)hacker{
    Functions *profession = [[Functions alloc] init];
    preferences1 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences1 stringForKey:@"username"];
    [profession httprequest:@"name,profession" :[NSString stringWithFormat:@"%@,%@", username, @"Hacker"] :@"character.php"];
    [preferences1 setInteger:1 forKey:@"hasProfession"];
    [preferences1 setObject:@"hacker" forKey:@"profession"];
    [self performSegueWithIdentifier:@"faction" sender:self];
}
-(void)corporate{
    Functions *profession = [[Functions alloc] init];
    preferences1 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences1 stringForKey:@"username"];
    [profession httprequest:@"name,profession" :[NSString stringWithFormat:@"%@,%@", username, @"Corporate"] :@"character.php"];
    [preferences1 setInteger:1 forKey:@"hasProfession"];
    [preferences1 setObject:@"corporate" forKey:@"profession"];
    [self performSegueWithIdentifier:@"faction" sender:self];
}
-(void)researcher{
    Functions *profession = [[Functions alloc] init];
    preferences1 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences1 stringForKey:@"username"];
    [profession httprequest:@"name,profession" :[NSString stringWithFormat:@"%@,%@", username, @"Researcher"] :@"character.php"];
    [preferences1 setInteger:1 forKey:@"hasProfession"];
    [preferences1 setObject:@"researcher" forKey:@"profession"];
    [self performSegueWithIdentifier:@"faction" sender:self];
}
-(void)constructor{
    Functions *profession = [[Functions alloc] init];
    preferences1 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences1 stringForKey:@"username"];
    [profession httprequest:@"name,profession" :[NSString stringWithFormat:@"%@,%@", username, @"Constructor"] :@"character.php"];
    [preferences1 setInteger:1 forKey:@"hasProfession"];
    [preferences1 setObject:@"constructor" forKey:@"profession"];
    [self performSegueWithIdentifier:@"faction" sender:self];
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
