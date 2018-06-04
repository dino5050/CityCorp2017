//
//  MainMenu.m
//  CityCorp
//
//  Created by Dino Martinez on 12/13/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "MainMenu.h"
#import "Button.h"
#import "Functions.h"
@import GoogleMobileAds;

//#import <QuartzCore/QuartzCore.h>

@interface MainMenu () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) GADBannerView *bannerView;
@end


@implementation MainMenu

static UIView *panel;
static Button* changeProfession;
static Button* help;
static UITextView *info;
static NSString *username3;
static Functions *get_char_info;
static NSString *char_info;
static NSArray *values;
static UITextView *message;
static Button* corp;
static Button* back;
static Button* back2;
static NSUserDefaults *preferences3;
static UITextView *message2;
static NSArray *array2;
static NSArray *array3;
static NSArray *tech;
static NSString *whichTable;


-(IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    Button* terminal = [[Button alloc] init];
    terminal.name = @"terminal";
    [self.view addSubview:[terminal button2: CGRectMake(10, 40, 85, 50.0)]];
    
    Button* map = [[Button alloc] init];
    map.name = @"map";
    [self.view addSubview:[map button2: CGRectMake(10+87, 40, 65, 50.0)]];
    
    Button* market = [[Button alloc] init];
    market.name = @"market";
    [self.view addSubview:[market button2: CGRectMake(10+87+67, 40, 68, 50.0)]];
    
    Button* social = [[Button alloc] init];
    social.name = @"social";
    [self.view addSubview:[social button2: CGRectMake(10+87+67+70, 40, 68, 50.0)]];
    
    Button* space = [[Button alloc] init];
    space.name = @"";
    [self.view addSubview:[space button2: CGRectMake(10+87+67+70+70, 40, screenSize.width-(10+87+67+70+70+10), 50.0)]];
    if(screenSize.height >= 812) panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50-50)];
    else panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50)];
    [panel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    panel.layer.borderWidth = 2.0f;
    panel.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [self.view addSubview:panel];
    
    
    
  //  printf("%s", [[preferences3 stringForKey:@"hasProfession"] UTF8String]);
    self.bannerView = [[GADBannerView alloc]
                       initWithAdSize:kGADAdSizeBanner];
    
    [self addBannerViewToView:_bannerView];
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}
-(void)viewDidAppear:(BOOL)animated{
    //load data from default values (username)
    Button *changeProfession = [[Button alloc] init];
    changeProfession.name = @"change_profession";
    [panel addSubview:[changeProfession button2: CGRectMake(5, panel.frame.size.height-50-5, 180, 50.0)]];
    
    Button *help = [[Button alloc] init];
    help.name = @"help";
    [panel addSubview:[help button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    
    Button *computer = [[Button alloc] init];
    computer.name = @"computer";
    [panel addSubview:[computer button2: CGRectMake(panel.frame.size.width-115-5, 5, 115, 50.0)]];
    
    Button *inventory = [[Button alloc] init];
    inventory.name = @"inventory";
    [panel addSubview:[inventory button2: CGRectMake(panel.frame.size.width-115-5, 5 + 55, 115, 50.0)]];
    
    
    
    info = [[UITextView alloc] init];
    info.editable = NO;
    info.font = [UIFont fontWithName:@"Arial" size:14];
    info.frame = CGRectMake(5, 5, 170, 150);
    [info setTextColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    //info.text = @"";
    
    username3 = [preferences3 stringForKey:@"username"];
    get_char_info = [[Functions alloc] init];
    @try{char_info = [get_char_info httprequest:@"name" :username3 :@"get_char_info.php"];
    values = [ char_info componentsSeparatedByString: @","];
        info.text = [[NSString alloc] initWithFormat: @"Name: %@\nLevel: %@\nProfession: %@\nStock Value: %@\nCorporation: %@\nDate Joined: %@\nSkill Points: %@\nFaction: %@\nCredits: ₡%@", values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8]];
    
    [panel addSubview:info];
    
    message = [[UITextView alloc] init];
    message.font = [UIFont fontWithName:@"Arial" size:16];
    message.frame = CGRectMake(5, 5+155, 200, 100);
    message.text = @"Message of the day";
        message.editable = NO;
    [message setTextColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [message setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    [panel addSubview:message];
    
    if([values[2] isEqualToString:@"Corporate"]) [preferences3 setObject:@"corporate" forKey:@"profession"];
    else if([values[2] isEqualToString:@"Researcher"]) [preferences3 setObject:@"researcher" forKey:@"profession"];
    else if ([values[2] isEqualToString:@"Hacker"]) [preferences3 setObject:@"hacker" forKey:@"profession"];
    else if ([values[2] isEqualToString:@"Constructor"]) [preferences3 setObject:@"constructor" forKey:@"profession"];
    }@catch(NSException *error){info.text = @"No Internet Connection"; [panel addSubview:info];}
  //  if([info.text isEqualToString:@""]) info.text = @"No Internet Connection";
    Button *corp = [[Button alloc] init];
    if([[preferences3 stringForKey:@"profession"] isEqualToString:@"corporate"] && [preferences3 integerForKey:@"hasCorp"] == 1) corp.name = @"goto_corp";
    else if([[preferences3 stringForKey:@"profession"] isEqualToString:@"corporate"]) corp.name = @"create_corp";
    else if([preferences3 integerForKey:@"hasCorp"] == 1) corp.name = @"goto_corp";
    else corp.name = @"join_corp";
    [panel addSubview:[corp button: CGRectMake(5, panel.frame.size.height-50-5-65, 180, 50.0)]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)create_corp{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    Button *back = [[Button alloc] init];
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
}
-(void)computer{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    Button *back = [[Button alloc] init];
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    array2 = @[@"CC-1000", @"CCPU-100", @"Mod Slot"];
    array3 = @[@"Generic motherboard", @"Generic CPU", @"Empty slot"];
    
    whichTable = @"computer";
    tech = [NSArray arrayWithObjects:[UIImage imageNamed:@"computer_bluegreen"],[UIImage imageNamed:@"cpu_bluegreen"],[UIImage imageNamed:@"slot.png"], nil];
    [self configureTableview];
}
-(void)inventory{
    
        [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        Button *back = [[Button alloc] init];
        back.name = @"back";
        [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
        array2 = @[@"CC-1000", @"CCPU-100", @"Mod Slot"];
        array3 = @[@"Generic motherboard", @"Generic CPU", @"Empty slot"];
        
        whichTable = @"inventory";
        tech = [NSArray arrayWithObjects:[UIImage imageNamed:@"computer_bluegreen"],[UIImage imageNamed:@"cpu_bluegreen"],[UIImage imageNamed:@"slot.png"], nil];
        [self configureTableview];

}
-(void)join_corp{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    Button *back = [[Button alloc] init];
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    array2 = @[ @"Nezennin Corp.", @"Nez Enterprises"];
    whichTable = @"join_corp";
    [self configureTableview];

}
-(void)map{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self performSegueWithIdentifier:@"map" sender:self];
 //   [self dismissViewControllerAnimated:true completion:nil];
}
-(void)terminal{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self performSegueWithIdentifier:@"terminal" sender:self];
    //   [self dismissViewControllerAnimated:true completion:nil];
}
-(void)social{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self performSegueWithIdentifier:@"social" sender:self];
    //   [self dismissViewControllerAnimated:true completion:nil];
}
-(void)market{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self performSegueWithIdentifier:@"market" sender:self];
    //   [self dismissViewControllerAnimated:true completion:nil];
}
-(void)help{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    Button *back = [[Button alloc] init];
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    UITextView *help = [[UITextView alloc] init];
    help.frame = CGRectMake(panel.frame.size.width/2- 130, 5, 260, 60);
    [help setText:@"Write us a question, error, or bug, and we'll get to you as soon as possible:"];
    help.textAlignment=NSTextAlignmentCenter;
    help.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
    help.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
    
    [panel addSubview:help];
    message2 = [[UITextView alloc] init];
    message2.backgroundColor=[UIColor colorWithRed:255 green:255 blue:255 alpha:255];
 //   message.font = [UIFont fontWithName:@"Arial" size:16];
    message2.frame = CGRectMake(panel.frame.size.width/2 - 140, 55, 280, 120);
    message2.editable = YES;
    Button *send = [[Button alloc] init];
    send.name = @"send";
    [panel addSubview:[send button2: CGRectMake(panel.frame.size.width/2-30, 100+125 -45, 60, 50.0)]];

    [panel addSubview:message2];
    
}
-(void)send{
    NSLog(@"%@", message.text);
    [self.view endEditing:YES];
    message2.text=@"";
    //go back to main screen after sent
}
-(void)back{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    Button *changeProfession = [[Button alloc] init];
    changeProfession.name = @"change_profession";
    [panel addSubview:[changeProfession button2: CGRectMake(5, panel.frame.size.height-50-5, 180, 50.0)]];
    
    Button *help = [[Button alloc] init];
    help.name = @"help";
    [panel addSubview:[help button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    Button *computer = [[Button alloc] init];
    computer.name = @"computer";
    [panel addSubview:[computer button2: CGRectMake(panel.frame.size.width-115-5, 5, 115, 50.0)]];
    
    Button *inventory = [[Button alloc] init];
    inventory.name = @"inventory";
    [panel addSubview:[inventory button2: CGRectMake(panel.frame.size.width-115-5, 5 + 55, 115, 50.0)]];
    
    //    make join corp/create corp/go to corp button
    
    //    try to make prefences variable global
    
    
    
    
    username3 = [preferences3 stringForKey:@"username"];
    @try{char_info = [get_char_info httprequest:@"name" :username3 :@"get_char_info.php"];
    values = [ char_info componentsSeparatedByString: @","];
    info.text = [[NSString alloc] initWithFormat: @"Name: %@\nLevel: %@\nProfession: %@\nStock Value: %@\nCorporation: %@\nDate Joined: %@\nSkill Points: %@\nFaction: %@\nCredits: ▵%@", values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8]];
 //   [info setTextColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
  //  [info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    [panel addSubview:info];
    
    
    message.text = @"Message of the day";
//    [message setTextColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
//    [message setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    [panel addSubview:message];
    
    if([values[2] isEqualToString:@"Corporate"]) [preferences3 setObject:@"corporate" forKey:@"profession"];
    else if([values[2] isEqualToString:@"Researcher"]) [preferences3 setObject:@"researcher" forKey:@"profession"];
    else if ([values[2] isEqualToString:@"Hacker"]) [preferences3 setObject:@"hacker" forKey:@"profession"];
    else if ([values[2] isEqualToString:@"Constructor"]) [preferences3 setObject:@"constructor" forKey:@"profession"];
    }@catch(NSException *error){info.text = @"No Internet Connection"; [panel addSubview:info];}
    Button *corp = [[Button alloc] init];
    if([[preferences3 stringForKey:@"profession"] isEqualToString:@"corporate"] && [preferences3 integerForKey:@"hasCorp"] == 1) corp.name = @"goto_corp";
    else if([[preferences3 stringForKey:@"profession"] isEqualToString:@"corporate"]) corp.name = @"create_corp";
    else if([preferences3 integerForKey:@"hasCorp"] == 1) corp.name = @"goto_corp";
    else corp.name = @"join_corp";
    [panel addSubview:[corp button: CGRectMake(5, panel.frame.size.height-50-5-65, 180, 50.0)]];
}

- (void)addBannerViewToView:(UIView *)bannerView {
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.bottomLayoutGuide
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0]
                                ]];
}
-(void)configureTableview
{
 //   UITableView *corps = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    if([whichTable isEqualToString:@"join_corp"]){ UITableView *corps = [[UITableView alloc] init];
        corps.frame = CGRectMake(0, 50, panel.frame.size.width-10, array2.count*60);
        corps.layer.borderWidth = 2.0;
        corps.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor clearColor]);
        corps.layer.backgroundColor = [UIColor blackColor].CGColor;
        corps.delegate = self;
        corps.dataSource = self;
        [panel addSubview:corps];
    }
    else if([whichTable isEqualToString:@"computer"]){ UITableView *computer = [[UITableView alloc] init];
        computer.frame = CGRectMake(0, 50, panel.frame.size.width-10, array2.count*60);
        computer.layer.borderWidth = 0.0;
        computer.separatorColor = [UIColor clearColor];
        computer.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
        computer.layer.backgroundColor = [UIColor blackColor].CGColor;
        computer.delegate = self;
        computer.dataSource = self;
        [panel addSubview:computer];
    }
    else if([whichTable isEqualToString:@"inventory"]){
        UITableView *inventory = [[UITableView alloc] init];
        inventory.frame = CGRectMake(5, 50, 235, 5*60);
        //     market.setMasksToBounds:YES];
        //     [layer setCornerRadius: 4.0];
        inventory.layer.borderWidth = 2.0f;
        inventory.layer.borderColor = [UIColor blueColor].CGColor;
        inventory.layer.backgroundColor = [UIColor blackColor].CGColor;
        inventory.delegate = self;
        inventory.dataSource = self;
        [panel addSubview:inventory];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array2.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"title of cell %@", [array2 objectAtIndex:indexPath.row]);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
        
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    if([whichTable isEqualToString:@"join_corp"]){
        UIImage *gotoCorp = [UIImage imageNamed:@"goto.png"];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.imageView.image = gotoCorp;
        cell.detailTextLabel.text = @"1 member";
    }
    else if([whichTable isEqualToString:@"computer"]){
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        UIImage *assets = [tech objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [array3 objectAtIndex:indexPath.row];
        cell.imageView.image = assets;
    }
    else if([whichTable isEqualToString:@"inventory"]){
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        UIImage *assets = [tech objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [array3 objectAtIndex:indexPath.row];
        cell.imageView.image = assets;
    }
    cell.textLabel.text =  [array2 objectAtIndex:indexPath.row];
    
  /*  NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
    cell.imageView.image = theImage; */
    
    
    
    return cell;
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
