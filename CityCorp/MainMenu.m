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
static NSString *version1;
static Button* corp;
static Button* back;
static Button* back2;
static NSUserDefaults *preferences3;
static UITextView *message2;
static UITextView *message3;
static NSArray *array2;
static NSArray *array3;
static NSArray *tech;
static NSString *whichTable;
static NSString *action;
static NSString *mod_id;
static NSString * welcome;
//static UITableView *inventory;
static Functions *inventory1;
static UITableView *mainmenu;
static NSArray *items;
//static NSArray *items3;
static NSString *warning;
static NSString *get_items;
static int counts;
static int slots;
static NSString *type;
static UITextView * corp_name;
static UITextView * corp_ticker;
static UITextView *name_warning;
static UITextView *ticker_warning;
//static UIAlertController * alert2;
//static UIAlertAction* dismiss;
static int iD;


-(IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    Button* terminal = [[Button alloc] init];
    terminal.name = @"Terminal";
    [self.view addSubview:[terminal button2: CGRectMake(10, 40, 85, 50.0)]];
    
    Button* map = [[Button alloc] init];
    map.name = @"Map";
    [self.view addSubview:[map button2: CGRectMake(10+87, 40, 65, 50.0)]];
    
    Button* market = [[Button alloc] init];
    market.name = @"Market";
    [self.view addSubview:[market button2: CGRectMake(10+87+67, 40, 68, 50.0)]];
    
    Button* social = [[Button alloc] init];
    social.name = @"Social";
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
    
    self.bannerView.adUnitID = @"ca-app-pub-3188229665332758/3829260800";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}
-(void)viewDidAppear:(BOOL)animated{
    //load data from default values (username)
    Button *changeProfession = [[Button alloc] init];
    changeProfession.name = @"Change Profession";
 //   [panel addSubview:[changeProfession button2: CGRectMake(5, panel.frame.size.height-50-5, 180, 50.0)]];
    
    Button *scoreboard = [[Button alloc] init];
    scoreboard.name = @"Scoreboard";
    [panel addSubview:[scoreboard button: CGRectMake(5, panel.frame.size.height-50-5, 180, 50.0)]];
    
    Button *help = [[Button alloc] init];
    help.name = @"Help";
 //   [panel addSubview:[help button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    Button *tutorial = [[Button alloc] init];
    tutorial.name = @"Tutorial";
    [panel addSubview:[tutorial button2: CGRectMake(panel.frame.size.width-85-5, panel.frame.size.height-50-5-50-5, 85, 50.0)]];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
 //   [preferences3 setInteger:0 forKey:@"hasCorp"];
    Button *computer = [[Button alloc] init];
    computer.name = @"Computer";
    [panel addSubview:[computer button2: CGRectMake(panel.frame.size.width-115-5, 5, 115, 50.0)]];
    
    Button *inventory = [[Button alloc] init];
    inventory.name = @"Inventory";
    [panel addSubview:[inventory button2: CGRectMake(panel.frame.size.width-115-5, 5 + 55, 115, 50.0)]];
    
    info = [[UITextView alloc] init];
    info.editable = NO;
    info.font = [UIFont fontWithName:@"Arial" size:13];
    info.frame = CGRectMake(2, 5, 175, 170);
    [info setTextColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
//    info.layer.borderWidth = 2.0f;
//    info.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    //info.text = @"";
    
    username3 = [preferences3 stringForKey:@"username"];
    get_char_info = [[Functions alloc] init];
    @try{char_info = [get_char_info httprequest:@"name" :username3 :@"get_char_info.php"];
    values = [ char_info componentsSeparatedByString: @","];
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
    [fmt setMaximumFractionDigits:0]; // to avoid any decimal
    NSInteger value = [values[8] intValue];
    NSString *result = [fmt stringFromNumber:@(value)];
    int nextLevel = ([values[1] intValue]+1)*10*([values[1] intValue]+1)*10;
        NSString *color;
    if([[values[7] lowercaseString] isEqualToString:@"statists"]) color = @"(Purple)";
    else if([[values[7] lowercaseString] isEqualToString:@"globalists"]) color = @"(Green)";
    else if([[values[7] lowercaseString] isEqualToString:@"capitalists"]) color = @"(Gold)";
    else if([[values[7] lowercaseString] isEqualToString:@"outlaws"]) color = @"(Orange)";
    info.text = [[NSString alloc] initWithFormat: @"Name: %@\nLevel: %@\nProfession: %@\nCorporation: %@\nDate Joined: %@\nSkill Points: %@/%d\nFaction: %@ %@\nCredits: ₡%@", values[0], values[1], values[2], values[4], values[5], values[6], nextLevel, values[7], color, result];
    [preferences3 setObject:values[1] forKey:@"level"];
//    NSLog(@"%ld |||||||||||||||", [preferences3 integerForKey:@"server"]);
    [preferences3 setInteger:[values[9] intValue] forKey:@"server"];
    if(![values[4] isEqualToString:@"None"]){
        [preferences3 setInteger:1 forKey:@"hasCorp"];
    }else [preferences3 setInteger:0 forKey:@"hasCorp"];

    [panel addSubview:info];
    [preferences3 setObject:values[7] forKey:@"faction"];
    
    message = [[UITextView alloc] init];
    message.font = [UIFont fontWithName:@"Arial" size:13+5];
    message.frame = CGRectMake(5, 5+155+10, 255, 30);
    message.text = @"Message From The City";
        message.editable = NO;
    [message setTextColor:[UIColor orangeColor]];
    [message setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    [panel addSubview:message];
    
    message2 = [[UITextView alloc] init];
    message2.font = [UIFont fontWithName:@"Arial" size:13];
    message2.frame = CGRectMake(5, 5+155+25+15, 290, 110);
    Functions *getmessage = [[Functions alloc] init];
    @try{welcome = [getmessage httprequest:@"" :[NSString stringWithFormat:@""] :@"welcome.php"];}@catch(NSException *error){}
    message2.text = welcome;
    message2.editable = NO;
    [message2 setTextColor:[UIColor whiteColor]];
    [message2 setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
//    message2.layer.borderWidth = 2.0f;
//    message2.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [panel addSubview:message2];
    
    
    if([values[2] isEqualToString:@"Corporate"]) [preferences3 setObject:@"corporate" forKey:@"profession"];
    else if([values[2] isEqualToString:@"Researcher"]) [preferences3 setObject:@"researcher" forKey:@"profession"];
    else if ([values[2] isEqualToString:@"Hacker"]) [preferences3 setObject:@"hacker" forKey:@"profession"];
    else if ([values[2] isEqualToString:@"Constructor"]) [preferences3 setObject:@"constructor" forKey:@"profession"];
    }@catch(NSException *error){info.text = @"No Internet Connection"; [panel addSubview:info];}
  //  if([info.text isEqualToString:@""]) info.text = @"No Internet Connection";
    Button *corp = [[Button alloc] init];
    if([[preferences3 stringForKey:@"profession"] isEqualToString:@"corporate"] && [preferences3 integerForKey:@"hasCorp"] == 1) corp.name = @"Goto Corp";
    else if([[preferences3 stringForKey:@"profession"] isEqualToString:@"corporate"]) corp.name = @"Create Corp";
    else if([preferences3 integerForKey:@"hasCorp"] == 1) corp.name = @"Goto Corp";
    else corp.name = @"Join Corp";
    [panel addSubview:[corp button: CGRectMake(5, panel.frame.size.height-50-5-55, 180, 50.0)]];
  
    Functions *getversion = [[Functions alloc] init];
    @try{version1 = [getversion httprequest:@"" :[NSString stringWithFormat:@""] :@"version.php"];}@catch(NSException *error){}
    
    NSString *version2 = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    //printf("%s", [version1 UTF8String]);
    //printf("Hello");
    double version_1 = [version1 doubleValue];
    double version_2 = [version2 doubleValue];
    //printf("%d", version_2);
    NSLog(@"%@ %@|||||||||||||||", version1, version2);
    if(version_1>version_2){
        
   //     [super viewDidAppear:animated];
        UIAlertController * alert2=   [UIAlertController
                                      alertControllerWithTitle:@""
                                      message:@""
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Update"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 NSString *updateLink = [NSString stringWithFormat:@"https://itunes.apple.com/app/citycorp/id1441879942"];
                                 UIApplication *application = [UIApplication sharedApplication];
                                 [application openURL:[NSURL URLWithString:updateLink] options:@{} completionHandler:^(BOOL success){
                                     if(success){
                                         [self exit_app];
                                     }
                                 }];
                                 [alert2 dismissViewControllerAnimated:YES completion:nil];
                            //     [self exit_app];
                                 
                             }];
        UIAlertAction* exit = [UIAlertAction
                                 actionWithTitle:@"Exit"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert2 dismissViewControllerAnimated:YES completion:nil];
                                     [self exit_app];
                                     
                                 }];
        
        UIColor *color = [UIColor whiteColor]; // select needed color
        NSString *string = @"Update Now?";
        NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
        [alert2 setValue:attrStr forKey:@"attributedMessage"];
        
        color = [UIColor orangeColor];
        NSString *string1 = @"Update Required";
        NSDictionary *attrs1 = @{ NSForegroundColorAttributeName : color, NSFontAttributeName : [UIFont fontWithName:@"Arial" size:16+5]};
        NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString:string1 attributes:attrs1];
        [alert2 setValue:attrStr1 forKey:@"attributedTitle"];
        
        [alert2 addAction:ok];
        [alert2 addAction:exit];
        
        [self presentViewController:alert2 animated:YES completion:nil];
        
        UIVisualEffect *blurEffect;
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert2 class]]] setEffect:blurEffect];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)exit_app{
    exit(0);
}
-(void)create_corp{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    whichTable = @"create_corp";
    UITextView *title = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 315, 25+5)];
    title.text = @"Create Your Corporation";
    title.backgroundColor = [UIColor blackColor];
    title.font = [UIFont fontWithName:@"Arial" size:13+5];
    title.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    title.editable = NO;
    [panel addSubview:title];
    name_warning = [[UITextView alloc] initWithFrame:CGRectMake(120, 59, 200, 20)];
    name_warning.backgroundColor = [UIColor blackColor];
    name_warning.textColor = [UIColor redColor];
    name_warning.font = [UIFont fontWithName:@"Arial-BoldMT" size:10];
//    name_warning.text = @"name already taken";
    [panel addSubview:name_warning];
    name_warning.text = @"Use only letters, numbers, spaces";
    ticker_warning = [[UITextView alloc] initWithFrame:CGRectMake(120+75, 110, 65, 50)];
    ticker_warning.backgroundColor = [UIColor blackColor];
    ticker_warning.textColor = [UIColor redColor];
    ticker_warning.font = [UIFont fontWithName:@"Arial-BoldMT" size:10];
//    ticker_warning.text = @"ticker already taken";
    [panel addSubview:ticker_warning];
    corp_name = [[UITextView alloc] initWithFrame:CGRectMake(120,80,170,30)];
    corp_name.backgroundColor = [UIColor grayColor];
    corp_name.layer.borderColor = [UIColor orangeColor].CGColor;
    corp_name.layer.borderWidth = 2.0f;
    corp_name.textColor = [UIColor whiteColor];
    [panel addSubview:corp_name];
    UITextView *name = [[UITextView alloc] initWithFrame:CGRectMake(1, 80, 55, 25)];
    name.text = @"Name";
    name.backgroundColor = [UIColor blackColor];
    name.font = [UIFont fontWithName:@"Arial" size:11+5];
    name.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    name.editable = NO;
    [panel addSubview:name];
    UITextView *ticker = [[UITextView alloc] initWithFrame:CGRectMake(1, 120, 120, 25)];
    ticker.text = @"Ticker";
    ticker.backgroundColor = [UIColor blackColor];
    ticker.font = [UIFont fontWithName:@"Arial" size:10+5];
    ticker.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    ticker.editable = NO;
    [panel addSubview:ticker];
    corp_ticker = [[UITextView alloc] initWithFrame:CGRectMake(120,120,70,30)];
    corp_ticker.backgroundColor = [UIColor grayColor];
    corp_ticker.layer.borderColor = [UIColor orangeColor].CGColor;
    corp_ticker.layer.borderWidth = 2.0f;
    corp_ticker.textColor = [UIColor whiteColor];
    [panel addSubview:corp_ticker];
    Button *create_corp = [[Button alloc] init];
    create_corp.name = @"Create Corp ";
    [panel addSubview:[create_corp button: CGRectMake(panel.frame.size.width/2-190/2, 160, 170, 50.0)]];
    Button *back = [[Button alloc] init];
    back.name = @"Back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, 160, 60, 50.0)]];

 //   preferences3 = [NSUserDefaults standardUserDefaults];
 //   [preferences3 setInteger:1 forKey:@"hasCorp"];
}
-(void)create_corp_{
    if(corp_name.text.length>16) name_warning.text=@"Too many characters";
    else if(corp_name.text.length<3) name_warning.text=@"Too few characters";
    else if(corp_ticker.text.length>4) ticker_warning.text=@"Too many characters";
    else if(corp_ticker.text.length<1) ticker_warning.text=@"Too few characters";
    else{
        name_warning.text = @"Use only letters, numbers, spaces";
        ticker_warning.text = @"";
        NSString *corp_name2 = [corp_name.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        username3 = [preferences3 stringForKey:@"username"];
        Functions *corporation = [[Functions alloc] init];
        @try{NSString *check = [corporation httprequest:@"name,menu,corp,ticker" :[NSString stringWithFormat:@"%@,%@,%@,%@",username3, whichTable, corp_name2,corp_ticker.text] :@"corporation.php"];
        NSArray *check_corp = [check componentsSeparatedByString: @"|"];
        if([check_corp[0] isEqualToString:@"illegalTicker"]) ticker_warning.text=@"illegal characters";
        else if([check_corp[0] isEqualToString:@"illegalCorp"]) name_warning.text=@"illegal characters";
        else if([check_corp[0] isEqualToString:@"sameCorp"]) name_warning.text=@"name already taken";
        else if([check_corp[0] isEqualToString:@"sameTicker"]) ticker_warning.text=@"ticker already taken";
        else if([check_corp[0] isEqualToString:@"accepted"]){
            [preferences3 setInteger:1 forKey:@"hasCorp"];
            [preferences3 setObject:corp_name.text forKey:@"corporation"];
            [self goto_corp];
        }
            
        }@catch(NSException *error){}
    }
}
-(void)computer{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *equipment = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    equipment.text = @"Computer Setup";
    equipment.backgroundColor = [UIColor blackColor];
    equipment.font = [UIFont fontWithName:@"Arial" size:14+5];
    equipment.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    equipment.editable = NO;
    [panel addSubview:equipment];
    Button *back = [[Button alloc] init];
    back.name = @"Back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
 //   array2 = @[@"CC-1000", @"CCPU-100", @"Mod Slot"];
  //  array3 = @[@"Generic motherboard", @"Generic CPU", @"Empty slot"];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    whichTable = @"equipment";
    @try{get_items = [inventory1 httprequest:@"name,menu" :[NSString stringWithFormat:@"%@,%@",username3, whichTable] :@"mainmenu.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count]==3) slots = [array2[2] intValue];
        if([array2 count]==4) slots = [array2[3] intValue];
        if([array2 count]==5) slots = [array2[4] intValue];
        if([array2 count]==6) slots = [array2[5] intValue];
    }@catch(NSException *error){}
 //   tech = [NSArray arrayWithObjects:[UIImage imageNamed:@"computer_bluegreen"],[UIImage imageNamed:@"cpu_bluegreen"],[UIImage imageNamed:@"slot.png"], nil];
    Button *modify1 = [[Button alloc] init];
    modify1.name = @"Modify 1";
    [panel addSubview:[modify1 button2: CGRectMake(210, 50, 80, 50)]];
    
    Button *modify2 = [[Button alloc] init];
    modify2.name = @"Modify 2";
    [panel addSubview:[modify2 button2: CGRectMake(210, 50+60, 80, 50)]];
    if(slots>0){
        Button *modify3 = [[Button alloc] init];
        modify3.name = @"Modify 3";
        [panel addSubview:[modify3 button2: CGRectMake(210, 50+120, 80, 50)]];
    }
    if(slots>1){
        Button *modify4 = [[Button alloc] init];
        modify4.name = @"Modify 4";
        [panel addSubview:[modify4 button2: CGRectMake(210, 50+180, 80, 50)]];
    }
    if(slots>2){
        Button *modify5 = [[Button alloc] init];
        modify5.name = @"Modify 5";
        [panel addSubview:[modify5 button2: CGRectMake(210, 50+240, 80, 50)]];
    }
    [self configureTableview];
}
-(void)inventory{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UITextView *inventory = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    inventory.text = @"Inventory";
    inventory.backgroundColor = [UIColor blackColor];
    inventory.font = [UIFont fontWithName:@"Arial" size:14+5];
    inventory.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    inventory.editable = NO;
    [panel addSubview:inventory];
    UITextView *market_info = [[UITextView alloc] initWithFrame:CGRectMake(0, panel.frame.size.height-85, 220, 70)];
    market_info.backgroundColor = [UIColor blackColor];
    market_info.font = [UIFont fontWithName:@"Arial" size:13];
    market_info.textColor = [UIColor orangeColor];
    market_info.text = @"Go to the Market to sell items. You can also go to Market -> Jobs Market to craft uncompiled, unidentified, or unconstructed items.";
    [panel addSubview:market_info];
/*    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(5, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(5+55+1, 60*6, 55, 50.0)]]; */
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"inventory";
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [inventory1 httprequest:@"name,id,menu" :[NSString stringWithFormat:@"%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],whichTable] :@"mainmenu.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
 //   NSLog(@"%@ |||||||||||||||", array2[0]);
    
    UITextView *empty = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width/2-80/2, 70, 80, 25)];
    empty.text = @"Empty";
    empty.backgroundColor = [UIColor blackColor];
    empty.font = [UIFont fontWithName:@"Arial" size:14+5];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"Back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];

    [self configureTableview];

}
-(void)modify_1{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    motherboards.text = @"Mainboards";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Arial" size:14+5];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    [panel addSubview:motherboards];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"modify";
    action = @"inventory";
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    type = @"computer";
    @try{get_items = [inventory1 httprequest:@"name,id,action,type" :[NSString stringWithFormat:@"%@,%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],action,@"computer"] :@"equipment.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
    //   NSLog(@"%@ |||||||||||||||", array2[0]);
    
    UITextView *empty = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width/2-80/2, 70, 80, 25)];
    empty.text = @"Empty";
    empty.backgroundColor = [UIColor blackColor];
    empty.font = [UIFont fontWithName:@"Arial" size:14+5];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"Back ";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)modify_2{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    motherboards.text = @"CPUs";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Arial" size:14+5];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    [panel addSubview:motherboards];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"modify";
    action = @"inventory";
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    type = @"cpu";
    @try{get_items = [inventory1 httprequest:@"name,id,action,type" :[NSString stringWithFormat:@"%@,%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],action,@"cpu"] :@"equipment.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
    //   NSLog(@"%@ |||||||||||||||", array2[0]);
    
    UITextView *empty = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width/2-80/2, 70, 80, 25)];
    empty.text = @"Empty";
    empty.backgroundColor = [UIColor blackColor];
    empty.font = [UIFont fontWithName:@"Arial" size:14+5];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"Back ";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)modify_3{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    motherboards.text = @"Mods";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Arial" size:14+5];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    if(array2.count>3){
        NSArray *array4 = [array2[2] componentsSeparatedByString:@","];
        mod_id = array4[9];
    }
    [panel addSubview:motherboards];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"modify";
    action = @"inventory";
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    type = @"mod";
    @try{get_items = [inventory1 httprequest:@"name,id,action,type" :[NSString stringWithFormat:@"%@,%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],action,@"mod"] :@"equipment.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
    //   NSLog(@"%@ |||||||||||||||", array2[0]);
    
    UITextView *empty = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width/2-80/2, 70, 80, 25)];
    empty.text = @"Empty";
    empty.backgroundColor = [UIColor blackColor];
    empty.font = [UIFont fontWithName:@"Arial" size:14+5];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"Back ";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)modify_4{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    motherboards.text = @"Mods";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Arial" size:14+5];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    if(array2.count>4){
        NSArray *array4 = [array2[3] componentsSeparatedByString:@","];
        mod_id = array4[9];
    }
    [panel addSubview:motherboards];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"modify";
    action = @"inventory";
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    type = @"mod";
    @try{get_items = [inventory1 httprequest:@"name,id,action,type" :[NSString stringWithFormat:@"%@,%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],action,@"mod"] :@"equipment.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
    //   NSLog(@"%@ |||||||||||||||", array2[0]);
    
    UITextView *empty = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width/2-80/2, 70, 80, 25)];
    empty.text = @"Empty";
    empty.backgroundColor = [UIColor blackColor];
    empty.font = [UIFont fontWithName:@"Arial" size:14+5];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"Back ";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)modify_5{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    motherboards.text = @"Mods";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Arial" size:14+5];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    if(array2.count>5){
        NSArray *array4 = [array2[4] componentsSeparatedByString:@","];
        mod_id = array4[9];
    }
    [panel addSubview:motherboards];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"modify";
    action = @"inventory";
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    type = @"mod";
    @try{get_items = [inventory1 httprequest:@"name,id,action,type" :[NSString stringWithFormat:@"%@,%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],action,@"mod"] :@"equipment.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
    //   NSLog(@"%@ |||||||||||||||", array2[0]);
    
    UITextView *empty = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width/2-80/2, 70, 80, 25)];
    empty.text = @"Empty";
    empty.backgroundColor = [UIColor blackColor];
    empty.font = [UIFont fontWithName:@"Arial" size:14+5];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"Back ";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)goto_corp{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"goto_corp";
    username3 = [preferences3 stringForKey:@"username"];
    //    [username3 lowercaseString];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [inventory1 httprequest:@"name,id,menu" :[NSString stringWithFormat:@"%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],whichTable] :@"corporation.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
    NSArray *get_corp = [array2[0] componentsSeparatedByString:@","];
    UITextView *corporation = [[UITextView alloc] initWithFrame:CGRectMake(5, 5-6, 215, 25+5)];
    corporation.text = get_corp[3];
    corporation.backgroundColor = [UIColor blackColor];
    corporation.font = [UIFont fontWithName:@"Arial" size:13+5];
    corporation.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    corporation.editable = NO;
    [panel addSubview:corporation];
    UITextView *members = [[UITextView alloc] initWithFrame:CGRectMake(5, 28-2, 215, 20+2)];
    members.text = @"Members";
    members.backgroundColor = [UIColor blackColor];
    members.font = [UIFont fontWithName:@"Arial" size:10+5];
    members.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    members.editable = NO;
    [panel addSubview:members];
    [panel bringSubviewToFront:corporation];
    Functions *get_districts = [[Functions alloc] init];
    iD = 0;
    NSString *corp = [get_corp[3] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *districts;
    @try{districts = [get_districts httprequest:@"name,menu,corporation,server" :[NSString stringWithFormat:@"%@,%@,%@,%ld",username3,@"districts",corp,[preferences3  integerForKey:@"server"]] :@"corporation.php"];
    }@catch(NSException *error){}
    UITextView *districtsNum = [[UITextView alloc] initWithFrame:CGRectMake(125+25, 28-5, 215, 20+5)];
    districtsNum.text = [NSString stringWithFormat:@"%@  Districts  Owned", districts];
    districtsNum.backgroundColor = [UIColor blackColor];
    districtsNum.font = [UIFont fontWithName:@"Arial" size:10+5];
    districtsNum.textColor = [UIColor orangeColor];
    districtsNum.editable = NO;
    [panel addSubview:districtsNum];
    //   NSLog(@"%@ |||||||||||||||||||",username3);
    Button *back = [[Button alloc] init];
    back.name = @"Back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    NSString *profession = [preferences3 stringForKey:@"profession"];
    if(![profession isEqualToString:@"corporate"]){
        Button *leave = [[Button alloc] init];
        leave.name = @"Leave";
        [panel addSubview:[leave button2: CGRectMake(panel.frame.size.width-60-5-61, panel.frame.size.height-50-5, 60, 50.0)]];
    }
    [self configureTableview];
}
-(void)leave{
    warning = @"Are you sure you want to leave this corporation?";
    UIAlertController *alert =   [UIAlertController
                                  alertControllerWithTitle:@""
                                  message:@""
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Yes"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             
                             Functions *join = [[Functions alloc] init];
                             whichTable = @"leave";
                             @try{[join httprequest:@"name,menu" :[NSString stringWithFormat:@"%@,%@",username3,whichTable] :@"corporation.php"];
                             }@catch(NSException *error){}
                             [preferences3 setInteger:0 forKey:@"hasCorp"];
                             [preferences3 setObject:@"None" forKey:@"corporation"];
                             [self join_corp];
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             //SET PREFERENCES HASCORP VALUE TO 1
                         }];
    UIAlertAction *dismiss = [UIAlertAction
                              actionWithTitle:@"Cancel"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action){
                                  [alert dismissViewControllerAnimated:YES completion:nil];
                                  
                              }];
    UIColor *color = [UIColor orangeColor]; // select needed color
    NSString *string = warning;
    NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    [alert setValue:attrStr forKey:@"attributedMessage"];
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert class]]] setEffect:blurEffect];
    [alert addAction:ok];
    [alert addAction:dismiss];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)join_corp{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *corporations = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    corporations.text = @"Corporations";
    corporations.backgroundColor = [UIColor blackColor];
    corporations.font = [UIFont fontWithName:@"Arial" size:14+5];
    corporations.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    corporations.editable = NO;
    [panel addSubview:corporations];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"join_corp";
    username3 = [preferences3 stringForKey:@"username"];
    NSString *faction = [preferences3 stringForKey:@"faction"];
//    [username3 lowercaseString];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [inventory1 httprequest:@"name,id,menu,server" :[NSString stringWithFormat:@"%@,%@,%@,%ld",faction, [NSString stringWithFormat:@"%d",iD],whichTable,[preferences3 integerForKey:@"server"]] :@"mainmenu.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
 //   NSLog(@"%@ |||||||||||||||||||",username3);
    Button *back = [[Button alloc] init];
    back.name = @"Back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
    
//    array2 = @[ @"Nezennin Corp.", @"Nez Enterprises"];
//    whichTable = @"join_corp";

}
-(void)scoreboard{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *scoreboard = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    scoreboard.text = @"Scoreboard";
    scoreboard.backgroundColor = [UIColor blackColor];
    scoreboard.font = [UIFont fontWithName:@"Arial" size:14+5];
    scoreboard.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    scoreboard.editable = NO;
    [panel addSubview:scoreboard];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"scoreboard";
    username3 = [preferences3 stringForKey:@"username"];
    //    [username3 lowercaseString];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [inventory1 httprequest:@"server" :[NSString stringWithFormat:@"%ld",(long)[preferences3 integerForKey:@"server"]] :@"scoreboard.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
    //   NSLog(@"%@ |||||||||||||||||||",username3);
    Button *back = [[Button alloc] init];
    back.name = @"Back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
    
    //    array2 = @[ @"Nezennin Corp.", @"Nez Enterprises"];
    //    whichTable = @"join_corp";
    
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
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, 100+125 -45, 60, 50.0)]];
    UITextView *help = [[UITextView alloc] init];
    help.frame = CGRectMake(panel.frame.size.width/2- 130, 5, 260, 60);
    [help setText:@"Write us a question, error, or bug, and we'll get to you as soon as possible:"];
    help.textAlignment=NSTextAlignmentCenter;
    help.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
    help.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
    
    [panel addSubview:help];
    message3 = [[UITextView alloc] init];
 //   message.font = [UIFont fontWithName:@"Arial" size:16];
    message3.frame = CGRectMake(panel.frame.size.width/2 - 140, 55, 280, 120);
    message3.editable = YES;
    message3.layer.borderWidth = 2.0f;
    message3.layer.borderColor = [UIColor orangeColor].CGColor;
    message3.backgroundColor = [UIColor grayColor];
    message3.textColor = [UIColor whiteColor];
    Button *send = [[Button alloc] init];
    send.name = @"Send";
    [panel addSubview:[send button2: CGRectMake(panel.frame.size.width/2-30, 100+125 -45, 60, 50.0)]];

    [panel addSubview:message3];
    
}
-(void)tutorial{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIImage *tutorial1 = [UIImage imageNamed:@"tutorial1.png"];
    UIImageView *tutorial = [[UIImageView alloc] initWithImage:tutorial1];
    tutorial.frame = CGRectMake(0, 0, 347/1.6, 579/1.6);
    [panel addSubview:tutorial];
    
     Button *previous = [[Button alloc] init];
     previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-10-102, panel.frame.size.height-5-50, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2-60, panel.frame.size.height-5-50, 55, 50.0)]];
     iD = 0;
    Button *back = [[Button alloc] init];
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
}
-(void)next{
    if(iD<3){
        iD++;
        if(iD==0){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIImage *tutorial1 = [UIImage imageNamed:@"tutorial1.png"];
            UIImageView *tutorial = [[UIImageView alloc] initWithImage:tutorial1];
            tutorial.frame = CGRectMake(0, 0, 347/1.6, 579/1.6);
            [panel addSubview:tutorial];
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-10-102, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2-60, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *back = [[Button alloc] init];
            back.name = @"back";
            [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
        }else if(iD==1){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIImage *tutorial1 = [UIImage imageNamed:@"tutorial2.png"];
            UIImageView *tutorial = [[UIImageView alloc] initWithImage:tutorial1];
            tutorial.frame = CGRectMake(0, 0, 321/1.5, 555/1.5);
            [panel addSubview:tutorial];
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-10-102, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2-60, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *back = [[Button alloc] init];
            back.name = @"back";
            [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
        }else if(iD==2){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIImage *tutorial1 = [UIImage imageNamed:@"tutorial3.png"];
            UIImageView *tutorial = [[UIImageView alloc] initWithImage:tutorial1];
            tutorial.frame = CGRectMake(0, 0, 320/1.6, 590/1.6);
            [panel addSubview:tutorial];
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-10-102, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2-60, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *back = [[Button alloc] init];
            back.name = @"back";
            [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
        }else if(iD==3){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIImage *tutorial1 = [UIImage imageNamed:@"tutorial4.png"];
            UIImageView *tutorial = [[UIImageView alloc] initWithImage:tutorial1];
            tutorial.frame = CGRectMake(0, 0, 332/1.6, 564/1.6);
            [panel addSubview:tutorial];
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-10-102, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2-60, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *back = [[Button alloc] init];
            back.name = @"back";
            [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
        }
    }
}
-(void)previous{
    if(iD>0){
        iD--;
        if(iD==0){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIImage *tutorial1 = [UIImage imageNamed:@"tutorial1.png"];
            UIImageView *tutorial = [[UIImageView alloc] initWithImage:tutorial1];
            tutorial.frame = CGRectMake(0, 0, 347/1.6, 579/1.6);
            [panel addSubview:tutorial];
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-10-102, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2-60, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *back = [[Button alloc] init];
            back.name = @"back";
            [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
        }else if(iD==1){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIImage *tutorial1 = [UIImage imageNamed:@"tutorial2.png"];
            UIImageView *tutorial = [[UIImageView alloc] initWithImage:tutorial1];
            tutorial.frame = CGRectMake(0, 0, 321/1.5, 555/1.5);
            [panel addSubview:tutorial];
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-10-102, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2-60, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *back = [[Button alloc] init];
            back.name = @"back";
            [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
        }else if(iD==2){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIImage *tutorial1 = [UIImage imageNamed:@"tutorial3.png"];
            UIImageView *tutorial = [[UIImageView alloc] initWithImage:tutorial1];
            tutorial.frame = CGRectMake(0, 0, 320/1.6, 590/1.6);
            [panel addSubview:tutorial];
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-10-102, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2-60, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *back = [[Button alloc] init];
            back.name = @"back";
            [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
        }else if(iD==3){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            UIImage *tutorial1 = [UIImage imageNamed:@"tutorial4.png"];
            UIImageView *tutorial = [[UIImageView alloc] initWithImage:tutorial1];
            tutorial.frame = CGRectMake(0, 0, 332/1.6, 564/1.6);
            [panel addSubview:tutorial];
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-10-102, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2-60, panel.frame.size.height-5-50, 55, 50.0)]];
            Button *back = [[Button alloc] init];
            back.name = @"back";
            [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
        }
    }
}
-(void)send{
 //   NSLog(@"%@", message.text);
    [self.view endEditing:YES];
    message3.text=@"";
    //go back to main screen after sent
}
-(void)back{ //
    //MAKE ANOTHER BACK BUTTON FOR EQUIPMENT "back_"
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    Button *tutorial = [[Button alloc] init];
    tutorial.name = @"Tutorial";
    [panel addSubview:[tutorial button2: CGRectMake(panel.frame.size.width-85-5, panel.frame.size.height-50-5-50-5, 85, 50.0)]];
    
 /*   Button *changeProfession = [[Button alloc] init];
    changeProfession.name = @"change_profession";
    [panel addSubview:[changeProfession button2: CGRectMake(5, panel.frame.size.height-50-5, 180, 50.0)]];
    */
    Button *scoreboard = [[Button alloc] init];
    scoreboard.name = @"Scoreboard";
    [panel addSubview:[scoreboard button: CGRectMake(5, panel.frame.size.height-50-5, 180, 50.0)]];
    
    Button *help = [[Button alloc] init];
    help.name = @"Help";
 //   [panel addSubview:[help button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    Button *computer = [[Button alloc] init];
    computer.name = @"Computer";
    [panel addSubview:[computer button2: CGRectMake(panel.frame.size.width-115-5, 5, 115, 50.0)]];
    
    Button *inventory = [[Button alloc] init];
    inventory.name = @"Inventory";
    [panel addSubview:[inventory button2: CGRectMake(panel.frame.size.width-115-5, 5 + 55, 115, 50.0)]];
    
    username3 = [preferences3 stringForKey:@"username"];
    @try{char_info = [get_char_info httprequest:@"name" :username3 :@"get_char_info.php"];
    values = [ char_info componentsSeparatedByString: @","];
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
    [fmt setMaximumFractionDigits:0]; // to avoid any decimal
    NSInteger value = [values[8] intValue];
    NSString *result = [fmt stringFromNumber:@(value)];
    int nextLevel = ([values[1] intValue]+1)*10*([values[1] intValue]+1)*10;
        info.text = [[NSString alloc] initWithFormat: @"Name: %@\nLevel: %@\nProfession: %@\nStock Value: %@\nCorporation: %@\nDate Joined: %@\nSkill Points: %@/%d\nFaction: %@\nCredits: ₡%@", values[0], values[1], values[2], values[3], values[4], values[5], values[6], nextLevel, values[7], result];
 //   [info setTextColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
  //  [info setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    [panel addSubview:info];
    
    [preferences3 setObject:values[1] forKey:@"level"];
    //    NSLog(@"%ld |||||||||||||||", [preferences3 integerForKey:@"server"]);
 //   [preferences3 setInteger:[values[9] intValue] forKey:@"server"];
    
    if([values[2] isEqualToString:@"Corporate"]) [preferences3 setObject:@"corporate" forKey:@"profession"];
    else if([values[2] isEqualToString:@"Researcher"]) [preferences3 setObject:@"researcher" forKey:@"profession"];
    else if ([values[2] isEqualToString:@"Hacker"]) [preferences3 setObject:@"hacker" forKey:@"profession"];
    else if ([values[2] isEqualToString:@"Constructor"]) [preferences3 setObject:@"constructor" forKey:@"profession"];
    }@catch(NSException *error){info.text = @"No Internet Connection"; [panel addSubview:info];}
    Button *corp = [[Button alloc] init];
    if([[preferences3 stringForKey:@"profession"] isEqualToString:@"corporate"] && [preferences3 integerForKey:@"hasCorp"] == 1) corp.name = @"Goto Corp";
    else if([[preferences3 stringForKey:@"profession"] isEqualToString:@"corporate"]) corp.name = @"Create Corp";
    else if([preferences3 integerForKey:@"hasCorp"] == 1) corp.name = @"Goto Corp";
    else corp.name = @"Join Corp";
    [panel addSubview:[corp button: CGRectMake(5, panel.frame.size.height-50-5-50-5, 180, 50.0)]];
    
    message = [[UITextView alloc] init];
    message.font = [UIFont fontWithName:@"Arial" size:13+5];
    message.frame = CGRectMake(5, 5+155+15, 220, 25);
    message.text = @"Message From The City";
    message.editable = NO;
    [message setTextColor:[UIColor orangeColor]];
    [message setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    [panel addSubview:message];
    
    message2 = [[UITextView alloc] init];
    message2.font = [UIFont fontWithName:@"Arial" size:13];
    message2.frame = CGRectMake(5, 5+155+25+15, 290, 110);
    Functions *getmessage = [[Functions alloc] init];
    @try{welcome = [getmessage httprequest:@"" :[NSString stringWithFormat:@""] :@"welcome.php"];}@catch(NSException *error){}
    message2.text = welcome;
    message2.editable = NO;
    [message2 setTextColor:[UIColor whiteColor]];
    [message2 setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
 //   message2.layer.borderWidth = 2.0f;
 //   message2.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [panel addSubview:message2];
}
-(void)back_{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *equipment = [[UITextView alloc] initWithFrame:CGRectMake(5, 20-5, 215, 25+5)];
    equipment.text = @"Computer Setup";
    equipment.backgroundColor = [UIColor blackColor];
    equipment.font = [UIFont fontWithName:@"Arial" size:14+5];
    equipment.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    equipment.editable = NO;
    [panel addSubview:equipment];
    Button *back = [[Button alloc] init];
    back.name = @"Back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    //   array2 = @[@"CC-1000", @"CCPU-100", @"Mod Slot"];
    //  array3 = @[@"Generic motherboard", @"Generic CPU", @"Empty slot"];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    whichTable = @"equipment";
    @try{get_items = [inventory1 httprequest:@"name,menu" :[NSString stringWithFormat:@"%@,%@",username3, whichTable] :@"mainmenu.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count]==3) slots = [array2[2] intValue];
        if([array2 count]==4) slots = [array2[3] intValue];
        if([array2 count]==5) slots = [array2[4] intValue];
        if([array2 count]==6) slots = [array2[5] intValue];
    }@catch(NSException *error){}
    //   tech = [NSArray arrayWithObjects:[UIImage imageNamed:@"computer_bluegreen"],[UIImage imageNamed:@"cpu_bluegreen"],[UIImage imageNamed:@"slot.png"], nil];
    Button *modify1 = [[Button alloc] init];
    modify1.name = @"Modify 1";
    [panel addSubview:[modify1 button2: CGRectMake(210, 50, 80, 50)]];
    
    Button *modify2 = [[Button alloc] init];
    modify2.name = @"Modify 2";
    [panel addSubview:[modify2 button2: CGRectMake(210, 50+60, 80, 50)]];
    if(slots>0){
        Button *modify3 = [[Button alloc] init];
        modify3.name = @"Modify 3";
        [panel addSubview:[modify3 button2: CGRectMake(210, 50+120, 80, 50)]];
    }
    if(slots>1){
        Button *modify4 = [[Button alloc] init];
        modify4.name = @"Modify 4";
        [panel addSubview:[modify4 button2: CGRectMake(210, 50+180, 80, 50)]];
    }
    if(slots>2){
        Button *modify5 = [[Button alloc] init];
        modify5.name = @"Modify 5";
        [panel addSubview:[modify5 button2: CGRectMake(210, 50+240, 80, 50)]];
    }
    [self configureTableview];
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
    if([whichTable isEqualToString:@"join_corp"]){mainmenu = [[UITableView alloc] init];
        mainmenu.frame = CGRectMake(0, 50, panel.frame.size.width-10, 5*60-10);
        mainmenu.layer.borderWidth = 2.0f;
        mainmenu.layer.borderColor = [UIColor blueColor].CGColor;
        mainmenu.layer.backgroundColor = [UIColor blackColor].CGColor;
        mainmenu.backgroundColor = [UIColor blackColor];
        mainmenu.delegate = self;
        mainmenu.dataSource = self;
        [panel addSubview:mainmenu];
    }
    else if([whichTable isEqualToString:@"equipment"]){ mainmenu = [[UITableView alloc] init];
        mainmenu.frame = CGRectMake(0, 50, 210, (2+slots)*60);
        mainmenu.layer.borderWidth = 0.0;
        mainmenu.separatorColor = [UIColor clearColor];
        mainmenu.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
        mainmenu.layer.backgroundColor = [UIColor blackColor].CGColor;
        mainmenu.backgroundColor = [UIColor blackColor];
        mainmenu.delegate = self;
        mainmenu.dataSource = self;
        [panel addSubview:mainmenu];
    }
    else{
        mainmenu = [[UITableView alloc] init];
        mainmenu.frame = CGRectMake(5, 50, 235, 5*60-10);
        //     market.setMasksToBounds:YES];
        //     [layer setCornerRadius: 4.0];
        mainmenu.layer.borderWidth = 2.0f;
        mainmenu.layer.borderColor = [UIColor blueColor].CGColor;
        mainmenu.layer.backgroundColor = [UIColor blackColor].CGColor;
        mainmenu.backgroundColor = [UIColor blackColor];
        mainmenu.delegate = self;
        mainmenu.dataSource = self;
        [panel addSubview:mainmenu];
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
  /*  if([whichTable isEqualToString:@"inventory"] || [whichTable isEqualToString:@"join_corp"] || [whichTable isEqualToString:@"modify"] || [whichTable isEqualToString:@"goto_corp"] || [whichTable isEqualToString:@"scoreboard"]) return array2.count-1;
   */
    if(![whichTable isEqualToString:@"equipment"]) return array2.count-1;
    else return array2.count-1+slots;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
 //   NSLog(@"title of cell %@", [array2 objectAtIndex:indexPath.row]);
    NSString *items = [array2 objectAtIndex:indexPath.row];
    array3 = [items componentsSeparatedByString: @","];
    NSString *motherboard;
    Functions *get_motherboard = [[Functions alloc] init];
    @try{motherboard = [get_motherboard httprequest:@"name" :username3 :@"motherboard.php"];
    }@catch(NSException *error){}
//    NSArray *motherboard_level = [motherboard componentsSeparatedByString: @","];
//    NSLog(@"?????%d|||||||", [motherboard intValue]);
    if([whichTable isEqualToString:@"modify"]){
        if([array3[8] isEqualToString:@"1"]) {warning = @"Already Equipped";}
        else if([array3[1] intValue] > [[preferences3 stringForKey:@"level"] intValue]){
            warning = @"Player Level Too Low to Equip Item";
        }
        else if([array3[1] intValue] > [motherboard intValue] + 9){
            warning = [NSString stringWithFormat: @"Motherboard Level (Lvl %d) Too Low to Equip Item (Lvl %d)", [motherboard intValue]+9-1, [array3[1] intValue]];
        }
        if([array3[8] isEqualToString:@"1"] || [array3[1] intValue] > [[preferences3 stringForKey:@"level"] intValue] ||  [array3[1] intValue] > [motherboard intValue]+9 ){
            UIAlertController *alert =   [UIAlertController
                       alertControllerWithTitle:@""
                       message:@""
                       preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *dismiss = [UIAlertAction
                       actionWithTitle:@"Dismiss"
                       style:UIAlertActionStyleDefault
                       handler:^(UIAlertAction * action){
                           [alert dismissViewControllerAnimated:YES completion:nil];
                       }];
            UIColor *color = [UIColor orangeColor]; // select needed color
            NSString *string = warning;
            NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
            NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
            [alert setValue:attrStr forKey:@"attributedMessage"];
            UIVisualEffect *blurEffect;
            blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert class]]] setEffect:blurEffect];
            [alert addAction:dismiss];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        else {
            
            NSString *items = [array2 objectAtIndex:indexPath.row];
            array3 = [items componentsSeparatedByString: @","];
            if([array3[3] isEqualToString:@"mod"]){
                @try{get_items = [inventory1 httprequest:@"name,id,action,type,mod_id" :[NSString stringWithFormat:@"%@,%@,%@,%@,%@",username3, array3[9],@"modify",array3[3],mod_id] :@"equipment.php"];
                }@catch(NSException *error){}
                [self back_];
            }else {
                @try{get_items = [inventory1 httprequest:@"name,id,action,type" :[NSString stringWithFormat:@"%@,%@,%@,%@",username3, array3[9],@"modify",array3[3]] :@"equipment.php"];
                }@catch(NSException *error){}
                [self back_];
            }
        }
    }else if([whichTable isEqualToString:@"join_corp"]){
        warning = @"Are you sure you want to join this corporation?";
        UIAlertController *alert =   [UIAlertController
                                      alertControllerWithTitle:@""
                                      message:@""
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Yes"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 NSString *items = [array2 objectAtIndex:indexPath.row];
                                 array3 = [items componentsSeparatedByString: @","];
                                 Functions *join = [[Functions alloc] init];
                                 NSString *corp = [array3[0] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
                                 
                                 @try{[join httprequest:@"name,menu,corporation" :[NSString stringWithFormat:@"%@,%@,%@",username3,whichTable,corp] :@"corporation.php"];
                                 }@catch(NSException *error){}
                                 [preferences3 setObject:array3[0] forKey:@"corporation"];
                                 [preferences3 setInteger:1 forKey:@"hasCorp"];
                                 [self goto_corp];
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 //SET PREFERENCES HASCORP VALUE TO 1
                             }];
        UIAlertAction *dismiss = [UIAlertAction
                                  actionWithTitle:@"Cancel"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action){
                                      [alert dismissViewControllerAnimated:YES completion:nil];
                                      
                                  }];
        UIColor *color = [UIColor orangeColor]; // select needed color
        NSString *string = warning;
        NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
        [alert setValue:attrStr forKey:@"attributedMessage"];
        UIVisualEffect *blurEffect;
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert class]]] setEffect:blurEffect];
        [alert addAction:ok];
        [alert addAction:dismiss];
        [self presentViewController:alert animated:YES completion:nil];
    }
  
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
        NSString *items = [array2 objectAtIndex:indexPath.row];
        //     NSLog(@"%@", items);
        array3 = [items componentsSeparatedByString: @","];
        cell.textLabel.text =  array3[0];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ members", array3[2]];
        
     //   cell.detailTextLabel.text = @"1 member";
    }else if([whichTable isEqualToString:@"scoreboard"]){
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.font = [UIFont fontWithName:@"Arial" size:11];
        NSString *items = [array2 objectAtIndex:indexPath.row];
        //     NSLog(@"%@", items);
        array3 = [items componentsSeparatedByString: @","];
        cell.textLabel.text =  [NSString stringWithFormat:@"%ld. %@     %@", (long)indexPath.row+1,array3[0],array3[3]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"CEO: %@   Faction: %@", array3[1],[array3[2] capitalizedString]];
        
        //   cell.detailTextLabel.text = @"1 member";
    }else if([whichTable isEqualToString:@"goto_corp"]){
        UIImage *avatar = [UIImage imageNamed:@"avatar.png"];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.imageView.image = avatar;
        NSString *items = [array2 objectAtIndex:indexPath.row];
        //     NSLog(@"%@", items);
        array3 = [items componentsSeparatedByString: @","];
        cell.textLabel.text =  array3[0];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Level %@ %@", array3[1], array3[2]];
        
        //   cell.detailTextLabel.text = @"1 member";
    }
    else if([whichTable isEqualToString:@"equipment"]){
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
  //      UIImage *assets = [tech objectAtIndex:indexPath.row];
 //       NSLog(@"%@", items);
        if(array2.count-1>indexPath.row){
            NSString *items = [array2 objectAtIndex:indexPath.row];
            array3 = [items componentsSeparatedByString: @","];
            NSString *type;// = array3[1];
            NSString *detail;
            if([array3[3] isEqualToString:@"computer"]){
                type = [NSString stringWithFormat:@"Mainboard Lvl.%@", array3[1]];
                detail = [NSString stringWithFormat:@"Slots: %@",array3[7]];
                if([array3[1] isEqualToString:@"1"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
                }
                if([array3[1] isEqualToString:@"3"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
                }
                if([array3[1] isEqualToString:@"12"] || [array3[1] isEqualToString:@"10"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_blue.png"];
                    
                }
                if([array3[1] isEqualToString:@"21"] || [array3[1] isEqualToString:@"19"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_green.png"];
                    
                }//  FIX POWER IN HERE AND MARKET BEFORE LAUNCH
            }if([array3[3] isEqualToString:@"cpu"]){
                type = [NSString stringWithFormat:@"Blueprint Lvl.%@", array3[1]];
                if([array3[1] isEqualToString:@"1"]){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
                }
                if([array3[1] intValue]>=3 && [array3[1] intValue]<=9){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
                }
                if([array3[1] intValue]>=10 && [array3[1] intValue]<=18){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_blue.png"];
                    detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
                }
                if([array3[1] intValue]>=19 && [array3[1] intValue]<=27){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_green.png"];
                    detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
                }
            }if([array3[3] isEqualToString:@"mod"]){
                type = [NSString stringWithFormat:@"Blueprint Lvl.%@", array3[1]];
                if([array3[1] intValue] >= 1 && [array3[1] intValue] <= 9){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
                    if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+1 %@ speed",array3[4]];
                    else detail = [NSString stringWithFormat:@"+1 %@ %@",array3[4],array3[5]];
                }
                if([array3[1] intValue] >= 12 && [array3[1] intValue] <= 18){
                    cell.imageView.image=[UIImage imageNamed:@"mod_blue.png"];
                    if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+2 %@ speed",array3[4]];
                    else detail = [NSString stringWithFormat:@"+2 %@ %@",array3[4],array3[5]];
                }
                if([array3[1] intValue] >= 21 && [array3[1] intValue] <= 27){
                    cell.imageView.image=[UIImage imageNamed:@"mod_green.png"];
                    if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+3 %@ speed",array3[4]];
                    else detail = [NSString stringWithFormat:@"+3 %@ %@",array3[4],array3[5]];
                }
            }
            cell.textLabel.text =  [[NSString alloc] initWithFormat:@"%@ Lvl.%@", array3[0], array3[1]];
            cell.detailTextLabel.text = detail;
        }else if(indexPath.row == 2 && (slots == 1 || slots == 2 || slots == 3)){
            cell.textLabel.text = @"Mod Slot";
            cell.detailTextLabel.text = @"Empty slot";
            cell.imageView.image = [UIImage imageNamed:@"slot.png"];
        }else if(indexPath.row == 3 && (slots == 2 || slots == 3)){
            cell.textLabel.text = @"Mod Slot";
            cell.detailTextLabel.text = @"Empty slot";
            cell.imageView.image = [UIImage imageNamed:@"slot.png"];
        }else if(indexPath.row == 4 && slots == 3){
            cell.textLabel.text = @"Mod Slot";
            cell.detailTextLabel.text = @"Empty slot";
            cell.imageView.image = [UIImage imageNamed:@"slot.png"];
        }
      //  cell.imageView.image = assets;
    }
    else if([whichTable isEqualToString:@"inventory"]){
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
  //      UIImage *assets = [tech objectAtIndex:indexPath.row];
        NSString *items = [array2 objectAtIndex:indexPath.row];
   //     NSLog(@"%@", items);
        array3 = [items componentsSeparatedByString: @","];
        NSString *equipped;
        if([array3[8] isEqualToString:@"1"]) equipped = @" - Equipped";
        else equipped = @"";
        NSString *type;// = array3[1];
        NSString *detail = [[NSString alloc] init];
        if([array3[10] isEqualToString:@"blueprint"] && [array3[11] isEqualToString:@"0"]){
            type = @"Unidentified Blueprint";
            if([array3[1] intValue]>=1 && [array3[1] intValue]<=9){
                cell.imageView.image=[UIImage imageNamed:@"unidentified_bp_bluegreen.png"];
                detail = [NSString stringWithFormat:@""];
            }
            else if([array3[1] intValue]>=10 && [array3[1] intValue]<=18){
                cell.imageView.image=[UIImage imageNamed:@"unidentified_bp_blue.png"];
                detail = [NSString stringWithFormat:@""];
            }
            else if([array3[1] intValue]>=19 && [array3[1] intValue]<=27){
                cell.imageView.image=[UIImage imageNamed:@"unidentified_bp_green.png"];
                detail = [NSString stringWithFormat:@""];
            }
        }
        else if([array3[10] isEqualToString:@"blueprint"]){
            if([array3[3] isEqualToString:@"computer"]){
                type = [NSString stringWithFormat:@"Blueprint Lvl.%@", array3[1]];
                if([array3[1] isEqualToString:@"3"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_bluegreen.png"];
                }
                if([array3[1] isEqualToString:@"12"] || [array3[1] isEqualToString:@"10"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_blue.png"];
                }
                if([array3[1] isEqualToString:@"21"] || [array3[1] isEqualToString:@"19"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_green.png"];
                }
            }else if([array3[3] isEqualToString:@"cpu"]){
                type = [NSString stringWithFormat:@"Blueprint Lvl.%@", array3[1]];
                if([array3[1] isEqualToString:@"1"]){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
                }
                if([array3[1] intValue]>=3 && [array3[1] intValue]<=9){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
                }
                if([array3[1] intValue]>=10 && [array3[1] intValue]<=18){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_blue.png"];
                    detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
                }
                if([array3[1] intValue]>=19 && [array3[1] intValue]<=27){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_green.png"];
                    detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
                }
            }else if([array3[3] isEqualToString:@"mod"]){
                type = [NSString stringWithFormat:@"Blueprint Lvl.%@", array3[1]];
                if([array3[1] intValue] >= 1 && [array3[1] intValue] <= 9){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_bluegreen.png"];
                    if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+1 %@ speed",array3[4]];
                    else detail = [NSString stringWithFormat:@"+1 %@ %@",array3[4],array3[5]];
                }
                if([array3[1] intValue] >= 12 && [array3[1] intValue] <= 18){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_blue.png"];
                    if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+2 %@ speed",array3[4]];
                    else detail = [NSString stringWithFormat:@"+2 %@ %@",array3[4],array3[5]];
                }
                if([array3[1] intValue] >= 21 && [array3[1] intValue] <= 27){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_green.png"];
                    if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+3 %@ speed",array3[4]];
                    else detail = [NSString stringWithFormat:@"+3 %@ %@",array3[4],array3[5]];
                }
            }
        }
        else if([array3[3] isEqualToString:@"computer"]){
            type = [NSString stringWithFormat:@"Mainboard Lvl.%@", array3[1]];
            detail = [NSString stringWithFormat:@"Slots: %@",array3[7]];
            if([array3[1] isEqualToString:@"1"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
            }
            if([array3[1] isEqualToString:@"3"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
            }
            if([array3[1] isEqualToString:@"12"] || [array3[1] isEqualToString:@"10"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_blue.png"];
            }
            if([array3[1] isEqualToString:@"21"] || [array3[1] isEqualToString:@"19"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_green.png"];
            }
        }else if([array3[3] isEqualToString:@"cpu"]){
            type = [NSString stringWithFormat:@"CPU Lvl.%@", array3[1]];
            if([array3[1] isEqualToString:@"1"]){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
            }
            if([array3[1] intValue]>=3 && [array3[1] intValue]<=9){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
            }
            if([array3[1] intValue]>=10 && [array3[1] intValue]<=18){
                cell.imageView.image=[UIImage imageNamed:@"cpu_blue.png"];
                detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
            }
            if([array3[1] intValue]>=19 && [array3[1] intValue]<=27){
                cell.imageView.image=[UIImage imageNamed:@"cpu_green.png"];
                detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
            }
        }else if([array3[3] isEqualToString:@"mod"]){
            type = [NSString stringWithFormat:@"Mod Lvl.%@", array3[1]];
            if([array3[1] intValue] >= 1 && [array3[1] intValue] <= 9){
                cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
                if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+1 %@ speed",array3[4]];
                else detail = [NSString stringWithFormat:@"+1 %@ %@",array3[4],array3[5]];
            }
            if([array3[1] intValue] >= 12 && [array3[1] intValue] <= 18){
                cell.imageView.image=[UIImage imageNamed:@"mod_blue.png"];
                if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+2 %@ speed",array3[4]];
                else detail = [NSString stringWithFormat:@"+2 %@ %@",array3[4],array3[5]];
            }
            if([array3[1] intValue] >= 21 && [array3[1] intValue] <= 27){
                cell.imageView.image=[UIImage imageNamed:@"mod_green.png"];
                if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+3 %@ speed",array3[4]];
                else detail = [NSString stringWithFormat:@"+3 %@ %@",array3[4],array3[5]];
            }
        }else if([array3[3] isEqualToString:@"exploit"]){
            if([array3[11] isEqualToString:@"0"]) type = @"- Uncompiled";
            else type = @"- Compiled";
            if([array3[1] isEqualToString:@"1"]) cell.imageView.image=[UIImage imageNamed:@"exploit_bluegreen.png"];
            if([array3[1] isEqualToString:@"2"]) cell.imageView.image=[UIImage imageNamed:@"exploit_blue.png"];
            if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"exploit_green.png"];
        }
        if([array3[10] isEqualToString:@"blueprint"] && [array3[11] isEqualToString:@"0"]) cell.textLabel.text = type;
        else if([array3[10] isEqualToString:@"exploit"] && [array3[11] isEqualToString:@"0"]) cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@ %@", array3[0],type];
        else cell.textLabel.text =  [[NSString alloc] initWithFormat:@"%@ Lvl.%@%@", array3[0], array3[1], equipped];
        cell.detailTextLabel.text = detail;

             //   cell.imageView.image = assets;
    }else if([whichTable isEqualToString:@"modify"]){
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        //      UIImage *assets = [tech objectAtIndex:indexPath.row];
        NSString *items = [array2 objectAtIndex:indexPath.row];
        //     NSLog(@"%@", items);
        array3 = [items componentsSeparatedByString: @","];
        NSString *equipped;
        if([array3[8] isEqualToString:@"1"]) equipped = @" - Equipped";
        else equipped = @"";
        cell.textLabel.text =  [[NSString alloc] initWithFormat:@"%@%@", array3[0], equipped];
        cell.detailTextLabel.text = array3[3];
        NSString *type;// = array3[1];
        NSString *detail;
        if([array3[3] isEqualToString:@"computer"]){
            type = [NSString stringWithFormat:@"Mainboard Lvl.%@", array3[1]];
            detail = [NSString stringWithFormat:@"Slots: %@",array3[7]];
            if([array3[1] isEqualToString:@"1"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
            }
            if([array3[1] isEqualToString:@"3"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
            }
            if([array3[1] isEqualToString:@"12"] || [array3[1] isEqualToString:@"10"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_blue.png"];
            }
            if([array3[1] isEqualToString:@"21"] || [array3[1] isEqualToString:@"19"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_green.png"];
            }
        }else if([array3[3] isEqualToString:@"cpu"]){
            type = [NSString stringWithFormat:@"CPU Lvl.%@", array3[1]];
            if([array3[1] isEqualToString:@"1"]){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
            }
            if([array3[1] intValue]>=3 && [array3[1] intValue]<=9){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
            }
            if([array3[1] intValue]>=10 && [array3[1] intValue]<=18){
                cell.imageView.image=[UIImage imageNamed:@"cpu_blue.png"];
                detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
            }
            if([array3[1] intValue]>=19 && [array3[1] intValue]<=27){
                cell.imageView.image=[UIImage imageNamed:@"cpu_green.png"];
                detail = [NSString stringWithFormat:@"Power +%@", array3[1]];
            }
        }else if([array3[3] isEqualToString:@"mod"]){
            type = [NSString stringWithFormat:@"Mod Lvl.%@", array3[1]];
            if([array3[1] intValue] >= 1 && [array3[1] intValue] <= 9){
                cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
                if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+10 %@ speed",array3[4]];
                else detail = [NSString stringWithFormat:@"+1 %@ %@",array3[4],array3[5]];
            }
            if([array3[1] intValue] >= 12 && [array3[1] intValue] <= 18){
                cell.imageView.image=[UIImage imageNamed:@"mod_blue.png"];
                if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+10 %@ speed",array3[4]];
                else detail = [NSString stringWithFormat:@"+2 %@ %@",array3[4],array3[5]];
            }
            if([array3[1] intValue] >= 21 && [array3[1] intValue] <= 27){
                cell.imageView.image=[UIImage imageNamed:@"mod_green.png"];
                if([array3[4] isEqualToString:@"hack"] && [array3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+3 %@ speed",array3[4]];
                else detail = [NSString stringWithFormat:@"+3 %@ %@",array3[4],array3[5]];
            }
        }
        cell.textLabel.text =  [[NSString alloc] initWithFormat:@"%@ Lvl.%@%@", array3[0], array3[1], equipped];
        cell.detailTextLabel.text = detail;

                //   cell.imageView.image = assets;
    }

  /*  NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
    cell.imageView.image = theImage; */
 
    return cell;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
