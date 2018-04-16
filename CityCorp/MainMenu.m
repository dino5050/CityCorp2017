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
static NSUserDefaults *preferences3;
NSArray *array2;


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
    
    panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50)];
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
    
    info = [[UITextView alloc] init];
    info.font = [UIFont fontWithName:@"Arial" size:14];
    info.frame = CGRectMake(5, 5, 200, 150);
    [info setTextColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    //info.text = @"";
    
    username3 = [preferences3 stringForKey:@"username"];
    get_char_info = [[Functions alloc] init];
    @try{char_info = [get_char_info httprequest:@"name" :username3 :@"get_char_info.php"];
    values = [ char_info componentsSeparatedByString: @","];
    info.text = [[NSString alloc] initWithFormat: @"Name: %@\nLevel: %@\nProfession: %@\nStock Value: %@\nCorporation: %@\nDate Joined: %@\nSkill Points: %@\nFaction: %@", values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7]];
    
    [panel addSubview:info];
    
    message = [[UITextView alloc] init];
    message.font = [UIFont fontWithName:@"Arial" size:16];
    message.frame = CGRectMake(5, 5+150, 200, 100);
    message.text = @"Message of the day";
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
-(void)join_corp{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    Button *back = [[Button alloc] init];
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    array2 = @[ @"Monday", @"Tuesday", @"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday"];
    [self configureTableview];
/*    UITableView *corps = [[UITableView alloc] init];
    
    corps.frame = CGRectMake(panel.frame.size.width/2-100, 50, 200, 500);
    corps.layer.borderWidth = 2.0;
    
    corps.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    corps.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:0 green:0 blue:0 alpha:255]);
    [corps beginUpdates];
   // NSArray *corpArray = [[NSArray alloc] init];
    [self cofigureTableview];
    NSArray *corpArray = @[@"1",@"2",@"3",@"4"];
    NSArray *arr = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:corpArray.count-1 inSection:0]];
    [corps insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
    
 //   [corps reloadData];
    [corps endUpdates];
    
    [panel addSubview:corps];
    */
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
    help.frame = CGRectMake(panel.frame.size.width/2- 130, 50, 260, 60);
    [help setText:@"Write us a question, error, or bug, and we'll get to you as soon as possible:"];
    help.textAlignment=NSTextAlignmentCenter;
    help.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
    help.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
    [panel addSubview:help];
    UITextField *message = [[UITextField alloc] init];
    message.backgroundColor=[UIColor colorWithRed:255 green:255 blue:255 alpha:255];
 //   message.font = [UIFont fontWithName:@"Arial" size:16];
    message.frame = CGRectMake(panel.frame.size.width/2 - 140, 100, 280, 120);
    Button *send = [[Button alloc] init];
    send.name = @"send";
    [panel addSubview:[send button2: CGRectMake(panel.frame.size.width/2-30, 100+125, 60, 50.0)]];

    [panel addSubview:message];
    
}
-(void)send{}
-(void)back{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    Button *changeProfession = [[Button alloc] init];
    changeProfession.name = @"change_profession";
    [panel addSubview:[changeProfession button2: CGRectMake(5, panel.frame.size.height-50-5, 180, 50.0)]];
    
    Button *help = [[Button alloc] init];
    help.name = @"help";
    [panel addSubview:[help button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    //    make join corp/create corp/go to corp button
    
    //    try to make prefences variable global
    
    
    
    
    username3 = [preferences3 stringForKey:@"username"];
    @try{char_info = [get_char_info httprequest:@"name" :username3 :@"get_char_info.php"];
    values = [ char_info componentsSeparatedByString: @","];
    info.text = [[NSString alloc] initWithFormat: @"Name: %@\nLevel: %@\nProfession: %@\nStock Value: %@\nCorporation: %@\nDate Joined: %@\nSkill Points: %@", values[0], values[1], values[2], values[3], values[4], values[5], values[6]];
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
    UITableView *corps = [[UITableView alloc] init];
    corps.frame = CGRectMake(panel.frame.size.width/2-100, 50, 200, 500);
    corps.layer.borderWidth = 2.0;
    
    corps.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    corps.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:0 green:0 blue:0 alpha:255]);
    corps.delegate = self;
    corps.dataSource = self;
    [panel addSubview:corps];
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
    cell.textLabel.text =  [array2 objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"jhkjgkjhkjhkj";
    
  /*  NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
    cell.imageView.image = theImage; */
    
    return cell;
}
/* - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSDictionary *item = (NSDictionary *)[array2 objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"mainTitleKey"];
    cell.detailTextLabel.text = [item objectForKey:@"secondaryTitleKey"];
    NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
    cell.imageView.image = theImage;
    return cell;
} */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 }
*/

@end
