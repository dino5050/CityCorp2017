//
//  Faction.m
//  CityCorp
//
//  Created by Dino Martinez on 2/24/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Faction.h"
#import "Button.h"
#import "Functions.h"

@interface Faction ()

@end

@implementation Faction

NSUserDefaults *preferences4;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Button* statists = [[Button alloc] init];
    statists.name = @"statists";
    [self.view addSubview:[statists button2: CGRectMake(5, 120, 120, 50.0)]];
    
    Button* globalists = [[Button alloc] init];
    globalists.name = @"globalists";
    [self.view addSubview:[globalists button2: CGRectMake(5, 245, 120, 50.0)]];
    
    Button* capitalists = [[Button alloc] init];
    capitalists.name = @"capitalists";
    [self.view addSubview:[capitalists button2: CGRectMake(5, 365, 120, 50.0)]];
    
    Button* outlaws = [[Button alloc] init];
    outlaws.name = @"outlaws";
    [self.view addSubview:[outlaws button2: CGRectMake(5, 485, 120, 50.0)]];
    
    UITextView *statists_info = [[UITextView alloc] init];
    statists_info.font = [UIFont fontWithName:@"Arial" size:12];
    statists_info.frame = CGRectMake(130, 90, 195, 120);
    [statists_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [statists_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    statists_info.text = @"Statists argue for an indepentent socialist state. With nationalist tendencies, they are wary of outsiders, and push for limited immigration. They benefit within CityCorp's market where they enjoy a 15% discount on all CCMarket purchases.";
    [self.view addSubview:statists_info];
    
    UITextView *globalists_info = [[UITextView alloc] init];
    globalists_info.font = [UIFont fontWithName:@"Arial" size:12];
    globalists_info.frame = CGRectMake(130, 215, 195, 125);
    [globalists_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [globalists_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    globalists_info.text = @"Globalists argue for the city's sovereignty to be dissolved into the New World Order. They are for open borders and welcomes all outsiders, including their votes of course. They benefit within CityCorp's market where they enjoy a 15% subsidy when selling to the CCMarket";
    [self.view addSubview:globalists_info];
    
    UITextView *capitalists_info = [[UITextView alloc] init];
    capitalists_info.font = [UIFont fontWithName:@"Arial" size:12];
    capitalists_info.frame = CGRectMake(130, 335, 195, 125);
    [capitalists_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [capitalists_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    capitalists_info.text = @"Capalists argue for anything that will make their wallets fatter. They are multiculturalists one day, and obtain a sense of nationalistic pride the next, whichever is most profitable during business hours. They benefit from extra bonuses given to them when hacking industrial districts, the main wealth injector of the city.";
    [self.view addSubview:capitalists_info];
    
    UITextView *outlaws_info = [[UITextView alloc] init];
    outlaws_info.font = [UIFont fontWithName:@"Arial" size:12];
    outlaws_info.frame = CGRectMake(130, 450, 195, 125);
    [outlaws_info setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [outlaws_info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    outlaws_info.text = @"Outlaws lie, cheat, and steal... and steal and steal and steal. They are looked down upon by all the other factions. They are in it to win it and they win by cheating people out of their hard work. They benefit from extra bonuses given to them when hacking their own fellow citizens.";
    [self.view addSubview:outlaws_info];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)statists{
    Functions *faction = [[Functions alloc] init];
    preferences4 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences4 stringForKey:@"username"];
    [faction httprequest:@"name,faction" :[NSString stringWithFormat:@"%@,%@", username, @"Statists"] :@"faction.php"];
    [preferences4 setInteger:1 forKey:@"hasFaction"];
    [preferences4 setObject:@"statists" forKey:@"faction"];
    [self performSegueWithIdentifier:@"registered" sender:self];
}
-(void)globalists{
    Functions *faction = [[Functions alloc] init];
    preferences4 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences4 stringForKey:@"username"];
    [faction httprequest:@"name,faction" :[NSString stringWithFormat:@"%@,%@", username, @"Globalists"] :@"faction.php"];
    [preferences4 setInteger:1 forKey:@"hasFaction"];
    [preferences4 setObject:@"globalists" forKey:@"faction"];
    [self performSegueWithIdentifier:@"registered" sender:self];
}
-(void)capitalists{
    Functions *faction = [[Functions alloc] init];
    preferences4 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences4 stringForKey:@"username"];
    [faction httprequest:@"name,faction" :[NSString stringWithFormat:@"%@,%@", username, @"Capitalists"] :@"faction.php"];
    [preferences4 setInteger:1 forKey:@"hasFaction"];
    [preferences4 setObject:@"capitalists" forKey:@"faction"];
    [self performSegueWithIdentifier:@"registered" sender:self];
}
-(void)outlaws{
    Functions *faction = [[Functions alloc] init];
    preferences4 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences4 stringForKey:@"username"];
    [faction httprequest:@"name,faction" :[NSString stringWithFormat:@"%@,%@", username, @"Outlaws"] :@"faction.php"];
    [preferences4 setInteger:1 forKey:@"hasFaction"];
    [preferences4 setObject:@"outlaws" forKey:@"faction"];
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
