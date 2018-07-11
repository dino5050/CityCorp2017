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
static NSString *action;
static NSString *mod_id;
//static UITableView *inventory;
static Functions *inventory1;
static UITableView *mainmenu;
static NSArray *items;
static NSArray *items3;
static NSString *get_items;
static int counts;
static int slots;
static NSString *type;
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
    
    Button *tutorial = [[Button alloc] init];
    tutorial.name = @"tutorial";
    [panel addSubview:[tutorial button2: CGRectMake(panel.frame.size.width-85-5, panel.frame.size.height-50-5-50-5, 85, 50.0)]];
    
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
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
    [fmt setMaximumFractionDigits:0]; // to avoid any decimal
    NSInteger value = [values[8] intValue];
    NSString *result = [fmt stringFromNumber:@(value)];
    info.text = [[NSString alloc] initWithFormat: @"Name: %@\nLevel: %@\nProfession: %@\nStock Value: %@\nCorporation: %@\nDate Joined: %@\nSkill Points: %@\nFaction: %@\nCredits: ₡%@", values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], result];
    
    [panel addSubview:info];
    [preferences3 setObject:values[7] forKey:@"faction"];
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
    [panel addSubview:[corp button: CGRectMake(5, panel.frame.size.height-50-5-55, 180, 50.0)]];
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
    UITextView *equipment = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    equipment.text = @"Computer   Setup";
    equipment.backgroundColor = [UIColor blackColor];
    equipment.font = [UIFont fontWithName:@"Abduction" size:14];
    equipment.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    equipment.editable = NO;
    [panel addSubview:equipment];
    Button *back = [[Button alloc] init];
    back.name = @"back";
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
    modify1.name = @"modify_1";
    [panel addSubview:[modify1 button2: CGRectMake(210, 50, 80, 50)]];
    
    Button *modify2 = [[Button alloc] init];
    modify2.name = @"modify_2";
    [panel addSubview:[modify2 button2: CGRectMake(210, 50+60, 80, 50)]];
    if(slots>0){
        Button *modify3 = [[Button alloc] init];
        modify3.name = @"modify_3";
        [panel addSubview:[modify3 button2: CGRectMake(210, 50+120, 80, 50)]];
    }
    if(slots>1){
        Button *modify4 = [[Button alloc] init];
        modify4.name = @"modify_4";
        [panel addSubview:[modify4 button2: CGRectMake(210, 50+180, 80, 50)]];
    }
    if(slots>2){
        Button *modify5 = [[Button alloc] init];
        modify5.name = @"modify_5";
        [panel addSubview:[modify5 button2: CGRectMake(210, 50+240, 80, 50)]];
    }
    [self configureTableview];
}
-(void)inventory{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *inventory = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    inventory.text = @"Inventory";
    inventory.backgroundColor = [UIColor blackColor];
    inventory.font = [UIFont fontWithName:@"Abduction" size:14];
    inventory.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    inventory.editable = NO;
    [panel addSubview:inventory];
    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(5, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(5+55+1, 60*6, 55, 50.0)]];
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
    empty.font = [UIFont fontWithName:@"Abduction" size:14];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
        Button *back = [[Button alloc] init];
        back.name = @"back";
        [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
        [self configureTableview];

}
-(void)modify_1{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    motherboards.text = @"Motherboards";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Abduction" size:14];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    [panel addSubview:motherboards];
    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(5, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(5+55+1, 60*6, 55, 50.0)]];
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
    empty.font = [UIFont fontWithName:@"Abduction" size:14];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"back_";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)modify_2{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    motherboards.text = @"CPUs";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Abduction" size:14];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    [panel addSubview:motherboards];
    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(5, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(5+55+1, 60*6, 55, 50.0)]];
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
    empty.font = [UIFont fontWithName:@"Abduction" size:14];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"back_";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)modify_3{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    motherboards.text = @"Mods";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Abduction" size:14];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    if(array2.count>3){
        NSArray *array4 = [array2[2] componentsSeparatedByString:@","];
        mod_id = array4[9];
    }
    [panel addSubview:motherboards];
    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(5, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(5+55+1, 60*6, 55, 50.0)]];
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
    empty.font = [UIFont fontWithName:@"Abduction" size:14];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"back_";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)modify_4{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    motherboards.text = @"Mods";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Abduction" size:14];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    if(array2.count>4){
        NSArray *array4 = [array2[3] componentsSeparatedByString:@","];
        mod_id = array4[9];
    }
    [panel addSubview:motherboards];
    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(5, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(5+55+1, 60*6, 55, 50.0)]];
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
    empty.font = [UIFont fontWithName:@"Abduction" size:14];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"back_";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)modify_5{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *motherboards = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    motherboards.text = @"Mods";
    motherboards.backgroundColor = [UIColor blackColor];
    motherboards.font = [UIFont fontWithName:@"Abduction" size:14];
    motherboards.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    motherboards.editable = NO;
    if(array2.count>5){
        NSArray *array4 = [array2[4] componentsSeparatedByString:@","];
        mod_id = array4[9];
    }
    [panel addSubview:motherboards];
    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(5, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(5+55+1, 60*6, 55, 50.0)]];
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
    empty.font = [UIFont fontWithName:@"Abduction" size:14];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    Button *back = [[Button alloc] init];
    back.name = @"back_";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    
    [self configureTableview];
}
-(void)next{
    if(iD<counts-5){
        iD = iD + 5;
        if(![whichTable isEqualToString:@"modify"]){
            @try{get_items = [inventory1 httprequest:@"name,id,menu" :[NSString stringWithFormat:@"%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],whichTable] :@"mainmenu.php"];
            array2 = [get_items componentsSeparatedByString: @"|"];
            if([array2 count] > 5) counts = [array2[5] intValue];
            else counts = 0;
            }@catch(NSException *error){}
            [mainmenu removeFromSuperview];
            [mainmenu reloadData];
            [self configureTableview];
        }else{
            @try{get_items = [inventory1 httprequest:@"name,id,action,type" :[NSString stringWithFormat:@"%@,%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],action,type] :@"equipment.php"];
                array2 = [get_items componentsSeparatedByString: @"|"];
                if([array2 count] > 5) counts = [array2[5] intValue];
                else counts = 0;
            }@catch(NSException *error){}
            [mainmenu removeFromSuperview];
            [mainmenu reloadData];
            [self configureTableview];
        
        }
    }
    
}
-(void)previous{
    if(iD >= 5){
        iD = iD - 5;
        if(![whichTable isEqualToString:@"modify"]){
            @try{get_items = [inventory1 httprequest:@"name,id,menu" :[NSString stringWithFormat:@"%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],whichTable] :@"mainmenu.php"];
                array2 = [get_items componentsSeparatedByString: @"|"];
                if([array2 count] > 5) counts = [array2[5] intValue];
                else counts = 0;
            }@catch(NSException *error){}
            [mainmenu removeFromSuperview];
            [mainmenu reloadData];
            [self configureTableview];
        }else{
            @try{get_items = [inventory1 httprequest:@"name,id,action,type" :[NSString stringWithFormat:@"%@,%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],action,type] :@"equipment.php"];
                array2 = [get_items componentsSeparatedByString: @"|"];
                if([array2 count] > 5) counts = [array2[5] intValue];
                else counts = 0;
            }@catch(NSException *error){}
            [mainmenu removeFromSuperview];
            [mainmenu reloadData];
            [self configureTableview];
            
        }
    }
 
}
-(void)join_corp{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *corporations = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    corporations.text = @"Corporations";
    corporations.backgroundColor = [UIColor blackColor];
    corporations.font = [UIFont fontWithName:@"Abduction" size:14];
    corporations.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    corporations.editable = NO;
    [panel addSubview:corporations];
    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(5, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(5+55+1, 60*6, 55, 50.0)]];
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"join_corp";
    username3 = [preferences3 stringForKey:@"faction"];
//    [username3 lowercaseString];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [inventory1 httprequest:@"name,id,menu" :[NSString stringWithFormat:@"%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],whichTable] :@"mainmenu.php"];
        array2 = [get_items componentsSeparatedByString: @"|"];
        if([array2 count] > 5) counts = [array2[5] intValue];
        else counts = 0;
    }@catch(NSException *error){}
 //   NSLog(@"%@ |||||||||||||||||||",username3);
    Button *back = [[Button alloc] init];
    back.name = @"back";
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
-(void)back{ //
    //MAKE ANOTHER BACK BUTTON FOR EQUIPMENT "back_"
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    Button *tutorial = [[Button alloc] init];
    tutorial.name = @"tutorial";
    [panel addSubview:[tutorial button2: CGRectMake(panel.frame.size.width-85-5, panel.frame.size.height-50-5-50-5, 85, 50.0)]];
    
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
    
    username3 = [preferences3 stringForKey:@"username"];
    @try{char_info = [get_char_info httprequest:@"name" :username3 :@"get_char_info.php"];
    values = [ char_info componentsSeparatedByString: @","];
    info.text = [[NSString alloc] initWithFormat: @"Name: %@\nLevel: %@\nProfession: %@\nStock Value: %@\nCorporation: %@\nDate Joined: %@\nSkill Points: %@\nFaction: %@\nCredits: ₡%@", values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7], values[8]];
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
    
    message = [[UITextView alloc] init];
    message.font = [UIFont fontWithName:@"Arial" size:16];
    message.frame = CGRectMake(5, 5+155, 200, 100);
    message.text = @"Message of the day";
    message.editable = NO;
    [message setTextColor:[UIColor colorWithRed:255 green:255 blue:255 alpha:255]];
    [message setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    [panel addSubview:message];
}
-(void)back_{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *equipment = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    equipment.text = @"Computer   Setup";
    equipment.backgroundColor = [UIColor blackColor];
    equipment.font = [UIFont fontWithName:@"Abduction" size:14];
    equipment.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    equipment.editable = NO;
    [panel addSubview:equipment];
    Button *back = [[Button alloc] init];
    back.name = @"back";
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
    modify1.name = @"modify_1";
    [panel addSubview:[modify1 button2: CGRectMake(210, 50, 80, 50)]];
    
    Button *modify2 = [[Button alloc] init];
    modify2.name = @"modify_2";
    [panel addSubview:[modify2 button2: CGRectMake(210, 50+60, 80, 50)]];
    if(slots>0){
        Button *modify3 = [[Button alloc] init];
        modify3.name = @"modify_3";
        [panel addSubview:[modify3 button2: CGRectMake(210, 50+120, 80, 50)]];
    }
    if(slots>1){
        Button *modify4 = [[Button alloc] init];
        modify4.name = @"modify_4";
        [panel addSubview:[modify4 button2: CGRectMake(210, 50+180, 80, 50)]];
    }
    if(slots>2){
        Button *modify5 = [[Button alloc] init];
        modify5.name = @"modify_5";
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
        mainmenu.frame = CGRectMake(0, 50, panel.frame.size.width-10, (array2.count-1)*60);
        mainmenu.layer.borderWidth = 2.0;
        mainmenu.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor clearColor]);
        mainmenu.layer.backgroundColor = [UIColor blackColor].CGColor;
        mainmenu.delegate = self;
        mainmenu.dataSource = self;
        [panel addSubview:mainmenu];
    }
    else if([whichTable isEqualToString:@"equipment"]){ mainmenu = [[UITableView alloc] init];
        mainmenu.frame = CGRectMake(0, 50, 205, (array2.count-1+slots)*60);
        mainmenu.layer.borderWidth = 0.0;
        mainmenu.separatorColor = [UIColor clearColor];
        mainmenu.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
        mainmenu.layer.backgroundColor = [UIColor blackColor].CGColor;
        mainmenu.delegate = self;
        mainmenu.dataSource = self;
        [panel addSubview:mainmenu];
    }
    else if([whichTable isEqualToString:@"inventory"]){
        mainmenu = [[UITableView alloc] init];
        mainmenu.frame = CGRectMake(5, 50, 235, (array2.count-1)*60);
        //     market.setMasksToBounds:YES];
        //     [layer setCornerRadius: 4.0];
        mainmenu.layer.borderWidth = 2.0f;
        mainmenu.layer.borderColor = [UIColor blueColor].CGColor;
        mainmenu.layer.backgroundColor = [UIColor blackColor].CGColor;
        mainmenu.delegate = self;
        mainmenu.dataSource = self;
        [panel addSubview:mainmenu];
    }else if([whichTable isEqualToString:@"modify"]){
        mainmenu = [[UITableView alloc] init];
        mainmenu.frame = CGRectMake(5, 50, 235, (array2.count-1)*60);
        //     market.setMasksToBounds:YES];
        //     [layer setCornerRadius: 4.0];
        mainmenu.layer.borderWidth = 2.0f;
        mainmenu.layer.borderColor = [UIColor blueColor].CGColor;
        mainmenu.layer.backgroundColor = [UIColor blackColor].CGColor;
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
    if([whichTable isEqualToString:@"inventory"] || [whichTable isEqualToString:@"join_corp"] || [whichTable isEqualToString:@"modify"]) return array2.count-1;
    else return array2.count-1+slots;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"title of cell %@", [array2 objectAtIndex:indexPath.row]);
    NSString *items = [array2 objectAtIndex:indexPath.row];
    array3 = [items componentsSeparatedByString: @","];
    if([whichTable isEqualToString:@"modify"]){
        if([array3[8] isEqualToString:@"1"]){
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
            UIColor *color = [UIColor whiteColor]; // select needed color
            NSString *string = @"Already Equipped";
            NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
            NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
            [alert setValue:attrStr forKey:@"attributedMessage"];
            UIVisualEffect *blurEffect;
            blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert class]]] setEffect:blurEffect];
            [alert addAction:dismiss];
            [self presentViewController:alert animated:YES completion:nil];
            
        }else {
            
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
    }
    else if([whichTable isEqualToString:@"equipment"]){
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
  //      UIImage *assets = [tech objectAtIndex:indexPath.row];
        NSLog(@"%@", items);
        if(array2.count-1>indexPath.row){
            NSString *items = [array2 objectAtIndex:indexPath.row];
            array3 = [items componentsSeparatedByString: @","];
            cell.textLabel.text =  array3[0];
            cell.detailTextLabel.text = array3[3];
            NSString *type;// = array3[1];
            if([array3[3] isEqualToString:@"computer"]){
                type = @"- Motherboard";
                if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
                if([array3[1] isEqualToString:@"12"]) cell.imageView.image=[UIImage imageNamed:@"computer_blue.png"];
                if([array3[1] isEqualToString:@"21"]) cell.imageView.image=[UIImage imageNamed:@"computer_green.png"];
            }if([array3[3] isEqualToString:@"cpu"]){
                type = @"- CPU";
                if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                if([array3[1] isEqualToString:@"12"]) cell.imageView.image=[UIImage imageNamed:@"cpu_blue.png"];
                if([array3[1] isEqualToString:@"18"]) cell.imageView.image=[UIImage imageNamed:@"cpu_green.png"];
            }if([array3[3] isEqualToString:@"mod"]){
                type = @"- Generic Mod";
                if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
                if([array3[1] isEqualToString:@"6"]) cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
                if([array3[1] isEqualToString:@"9"]) cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
            }
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
        cell.textLabel.text =  [[NSString alloc] initWithFormat:@"%@%@", array3[0], equipped];
        cell.detailTextLabel.text = array3[3];
        NSString *type;// = array3[1];
        if([array3[3] isEqualToString:@"computer"]){
            type = @"- Motherboard";
            if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
            if([array3[1] isEqualToString:@"12"]) cell.imageView.image=[UIImage imageNamed:@"computer_blue.png"];
            if([array3[1] isEqualToString:@"21"]) cell.imageView.image=[UIImage imageNamed:@"computer_green.png"];
        }if([array3[3] isEqualToString:@"cpu"]){
            type = @"- CPU";
            if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
            if([array3[1] isEqualToString:@"12"]) cell.imageView.image=[UIImage imageNamed:@"cpu_blue.png"];
            if([array3[1] isEqualToString:@"18"]) cell.imageView.image=[UIImage imageNamed:@"cpu_green.png"];
        }if([array3[3] isEqualToString:@"mod"]){
            type = @"- Generic Mod";
            if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
            if([array3[1] isEqualToString:@"6"]) cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
            if([array3[1] isEqualToString:@"9"]) cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
        }
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
        if([array3[3] isEqualToString:@"computer"]){
            type = @"- Motherboard";
            if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
            if([array3[1] isEqualToString:@"12"]) cell.imageView.image=[UIImage imageNamed:@"computer_blue.png"];
            if([array3[1] isEqualToString:@"21"]) cell.imageView.image=[UIImage imageNamed:@"computer_green.png"];
        }if([array3[3] isEqualToString:@"cpu"]){
            type = @"- CPU";
            if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
            if([array3[1] isEqualToString:@"12"]) cell.imageView.image=[UIImage imageNamed:@"cpu_blue.png"];
            if([array3[1] isEqualToString:@"18"]) cell.imageView.image=[UIImage imageNamed:@"cpu_green.png"];
        }if([array3[3] isEqualToString:@"mod"]){
            type = @"- Generic Mod";
            if([array3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
            if([array3[1] isEqualToString:@"6"]) cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
            if([array3[1] isEqualToString:@"9"]) cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
        }
        //   cell.imageView.image = assets;
    }

    
    

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
