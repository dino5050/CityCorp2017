//
//  Market.m
//  CityCorp
//
//  Created by Dino Martinez on 2/6/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Market.h"
#import "Button.h"
#import "Functions.h"
#import "DLRadioButton.h"
@import GoogleMobileAds;

@interface Market () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) GADBannerView *bannerView;
@property (weak, nonatomic) IBOutlet DLRadioButton *waterButton;

@end

@implementation Market

static UITableView *market;
static NSArray *items;
static NSArray *items3;
static NSString *whichTable;
static UIView *panel;
static NSString *username3;
static NSUserDefaults *preferences3;
static NSString *get_items;
static NSString * jobtype;
static NSNumber * identified;
static NSString *action1;
static int price2;
static NSString *whichMarket;
int identified2;
//static int counts;
static Functions *ccmarket1;
static Functions *blackmarket1;
static Functions *inventory1;
static UIAlertController * alert2;
static UIAlertAction* dismiss;
static int iD;
static Functions *get_credits;
static UITextView *amount;
static Button *add1,*add2;
static UITextView *quantity1; static UITextView *quantity2; static UITextView *quantity3; static UITextView *quantity4; static UITextView *quantity5;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    Button* back2 = [[Button alloc] init];
    back2.name = @"back2";
    [self.view addSubview:[back2 back: CGRectMake(10, 40, 50, 50.0)]];
    
    Button* blackmarket = [[Button alloc] init];
    blackmarket.name = @"blackmarket";
    [self.view addSubview:[blackmarket button2: CGRectMake(10+52, 40, 117, 50.0)]];
    
    Button* jobs = [[Button alloc] init];
    jobs.name = @"jobs_market";
    [self.view addSubview:[jobs button2: CGRectMake(10+52+119, 40, 115, 50.0)]];
    
    Button* space = [[Button alloc] init];
    space.name = @"";
    [self.view addSubview:[space button2: CGRectMake(10+52+119+117, 40, screenSize.width-(10+52+119+117+10), 50.0)]];
    /*   Button* space = [[Button alloc] init];
     space.name = @"";
     [self.view addSubview:[space button2: CGRectMake(10+87+67+70+70, 40, screenSize.width-(10+87+67+70+70+10), 50.0)]];
     */
    if(screenSize.height >= 812) panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50-50)];
    else panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50)];
    [panel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    panel.layer.borderWidth = 2.0f;
    panel.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [self.view addSubview:panel];
}
-(void)viewDidAppear:(BOOL)animated{
/*    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(5, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(5+55+1, 60*6, 55, 50.0)]]; */
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichMarket = @"ccmarket";
    whichTable = @"ccmarket";
    username3 = [preferences3 stringForKey:@"username"];
    ccmarket1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [ccmarket1 httprequest:@"market,id" :[NSString stringWithFormat:@"%@,%@", whichTable, [NSString stringWithFormat:@"%d",iD]] :@"market.php"];
        items = [get_items componentsSeparatedByString: @"|"];
/*       if([items count] > 5) counts = [items[5] intValue];
        else counts = 0; */
    }@catch(NSException *error){}
    [self configureTableview];
    
/*    if(items.count>1){
        add1 = [[Button alloc] init];
        add1.name = @"add1";
        [panel addSubview:[add1 add: CGRectMake(panel.frame.size.width-25-5, 50+5, 25, 25)]];
        
        Button *subtract1 = [[Button alloc] init];
        subtract1.name = @"subtract1";
        [panel addSubview:[subtract1 subtract: CGRectMake(panel.frame.size.width-25-5, 50+25+1+5, 25, 25)]];
        
        quantity1 = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-25-5-30, 50+10, 30, 30)];
        quantity1.text = @" 1";
        quantity1.backgroundColor = [UIColor blackColor];
        quantity1.font = [UIFont fontWithName:@"Arial" size:17]; //rgb(30,144,255)
        quantity1.textColor = [UIColor whiteColor];
        quantity1.editable = NO;
        [panel addSubview:quantity1];
        NSLog(@"|||%d|||", [quantity1.text intValue]);
    }
    
    UITextView *quantity_text = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-25-5-35, 50-25, 75, 23)];
    quantity_text.text = @"Quantity";
    quantity_text.backgroundColor = [UIColor blackColor];
    quantity_text.font = [UIFont fontWithName:@"Arial" size:12]; //rgb(30,144,255)
    quantity_text.textColor = [UIColor whiteColor];
    quantity_text.editable = NO;
    [panel addSubview:quantity_text];
    */
    UITextView *credits = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-185, -3, 85, 18)];
    credits.text = @"Credits: ";
    credits.backgroundColor = [UIColor blackColor];
    credits.font = [UIFont fontWithName:@"Abduction" size:10]; //rgb(30,144,255)
    credits.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    credits.editable = NO;
    [panel addSubview:credits];
    get_credits = [[Functions alloc] init];
    @try{get_items = [get_credits httprequest:@"name" :[NSString stringWithFormat:@"%@",username3] :@"credits.php"];
    }@catch(NSException *error){}
    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
    [fmt setMaximumFractionDigits:0]; // to avoid any decimal
    NSInteger value = [get_items intValue];
    NSString *result = [fmt stringFromNumber:@(value)];
    amount = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-110, -5, 110, 19)];
    amount.text = [[NSString alloc] initWithFormat:@"₡%@",result];
    amount.backgroundColor = [UIColor blackColor];
    amount.font = [UIFont fontWithName:@"Arial" size:12];
    amount.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    amount.editable = NO;
    [panel addSubview:amount];
    
    UITextView *ccmarket3 = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    ccmarket3.text = @"CityCorp  Market";
    ccmarket3.backgroundColor = [UIColor blackColor];
    ccmarket3.font = [UIFont fontWithName:@"Abduction" size:14];
    ccmarket3.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    ccmarket3.editable = NO;
    [panel addSubview:ccmarket3];
    
    Button *sell = [[Button alloc] init];
    sell.name = @"sell_to_ccmarket";
    [panel addSubview:[sell button2: CGRectMake(5, 60*6, 200, 50.0)]];
 //   sell to ccmarket button
//    Button *sell = [[Button alloc] init];
//    sell.name = @"sell";
//    [panel addSubview:[sell button2: CGRectMake(panel.frame.size.width-50-9, 29, 55, 45.0)]];
    
    Button *jobOrders = [[Button alloc] init];
    jobOrders.name = @"job_listing";
//    [panel addSubview:[jobOrders button2: CGRectMake(panel.frame.size.width-115-5, 60+55, 115, 50.0)]];
    
    self.bannerView = [[GADBannerView alloc]
                       initWithAdSize:kGADAdSizeBanner];
    
    [self addBannerViewToView:_bannerView];
    
    self.bannerView.adUnitID = @"ca-app-pub-3188229665332758/3829260800";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)blackmarket{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
 /*   self.waterButton.multipleSelectionEnabled = YES;
    // set selection states programmatically
    for (DLRadioButton *radioButton in self.waterButton.otherButtons) {
        radioButton.selected = YES;
    }
    
    // programmatically add button
    // first button
    CGRect frame = CGRectMake(self.view.frame.size.width-100+20, 50, 262, 17);
    DLRadioButton *exploits = [self createRadioButtonWithFrame:frame
                                                                 Title:@"Exploits"
                                                                 Color:[UIColor whiteColor]];
    exploits.selected = YES;
    // other buttons
    NSArray *colorNames = @[@"MBs", @"CPUs", @"Mods"];
    NSArray *colors = @[[UIColor whiteColor], [UIColor whiteColor], [UIColor whiteColor]];
    NSInteger i = 0;
    NSMutableArray *otherButtons = [NSMutableArray new];
    for (UIColor *color in colors) {
        CGRect frame = CGRectMake(self.view.frame.size.width - 100+20, 80 + 30 * i, 262, 17);
        DLRadioButton *radioButton = [self createRadioButtonWithFrame:frame
                                                                Title:[colorNames[i] stringByAppendingString:@""]
                                                                Color:color];

        [otherButtons addObject:radioButton];
        i++;
    }
    
    exploits.otherButtons = otherButtons;
*/    // set selection state programmatically
  //  exploits.otherButtons[1].selected = YES;
    
    //UPDATE TABLE AFTER PURCHASE !!!!!!!!!!!!!!!!
    whichMarket = @"blackmarket";
    UITextView *empty = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width/2-270/2, 70, 220, 25)];
    empty.text = @"No items for sale";
    empty.backgroundColor = [UIColor blackColor];
    empty.font = [UIFont fontWithName:@"Abduction" size:14];
    empty.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    empty.editable = NO;
    [panel addSubview:empty];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"blackmarket";
    username3 = [preferences3 stringForKey:@"username"];
    blackmarket1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [blackmarket1 httprequest:@"market,id,server" :[NSString stringWithFormat:@"%@,%@,%ld", whichTable, [NSString stringWithFormat:@"%d",iD],[preferences3 integerForKey:@"server"]] :@"market.php"];
        items = [get_items componentsSeparatedByString: @"|"];
        /*       if([items count] > 5) counts = [items[5] intValue];
         else counts = 0; */
    }@catch(NSException *error){}
//    [market reloadData];
    [self configureTableview];
    
    UITextView *credits = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-185, -3, 85, 18)];
    credits.text = @"Credits: ";
    credits.backgroundColor = [UIColor blackColor];
    credits.font = [UIFont fontWithName:@"Abduction" size:10]; //rgb(30,144,255)
    credits.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    credits.editable = NO;
    [panel addSubview:credits];
    
    get_credits = [[Functions alloc] init];
    @try{get_items = [get_credits httprequest:@"name" :[NSString stringWithFormat:@"%@",username3] :@"credits.php"];
    }@catch(NSException *error){}
    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
    [fmt setMaximumFractionDigits:0]; // to avoid any decimal
    NSInteger value = [get_items intValue];
    NSString *result = [fmt stringFromNumber:@(value)];
    UITextView *amount = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-110, -5, 110, 19)];
    amount.text = [[NSString alloc] initWithFormat:@"₡%@",result];
    amount.backgroundColor = [UIColor blackColor];
    amount.font = [UIFont fontWithName:@"Arial" size:12];
    amount.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    amount.editable = NO;
    [panel addSubview:amount];
    
    UITextView *blackmarket3 = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    blackmarket3.text = @"Black Market";
    blackmarket3.backgroundColor = [UIColor blackColor];
    blackmarket3.font = [UIFont fontWithName:@"Abduction" size:14];
    blackmarket3.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    blackmarket3.editable = NO;
    [panel addSubview:blackmarket3];
    
    Button *sell = [[Button alloc] init];
    sell.name = @"sell_to_blackmarket";
    [panel addSubview:[sell button2: CGRectMake(5, 60*6, 200, 50.0)]];
    
    Button *jobOrders = [[Button alloc] init];
    jobOrders.name = @"job_listing";
    //    [panel addSubview:[jobOrders button2: CGRectMake(panel.frame.size.width-115-5, 60+55, 115, 50.0)]];
    Button *back = [[Button alloc] init];
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
}
-(void)jobs_market{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *credits = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-185, -3, 85, 18)];
    credits.text = @"Credits: ";
    credits.backgroundColor = [UIColor blackColor];
    credits.font = [UIFont fontWithName:@"Abduction" size:10]; //rgb(30,144,255)
    credits.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    credits.editable = NO;
    [panel addSubview:credits];
    get_credits = [[Functions alloc] init];
    @try{get_items = [get_credits httprequest:@"name" :[NSString stringWithFormat:@"%@",username3] :@"credits.php"];
    }@catch(NSException *error){}
    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
    [fmt setMaximumFractionDigits:0]; // to avoid any decimal
    NSInteger value = [get_items intValue];
    NSString *result = [fmt stringFromNumber:@(value)];
    amount = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-110, -5, 110, 19)];
    amount.text = [[NSString alloc] initWithFormat:@"₡%@",result];
    amount.backgroundColor = [UIColor blackColor];
    amount.font = [UIFont fontWithName:@"Arial" size:12];
    amount.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    amount.editable = NO;
    [panel addSubview:amount];
 /*   Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(2, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(1+55+1, 60*6, 55, 50.0)]]; */
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"jobsmarket";
    username3 = [preferences3 stringForKey:@"username"];
    blackmarket1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [blackmarket1 httprequest:@"market,id" :[NSString stringWithFormat:@"%@,%@", whichTable, [NSString stringWithFormat:@"%d",iD]] :@"market.php"];
        items = [get_items componentsSeparatedByString: @"|"];
        /*       if([items count] > 5) counts = [items[5] intValue];
         else counts = 0; */
    }@catch(NSException *error){}
    //    [market reloadData];
    [self configureTableview];
    
    UITextView *blackmarket3 = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    blackmarket3.text = @"Jobs Market";
    blackmarket3.backgroundColor = [UIColor blackColor];
    blackmarket3.font = [UIFont fontWithName:@"Abduction" size:14];
    blackmarket3.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    blackmarket3.editable = NO;
    [panel addSubview:blackmarket3];
    
    Button *jobOrders = [[Button alloc] init];
    jobOrders.name = @"job_listing";
    //    [panel addSubview:[jobOrders button2: CGRectMake(panel.frame.size.width-115-5, 60+55, 115, 50.0)]];
    Button *back = [[Button alloc] init];
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
}
-(void)sell_to_blackmarket{
    [self sell_to_ccmarket];
    whichMarket = @"blackmarket";
}
-(void)sell_to_ccmarket{
    whichMarket = @"ccmarket";
    UITextView *credits = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-185, -3, 85, 18)];
    credits.text = @"Credits: ";
    credits.backgroundColor = [UIColor blackColor];
    credits.font = [UIFont fontWithName:@"Abduction" size:10]; //rgb(30,144,255)
    credits.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    credits.editable = NO;
    [panel addSubview:credits];
    get_credits = [[Functions alloc] init];
    @try{get_items = [get_credits httprequest:@"name" :[NSString stringWithFormat:@"%@",username3] :@"credits.php"];
    }@catch(NSException *error){}
    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
    [fmt setMaximumFractionDigits:0]; // to avoid any decimal
    NSInteger value = [get_items intValue];
    NSString *result = [fmt stringFromNumber:@(value)];
    amount = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-110, -5, 110, 19)];
    amount.text = [[NSString alloc] initWithFormat:@"₡%@",result];
    amount.backgroundColor = [UIColor blackColor];
    amount.font = [UIFont fontWithName:@"Arial" size:12];
    amount.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    amount.editable = NO;
    [panel addSubview:amount];
    
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *inventory = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    inventory.text = @"Items to sell";
    inventory.backgroundColor = [UIColor blackColor];
    inventory.font = [UIFont fontWithName:@"Abduction" size:14];
    inventory.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    inventory.editable = NO;
    [panel addSubview:inventory];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"inventory";
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [inventory1 httprequest:@"name,id,menu" :[NSString stringWithFormat:@"%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],whichTable] :@"mainmenu.php"];
        items = [get_items componentsSeparatedByString: @"|"];
        /*       if([items count] > 5) counts = [items[5] intValue];
         else counts = 0; */
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
-(void)jobs: (NSString *)type: (NSNumber *) identified{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UITextView *inventory = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    inventory.text = @"Choose item";
    inventory.backgroundColor = [UIColor blackColor];
    inventory.font = [UIFont fontWithName:@"Abduction" size:14];
    inventory.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    inventory.editable = NO;
    [panel addSubview:inventory];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"jobs";
    username3 = [preferences3 stringForKey:@"username"];
    inventory1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [inventory1 httprequest:@"name,menu,type,identified" :[NSString stringWithFormat:@"%@,%@,%@,%d",username3,whichTable,type,[identified intValue]] :@"jobs.php"];
        items = [get_items componentsSeparatedByString: @"|"];
        /*       if([items count] > 5) counts = [items[5] intValue];
         else counts = 0; */
    }@catch(NSException *error){}
    UITextView *credits = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-185, -3, 85, 18)];
    credits.text = @"Credits: ";
    credits.backgroundColor = [UIColor blackColor];
    credits.font = [UIFont fontWithName:@"Abduction" size:10]; //rgb(30,144,255)
    credits.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    credits.editable = NO;
    [panel addSubview:credits];
    
    get_credits = [[Functions alloc] init];
    @try{get_items = [get_credits httprequest:@"name" :[NSString stringWithFormat:@"%@",username3] :@"credits.php"];
    }@catch(NSException *error){}
    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
    [fmt setMaximumFractionDigits:0]; // to avoid any decimal
    NSInteger value = [get_items intValue];
    NSString *result = [fmt stringFromNumber:@(value)];
    UITextView *amount = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-110, -5, 110, 19)];
    amount.text = [[NSString alloc] initWithFormat:@"₡%@",result];
    amount.backgroundColor = [UIColor blackColor];
    amount.font = [UIFont fontWithName:@"Arial" size:12];
    amount.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    amount.editable = NO;
    [panel addSubview:amount];
    
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
-(void)back2{
    [self dismissViewControllerAnimated:false completion:nil];
}
-(void)back{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    //  items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"ccmarket";
    username3 = [preferences3 stringForKey:@"username"];
    ccmarket1 = [[Functions alloc] init];
    iD = 0;
    @try{get_items = [ccmarket1 httprequest:@"market,id" :[NSString stringWithFormat:@"%@,%@", whichTable, [NSString stringWithFormat:@"%d",iD]] :@"market.php"];
        items = [get_items componentsSeparatedByString: @"|"];
        /*       if([items count] > 5) counts = [items[5] intValue];
         else counts = 0; */
    }@catch(NSException *error){}
    [self configureTableview];
    
    UITextView *credits = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-185, -3, 85, 18)];
    credits.text = @"Credits: ";
    credits.backgroundColor = [UIColor blackColor];
    credits.font = [UIFont fontWithName:@"Abduction" size:10]; //rgb(30,144,255)
    credits.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    credits.editable = NO;
    [panel addSubview:credits];
    get_credits = [[Functions alloc] init];
    @try{get_items = [get_credits httprequest:@"name" :[NSString stringWithFormat:@"%@",username3] :@"credits.php"];
    }@catch(NSException *error){}
    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
    [fmt setMaximumFractionDigits:0]; // to avoid any decimal
    NSInteger value = [get_items intValue];
    NSString *result = [fmt stringFromNumber:@(value)];
    amount = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-110, -5, 110, 19)];
    amount.text = [[NSString alloc] initWithFormat:@"₡%@",result];
    amount.backgroundColor = [UIColor blackColor];
    amount.font = [UIFont fontWithName:@"Arial" size:12];
    amount.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
    amount.editable = NO;
    [panel addSubview:amount];
    
    UITextView *ccmarket3 = [[UITextView alloc] initWithFrame:CGRectMake(5, 20, 215, 25)];
    ccmarket3.text = @"CityCorp  Market";
    ccmarket3.backgroundColor = [UIColor blackColor];
    ccmarket3.font = [UIFont fontWithName:@"Abduction" size:14];
    ccmarket3.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    ccmarket3.editable = NO;
    [panel addSubview:ccmarket3];
    
    Button *sell = [[Button alloc] init];
    sell.name = @"sell_to_ccmarket";
    [panel addSubview:[sell button2: CGRectMake(5, 60*6, 200, 50.0)]];
    //   sell to ccmarket button
    //    Button *sell = [[Button alloc] init];
    //    sell.name = @"sell";
    //    [panel addSubview:[sell button2: CGRectMake(panel.frame.size.width-50-9, 29, 55, 45.0)]];
    
    Button *jobOrders = [[Button alloc] init];
    jobOrders.name = @"job_listing";
    //    [panel addSubview:[jobOrders button2: CGRectMake(panel.frame.size.width-115-5, 60+55, 115, 50.0)]];
}
-(void)back_{
    [self jobs_market];
}
-(void)add1{
    if([quantity1.text intValue]<99){
        if([quantity1.text intValue]<9) quantity1.text = [NSString stringWithFormat:@" %d",[quantity1.text intValue]+1];
        else quantity1.text = [NSString stringWithFormat:@"%d",[quantity1.text intValue]+1];
    }
}
-(void)subtract1{
    if([quantity1.text intValue]>1){
        if([quantity1.text intValue]<=10) quantity1.text = [NSString stringWithFormat:@" %d",[quantity1.text intValue]-1];
        else quantity1.text = [NSString stringWithFormat:@"%d",[quantity1.text intValue]-1];
    }
}
/*-(void)next{
    if(iD<counts-5){
        iD = iD + 5;
        if(![whichTable isEqualToString:@"inventory"]){
            @try{get_items = [ccmarket1 httprequest:@"market,id" :[NSString stringWithFormat:@"%@,%@", whichTable, [NSString stringWithFormat:@"%d",iD]] :@"market.php"];
            items = [get_items componentsSeparatedByString: @"|"];
                       if([items count] > 5) counts = [items[5] intValue];
                 else counts = 0;
            }@catch(NSException *error){}
            [market removeFromSuperview];
            [market reloadData];
            [self configureTableview];
            
        }else{
            @try{get_items = [inventory1 httprequest:@"name,id,menu" :[NSString stringWithFormat:@"%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],whichTable] :@"mainmenu.php"];
            items = [get_items componentsSeparatedByString: @"|"];
                       if([items count] > 5) counts = [items[5] intValue];
                 else counts = 0;
            }@catch(NSException *error){}
            [market removeFromSuperview];
            [market reloadData];
            [self configureTableview];
            
        }
        
    }

}
-(void)previous{
    if(iD >= 5){
        iD = iD - 5;
        if(![whichTable isEqualToString:@"inventory"]){@try{get_items = [ccmarket1 httprequest:@"market,id" :[NSString stringWithFormat:@"%@,%@", whichTable, [NSString stringWithFormat:@"%d",iD]] :@"market.php"];
            items = [get_items componentsSeparatedByString: @"|"];
                   if([items count] > 5) counts = [items[5] intValue];
             else counts = 0;
            }@catch(NSException *error){}
            [market removeFromSuperview];
            [market reloadData];
            [self configureTableview];
        }else{
            @try{get_items = [inventory1 httprequest:@"name,id,menu" :[NSString stringWithFormat:@"%@,%@,%@",username3, [NSString stringWithFormat:@"%d",iD],whichTable] :@"mainmenu.php"];
                items = [get_items componentsSeparatedByString: @"|"];
                       if([items count] > 5) counts = [items[5] intValue];
                 else counts = 0;
            }@catch(NSException *error){}
            [market removeFromSuperview];
            [market reloadData];
            [self configureTableview];
        }
    }

} */
-(int)price: (NSNumber *)level: (NSNumber *) identified: (NSString *) type: (NSString *) action{
    int price = 0;
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *profession = [preferences3 stringForKey:@"profession"];
    if([action isEqualToString:@"Execute"] || [action isEqualToString:@"Construct"]){
        if([type isEqualToString:@"blueprint"]){
            if([identified intValue] == 0){
                if([profession isEqualToString:@"researcher"]) price = 0;
                else price = pow([level intValue],2);
            }else {
                if([profession isEqualToString:@"constructor"]) price = 0;
                else price = pow([level intValue],2)*3;
            }
        }else if([type isEqualToString:@"exploit"]){
            if([profession isEqualToString:@"hacker"]) price = 0;
            else price = pow([level intValue],5)*5;
        }
    }
    else if([type isEqualToString:@"computer"]){
        price = pow([level intValue],2)*30;
    }else if([type isEqualToString:@"cpu"]){
        price = pow([level intValue],2)*10;
    }else if([type isEqualToString:@"mod"]){
        price = pow([level intValue],2)*10;
    }else if([type isEqualToString:@"blueprint"]){
        if([identified intValue] == 0) price = pow([level intValue],2);
        else price = pow([level intValue],2)*5;
    }else if([type isEqualToString:@"exploit"]){
        if([identified intValue] == 0) price = pow([level intValue],2)*10;
        else price = pow([level intValue],5)*10;
    }
    if([whichMarket isEqualToString:@"ccmarket"] && [[preferences3 stringForKey:@"faction"] isEqualToString:@"statists"] && [action1 isEqualToString:@"Buy"]) price2 = price2 - price2*0.15;
    else if([whichMarket isEqualToString:@"ccmarket"] && [[preferences3 stringForKey:@"faction"] isEqualToString:@"globalists"] && [action1 isEqualToString:@"Sell"]) price2 = price2*1.15;
    else if([whichMarket isEqualToString:@"blackmarket"] && [[preferences3 stringForKey:@"faction"] isEqualToString:@"capitalists"] && [action1 isEqualToString:@"Sell"]) price2 = price2*1.05;
    return price;
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
    
 //   if([whichTable isEqualToString:@"ccmarket"]){
    market = [[UITableView alloc] init];\
    int rows;
    if([whichTable isEqualToString:@"jobsmarket"]) rows = 3;
    else rows = 5;
        market.frame = CGRectMake(5, 50, 235, rows*60-10);
     //   market.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //    [market.layer setMasksToBounds:YES];
   //     [layer setCornerRadius: 4.0];
        market.layer.borderWidth = 2.0f;
        market.layer.borderColor = [UIColor blueColor].CGColor;
        market.layer.backgroundColor = [UIColor blackColor].CGColor;
        market.backgroundColor = [UIColor blackColor];
        market.delegate = self;
        market.dataSource = self;
        
        [panel addSubview:market];
/*    }else if([whichTable isEqualToString:@"inventory"]){ market = [[UITableView alloc] init];
        market.frame = CGRectMake(5, 50, 235, (items.count-1)*60);
        //   market.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        //    [market.layer setMasksToBounds:YES];
        //     [layer setCornerRadius: 4.0];
        market.layer.borderWidth = 2.0f;
        market.layer.borderColor = [UIColor blueColor].CGColor;
        market.layer.backgroundColor = [UIColor blackColor].CGColor;
        market.delegate = self;
        market.dataSource = self;
        
        [panel addSubview:market];
    } */
    
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
    return items.count-1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"Number: %@", [NSString stringWithFormat: @"%ld",indexPath.row]);
    NSLog(@"title of cell %@", [items objectAtIndex:indexPath.row]);
    NSString *items2 = [items objectAtIndex:indexPath.row];
    items3 = [items2 componentsSeparatedByString: @","];
    
    if([whichTable isEqualToString:@"jobsmarket"]){
        
        if([items3[1] isEqualToString:@"hacker"]) { jobtype = @"exploit"; identified = [NSNumber numberWithInt:0];}
        else if([items3[1] isEqualToString:@"researcher"]) { jobtype = @"blueprint"; identified = [NSNumber numberWithInt:0];}
        else if([items3[1] isEqualToString:@"constructor"]) {
            jobtype = @"blueprint"; identified = [NSNumber numberWithInt:1]; identified2=1;}
        [self jobs:jobtype:identified];
    }else if([items3[8] intValue] == 1 && [whichTable isEqualToString:@"inventory"]){
        
            alert2=   [UIAlertController
                       alertControllerWithTitle:@""
                       message:@""
                       preferredStyle:UIAlertControllerStyleAlert];
            dismiss = [UIAlertAction
                       actionWithTitle:@"Dismiss"
                       style:UIAlertActionStyleDefault
                       handler:^(UIAlertAction * action){
                           [alert2 dismissViewControllerAnimated:YES completion:nil];
                       }];
            UIColor *color = [UIColor orangeColor]; // select needed color
            NSString *string = @"Can't sell an equipped item";
            
            NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
            NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
            [alert2 setValue:attrStr forKey:@"attributedMessage"];
            [alert2 addAction:dismiss];
            [self presentViewController:alert2 animated:YES completion:nil];
            UIVisualEffect *blurEffect;
            blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert2 class]]] setEffect:blurEffect];
    }else{
        if([whichTable isEqualToString:@"inventory"]) action1 = @"Sell";
        else if([whichTable isEqualToString:@"jobs"] && [jobtype isEqualToString:@"blueprint"] && identified2 == 1)  action1 = @"Construct";
        else if([whichTable isEqualToString:@"jobs"])  action1 = @"Execute";
        else action1 = @"Buy";
        identified2 = 0;
        preferences3 = [NSUserDefaults standardUserDefaults];
        NSString *username = [preferences3 stringForKey:@"username"];
        NSString *item_id;
        //          int price2;
        NSNumber *level = [NSNumber numberWithInt:[items3[1] intValue]];
        if(![action1 isEqualToString:@"Buy"])
        {   NSNumber *unidentified = [NSNumber numberWithInt:[items3[11] intValue]];
            //NSNumber *)level: (NSNumber *) identified: (NSString *) type: (NSString *) action
            if([items3[10] isEqualToString:@"blueprint"] && ![action1 isEqualToString:@"Buy"]){ price2 = [self price:level:unidentified:@"blueprint":action1];
                item_id = items3[9];
            }
            else if(![action1 isEqualToString:@"Buy"]){ price2 = [self price:level:unidentified:items3[3]:action1];
                item_id = items3[9];
            }
        }
        else { price2 = [items3[7] intValue];
            item_id = items3[0];
        }
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@""
                                  message:@""
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:action1
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             
                             Functions *buy = [[Functions alloc] init];
                             
                             NSString *transaction = [buy httprequest:@"name,item,cost,market,action" :[NSString stringWithFormat:@"%@,%@,%d,%@,%@", username, item_id, price2,whichTable,action1] :@"buy.php"];
                             
                             @try{get_items = [get_credits httprequest:@"name" :[NSString stringWithFormat:@"%@",username3] :@"credits.php"];
                             }@catch(NSException *error){}
                             
                             
                             NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
                             [fmt setNumberStyle:NSNumberFormatterDecimalStyle]; // to get commas (or locale equivalent)
                             [fmt setMaximumFractionDigits:0]; // to avoid any decimal
                             NSInteger value = [get_items intValue];
                             NSString *result = [fmt stringFromNumber:@(value)];
                             amount = [[UITextView alloc] initWithFrame:CGRectMake(panel.frame.size.width-110, -5, 110, 19)];
                             amount.text = [[NSString alloc] initWithFormat:@"₡%@",result];
                             amount.backgroundColor = [UIColor blackColor];
                             amount.font = [UIFont fontWithName:@"Arial" size:12];
                             amount.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:255];
                             amount.editable = NO;
                             [amount removeFromSuperview];
                             [panel addSubview:amount];
   //                          UPDATE CREDITS AND MARKET TABLE
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             if([action1 isEqualToString:@"Sell"])[self sell_to_ccmarket];
                             if([action1 isEqualToString:@"Execute"] || [action1 isEqualToString:@"Construct"]) [self jobs:jobtype:identified];
                             if([transaction isEqualToString:@"insufficient"]){
                             alert2=   [UIAlertController
                                                               alertControllerWithTitle:@""
                                                               message:@""
                                                               preferredStyle:UIAlertControllerStyleAlert];
                                 dismiss = [UIAlertAction
                                                      actionWithTitle:@"Dismiss"
                                                      style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action){
                                                          [alert2 dismissViewControllerAnimated:YES completion:nil];
                                                      }];
                                 UIColor *color = [UIColor orangeColor]; // select needed color
                                 NSString *string = @"Insufficient Funds";
                                 
                                 NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
                                 NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
                                 [alert2 setValue:attrStr forKey:@"attributedMessage"];
                                 [alert2 addAction:dismiss];
                                 [self presentViewController:alert2 animated:YES completion:nil];
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }else [alert dismissViewControllerAnimated:YES completion:nil];
                            
    }];
                         
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
                             
 /*   UIView *subview = alert.view.subviews.firstObject;
    UIView *alertContentView =  subview.subviews.firstObject;
    alertContentView.backgroundColor = [UIColor blackColor];
  */
        
        
        UIColor *color = [UIColor whiteColor]; // select needed color
        NSString *string;
        if([action1 isEqualToString:@"Execute"] || [action1 isEqualToString:@"Construct"]) string = [NSString stringWithFormat:@"Craft the item for ₡%d",price2];
        else if([action1 isEqualToString:@"Sell"]) string = [NSString stringWithFormat:@"Sell the %@ for ₡%d",items3[0],price2];
        else string = [NSString stringWithFormat:@"Buy the %@ for ₡%d",items3[0],price2];
        NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
        [alert setValue:attrStr forKey:@"attributedMessage"];
      
        color = [UIColor orangeColor];
        NSString *string1 = @"Market Order\n";
        NSDictionary *attrs1 = @{ NSForegroundColorAttributeName : color, NSFontAttributeName : [UIFont fontWithName:@"Abduction" size:16]};
        NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString:string1 attributes:attrs1];
        [alert setValue:attrStr1 forKey:@"attributedTitle"];
      
        [alert addAction:ok];
        [alert addAction:cancel];
  
    
 //   UIVisualEffectView.appearance(whenContainedInInstancesOf: [alert.classForCoder() as! UIAppearanceContainer.Type]).effect = UIBlurEffect(style: .dark)
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert class]]] setEffect:blurEffect];
    
//    let attributedString = NSAttributedString(string: "Invalid Name", attributes: [       NSParagraphStyleAttributeName: paragraphStyle,NSFontAttributeName : UIFont.systemFontOfSize(15),NSForegroundColorAttributeName : UIColor.redColor()])
    
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
    
    if([whichTable isEqualToString:@"jobsmarket"]){
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        //     cell.imageView.image = gotoCorp;
        NSString *items2 = [items objectAtIndex:indexPath.row];
        NSArray *items3 = [items2 componentsSeparatedByString: @","];
        NSString *job;
        if([items3[1] isEqualToString:@"hacker"]) job = @"Compile Exploit";
        else if([items3[1] isEqualToString:@"researcher"]) job = @"Research Blueprint";
        else if([items3[1] isEqualToString:@"constructor"]) job = @"Construct Hardware";
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@", job];
        cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%@", items3[0]];
    }else if([whichTable isEqualToString:@"inventory"]){
        
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        //     cell.imageView.image = gotoCorp;
        NSString *items2 = [items objectAtIndex:indexPath.row];
        NSArray *items3 = [items2 componentsSeparatedByString: @","];
        
        NSString *type = [[NSString alloc] init];
        NSString *detail = [[NSString alloc] init];
        if([items3[10] isEqualToString:@"blueprint"] && [items3[11] isEqualToString:@"0"]){
            type = @"Unidentified Blueprint";
            if([items3[1] intValue]>=1 && [items3[1] intValue]<=9){
                cell.imageView.image=[UIImage imageNamed:@"unidentified_bp_bluegreen.png"];
                detail = [NSString stringWithFormat:@""];
            }
            else if([items3[1] intValue]>=10 && [items3[1] intValue]<=18){
                cell.imageView.image=[UIImage imageNamed:@"unidentified_bp_blue.png"];
                detail = [NSString stringWithFormat:@""];
            }
            else if([items3[1] intValue]>=19 && [items3[1] intValue]<=27){
                cell.imageView.image=[UIImage imageNamed:@"unidentified_bp_green.png"];
                detail = [NSString stringWithFormat:@""];
            }
        }
        else if([items3[10] isEqualToString:@"blueprint"]){
            if([items3[3] isEqualToString:@"computer"]){
                type = [NSString stringWithFormat:@"BP Lvl.%@", items3[1]];
                if([items3[1] isEqualToString:@"1"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_bluegreen.png"];
                }
                if([items3[1] isEqualToString:@"3"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_bluegreen.png"];
                }
                if([items3[1] isEqualToString:@"12"] || [items3[1] isEqualToString:@"10"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_blue.png"];
                }
                if([items3[1] isEqualToString:@"21"] || [items3[1] isEqualToString:@"19"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_green.png"];
                }
            }else if([items3[3] isEqualToString:@"cpu"]){
                type = [NSString stringWithFormat:@"BP Lvl.%@", items3[1]];
                if([items3[1] isEqualToString:@"1"]){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +3"];
                }
                if([items3[1] intValue]>=3 && [items3[1] intValue]<=9){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +10"];
                }
                if([items3[1] intValue]>=10 && [items3[1] intValue]<=18){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_blue.png"];
                    detail = [NSString stringWithFormat:@"Power +20"];
                }
                if([items3[1] intValue]>=19 && [items3[1] intValue]<=27){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_green.png"];
                    detail = [NSString stringWithFormat:@"Power +30"];
                }
            }else if([items3[3] isEqualToString:@"mod"]){
                type = [NSString stringWithFormat:@"BP Lvl.%@", items3[1]];
                if([items3[1] intValue] >= 1 && [items3[1] intValue] <= 9){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_bluegreen.png"];
                    if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+1 %@ speed",items3[4]];
                    else detail = [NSString stringWithFormat:@"+1 %@ %@",items3[4],items3[5]];
                }
                if([items3[1] intValue] >= 12 && [items3[1] intValue] <= 18){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_blue.png"];
                    if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+2 %@ speed",items3[4]];
                    else detail = [NSString stringWithFormat:@"+2 %@ %@",items3[4],items3[5]];
                }
                if([items3[1] intValue] >= 21 && [items3[1] intValue] <= 27){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_green.png"];
                    if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+3 %@ speed",items3[4]];
                    else detail = [NSString stringWithFormat:@"+3 %@ %@",items3[4],items3[5]];
                }
            }
        }
        else if([items3[3] isEqualToString:@"computer"]){
            type = [NSString stringWithFormat:@"Mainboard Lvl.%@", items3[1]];
            detail = [NSString stringWithFormat:@"Slots: %@",items3[7]];
            if([items3[1] isEqualToString:@"1"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
            }
            if([items3[1] isEqualToString:@"3"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
            }
            if([items3[1] isEqualToString:@"12"] || [items3[1] isEqualToString:@"10"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_blue.png"];
            }
            if([items3[1] isEqualToString:@"21"] || [items3[1] isEqualToString:@"19"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_green.png"];
            }
        }else if([items3[3] isEqualToString:@"cpu"]){
            type = [NSString stringWithFormat:@"CPU Lvl.%@", items3[1]];
            if([items3[1] isEqualToString:@"1"]){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"Power +3"];
            }
            if([items3[1] intValue]>=3 && [items3[1] intValue]<=9){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"Power +10"];
            }
            if([items3[1] intValue]>=10 && [items3[1] intValue]<=18){
                cell.imageView.image=[UIImage imageNamed:@"cpu_blue.png"];
                detail = [NSString stringWithFormat:@"Power +20"];
            }
            if([items3[1] intValue]>=19 && [items3[1] intValue]<=27){
                cell.imageView.image=[UIImage imageNamed:@"cpu_green.png"];
                detail = [NSString stringWithFormat:@"Power +30"];
            }
        }else if([items3[3] isEqualToString:@"mod"]){
            type = [NSString stringWithFormat:@"Mod Lvl.%@", items3[1]];
            if([items3[1] intValue] >= 1 && [items3[1] intValue] <= 9){
                cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
                if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+1 %@ speed",items3[4]];
                else detail = [NSString stringWithFormat:@"+1 %@ %@",items3[4],items3[5]];
            }
            if([items3[1] intValue] >= 12 && [items3[1] intValue] <= 18){
                cell.imageView.image=[UIImage imageNamed:@"mod_blue.png"];
                if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+2 %@ speed",items3[4]];
                else detail = [NSString stringWithFormat:@"+2 %@ %@",items3[4],items3[5]];
            }
            if([items3[1] intValue] >= 21 && [items3[1] intValue] <= 27){
                cell.imageView.image=[UIImage imageNamed:@"mod_green.png"];
                if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+3 %@ speed",items3[4]];
                else detail = [NSString stringWithFormat:@"+3 %@ %@",items3[4],items3[5]];
            }
        }else if([items3[3] isEqualToString:@"exploit"]){
            if([items3[11] isEqualToString:@"0"]) type = @"- Uncompiled";
            else type = @"- Compiled";
            if([items3[1] isEqualToString:@"1"]) cell.imageView.image=[UIImage imageNamed:@"exploit_bluegreen.png"];
            if([items3[1] isEqualToString:@"2"]) cell.imageView.image=[UIImage imageNamed:@"exploit_blue.png"];
            if([items3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"exploit_green.png"];
        }
        if([items3[10] isEqualToString:@"blueprint"] && [items3[11] isEqualToString:@"0"]) cell.textLabel.text = type;
        else cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@ %@", items3[0],type];
        cell.detailTextLabel.text = detail;
        
    }else if([whichTable isEqualToString:@"jobs"]){
        
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        //     cell.imageView.image = gotoCorp;
        NSString *items2 = [items objectAtIndex:indexPath.row];
        NSArray *items3 = [items2 componentsSeparatedByString: @","];
        
        NSString *type = [[NSString alloc] init];
        NSString *detail = [[NSString alloc] init];
        if([items3[10] isEqualToString:@"blueprint"] && [items3[11] isEqualToString:@"0"]){
            type = @"Unidentified Blueprint";
            if([items3[1] intValue]>=1 && [items3[1] intValue]<=9){
                cell.imageView.image=[UIImage imageNamed:@"unidentified_bp_bluegreen.png"];
                detail = [NSString stringWithFormat:@""];
            }
            else if([items3[1] intValue]>=10 && [items3[1] intValue]<=18){
                cell.imageView.image=[UIImage imageNamed:@"unidentified_bp_blue.png"];
                detail = [NSString stringWithFormat:@""];
            }
            else if([items3[1] intValue]>=19 && [items3[1] intValue]<=27){
                cell.imageView.image=[UIImage imageNamed:@"unidentified_bp_green.png"];
                detail = [NSString stringWithFormat:@""];
            }
        }
        else if([items3[10] isEqualToString:@"blueprint"]){
            if([items3[3] isEqualToString:@"computer"]){
                type = [NSString stringWithFormat:@"BP Lvl.%@", items3[1]];
                if([items3[1] isEqualToString:@"1"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_bluegreen.png"];
                }
                if([items3[1] isEqualToString:@"3"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_bluegreen.png"];
                }
                if([items3[1] isEqualToString:@"12"] || [items3[1] isEqualToString:@"10"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_blue.png"];
                }
                if([items3[1] isEqualToString:@"21"] || [items3[1] isEqualToString:@"19"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_green.png"];
                }
            }else if([items3[3] isEqualToString:@"cpu"]){
                type = [NSString stringWithFormat:@"BP Lvl.%@", items3[1]];
                if([items3[1] isEqualToString:@"1"]){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +3"];
                }
                if([items3[1] intValue]>=3 && [items3[1] intValue]<=9){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +10"];
                }
                if([items3[1] intValue]>=10 && [items3[1] intValue]<=18){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_blue.png"];
                    detail = [NSString stringWithFormat:@"Power +20"];
                }
                if([items3[1] intValue]>=19 && [items3[1] intValue]<=27){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_green.png"];
                    detail = [NSString stringWithFormat:@"Power +30"];
                }
            }else if([items3[3] isEqualToString:@"mod"]){
                type = [NSString stringWithFormat:@"BP Lvl.%@", items3[1]];
                if([items3[1] intValue] >= 1 && [items3[1] intValue] <= 9){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_bluegreen.png"];
                    if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+1 %@ speed",items3[4]];
                    else detail = [NSString stringWithFormat:@"+1 %@ %@",items3[4],items3[5]];
                }
                if([items3[1] intValue] >= 12 && [items3[1] intValue] <= 18){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_blue.png"];
                    if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+2 %@ speed",items3[4]];
                    else detail = [NSString stringWithFormat:@"+2 %@ %@",items3[4],items3[5]];
                }
                if([items3[1] intValue] >= 21 && [items3[1] intValue] <= 27){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_green.png"];
                    if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+3 %@ speed",items3[4]];
                    else detail = [NSString stringWithFormat:@"+3 %@ %@",items3[4],items3[5]];
                }
            }
        }
        else if([items3[3] isEqualToString:@"computer"]){
            type = [NSString stringWithFormat:@"Mainboard Lvl.%@", items3[1]];
            if([items3[1] isEqualToString:@"3"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
            }
            if([items3[1] isEqualToString:@"12"] || [items3[1] isEqualToString:@"10"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_blue.png"];
            }
            if([items3[1] isEqualToString:@"21"] || [items3[1] isEqualToString:@"19"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_green.png"];
            }
        }else if([items3[3] isEqualToString:@"cpu"]){
            type = [NSString stringWithFormat:@"CPU Lvl.%@", items3[1]];
            if([items3[1] isEqualToString:@"1"]){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"Power +3"];
            }
            if([items3[1] intValue]>=3 && [items3[1] intValue]<=9){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"Power +10"];
            }
            if([items3[1] intValue]>=10 && [items3[1] intValue]<=18){
                cell.imageView.image=[UIImage imageNamed:@"cpu_blue.png"];
                detail = [NSString stringWithFormat:@"Power +20"];
            }
            if([items3[1] intValue]>=19 && [items3[1] intValue]<=27){
                cell.imageView.image=[UIImage imageNamed:@"cpu_green.png"];
                detail = [NSString stringWithFormat:@"Power +30"];
            }
        }else if([items3[3] isEqualToString:@"mod"]){
            type = [NSString stringWithFormat:@"Mod Lvl.%@", items3[1]];
            if([items3[1] intValue] >= 1 && [items3[1] intValue] <= 9){
                cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
                if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+1 %@ speed",items3[4]];
                else detail = [NSString stringWithFormat:@"+1 %@ %@",items3[4],items3[5]];
            }
            if([items3[1] intValue] >= 12 && [items3[1] intValue] <= 18){
                cell.imageView.image=[UIImage imageNamed:@"mod_blue.png"];
                if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+2 %@ speed",items3[4]];
                else detail = [NSString stringWithFormat:@"+2 %@ %@",items3[4],items3[5]];
            }
            if([items3[1] intValue] >= 21 && [items3[1] intValue] <= 27){
                cell.imageView.image=[UIImage imageNamed:@"mod_green.png"];
                if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+3 %@ speed",items3[4]];
                else detail = [NSString stringWithFormat:@"+3 %@ %@",items3[4],items3[5]];
            }
        }else if([items3[3] isEqualToString:@"exploit"]){
            if([items3[11] isEqualToString:@"0"]) type = @"- Uncompiled";
            else type = @"- Compiled";
            if([items3[1] isEqualToString:@"1"]) cell.imageView.image=[UIImage imageNamed:@"exploit_bluegreen.png"];
            if([items3[1] isEqualToString:@"2"]) cell.imageView.image=[UIImage imageNamed:@"exploit_blue.png"];
            if([items3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"exploit_green.png"];
        }
        if([items3[10] isEqualToString:@"blueprint"] && [items3[11] isEqualToString:@"0"]) cell.textLabel.text = type;
        else cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@ %@", items3[0],type];
        cell.detailTextLabel.text = detail;
        
    }
    else{
     //   UIImage *gotoCorp = [UIImage imageNamed:@"goto.png"];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:12];
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
   //     cell.imageView.image = gotoCorp;
        NSString *items2 = [items objectAtIndex:indexPath.row];
        NSArray *items3 = [items2 componentsSeparatedByString: @","];
        
        NSString *type = [[NSString alloc] init];
        NSString *detail = [[NSString alloc] init];
        
        if([items3[10] isEqualToString:@"blueprint"]){
            if([items3[3] isEqualToString:@"computer"]){
                type = [NSString stringWithFormat:@"BP Lvl.%@", items3[1]];
                if([items3[1] isEqualToString:@"1"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_bluegreen.png"];
                }
                if([items3[1] isEqualToString:@"3"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_bluegreen.png"];
                }
                if([items3[1] isEqualToString:@"12"] || [items3[1] isEqualToString:@"10"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_blue.png"];
                }
                if([items3[1] isEqualToString:@"21"] || [items3[1] isEqualToString:@"19"]){
                    cell.imageView.image=[UIImage imageNamed:@"computer_bp_green.png"];
                }
            }else if([items3[3] isEqualToString:@"cpu"]){
                type = [NSString stringWithFormat:@"BP Lvl.%@", items3[1]];
                if([items3[1] isEqualToString:@"1"]){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +3"];
                }
                if([items3[1] intValue]>=3 && [items3[1] intValue]<=9){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_bluegreen.png"];
                    detail = [NSString stringWithFormat:@"Power +10"];
                }
                if([items3[1] intValue]>=10 && [items3[1] intValue]<=18){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_blue.png"];
                    detail = [NSString stringWithFormat:@"Power +20"];
                }
                if([items3[1] intValue]>=19 && [items3[1] intValue]<=27){
                    cell.imageView.image=[UIImage imageNamed:@"cpu_bp_green.png"];
                    detail = [NSString stringWithFormat:@"Power +30"];
                }
            }else if([items3[3] isEqualToString:@"mod"]){
                type = [NSString stringWithFormat:@"BP Lvl.%@", items3[1]];
                if([items3[1] intValue] >= 1 && [items3[1] intValue] <= 9){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_bluegreen.png"];
                    if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+1 %@ speed",items3[4]];
                    else detail = [NSString stringWithFormat:@"+1 %@ %@",items3[4],items3[5]];
                }
                if([items3[1] intValue] >= 12 && [items3[1] intValue] <= 18){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_blue.png"];
                    if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+2 %@ speed",items3[4]];
                    else detail = [NSString stringWithFormat:@"+2 %@ %@",items3[4],items3[5]];
                }
                if([items3[1] intValue] >= 21 && [items3[1] intValue] <= 27){
                    cell.imageView.image=[UIImage imageNamed:@"mod_bp_green.png"];
                    if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"+3 %@ speed",items3[4]];
                    else detail = [NSString stringWithFormat:@"+3 %@ %@",items3[4],items3[5]];
                }
            }
        }
        else if([items3[3] isEqualToString:@"computer"]){
            type = [NSString stringWithFormat:@"Mainboard Lvl.%@", items3[1]];
            if([items3[1] isEqualToString:@"1"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
                detail = [NSString stringWithFormat:@"₡%@",items3[7]];
            }
            if([items3[1] isEqualToString:@"3"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_bluegreen.png"];
                if([items3[1] isEqualToString:@"10"]) detail = [NSString stringWithFormat:@"₡%@",items3[7]];
                else detail = [NSString stringWithFormat:@"₡%@",items3[7]];
            }
            if([items3[1] isEqualToString:@"12"] || [items3[1] isEqualToString:@"10"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_blue.png"];
                if([items3[1] isEqualToString:@"10"]) detail = [NSString stringWithFormat:@"₡%@",items3[7]];
                else detail = [NSString stringWithFormat:@"₡%@",items3[7]];
            }
            if([items3[1] isEqualToString:@"21"] || [items3[1] isEqualToString:@"19"]){
                cell.imageView.image=[UIImage imageNamed:@"computer_green.png"];
                if([items3[1] isEqualToString:@"19"]) detail = [NSString stringWithFormat:@"₡%@",items3[7]];
                else detail = [NSString stringWithFormat:@"₡%@",items3[7]];
            }
        }else if([items3[3] isEqualToString:@"cpu"]){
            type = [NSString stringWithFormat:@"CPU Lvl.%@", items3[1]];
            if([items3[1] isEqualToString:@"1"]){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"₡%@-Speed +10",items3[7]];
            }
            if([items3[1] intValue]>=3 && [items3[1] intValue]<=9){
                cell.imageView.image=[UIImage imageNamed:@"cpu_bluegreen.png"];
                detail = [NSString stringWithFormat:@"₡%@-Speed +10",items3[7]];
            }
            if([items3[1] intValue]>=10 && [items3[1] intValue]<=18){
                cell.imageView.image=[UIImage imageNamed:@"cpu_blue.png"];
                detail = [NSString stringWithFormat:@"₡%@-Speed +20",items3[7]];
            }
            if([items3[1] intValue]>=19 && [items3[1] intValue]<=27){
                cell.imageView.image=[UIImage imageNamed:@"cpu_green.png"];
                detail = [NSString stringWithFormat:@"₡%@-Speed +30",items3[7]];
            }
        }else if([items3[3] isEqualToString:@"mod"]){
            type = [NSString stringWithFormat:@"Mod Lvl.%@", items3[1]];
            if([items3[1] intValue] >= 1 && [items3[1] intValue] <= 9){
                cell.imageView.image=[UIImage imageNamed:@"mod_bluegreen.png"];
                if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"₡%@-%@ speed+1",items3[7],items3[4]];
                else detail = [NSString stringWithFormat:@"₡%@-%@ %@+1",items3[7],items3[4],items3[5]];
            }
            if([items3[1] intValue] >= 12 && [items3[1] intValue] <= 18){
                cell.imageView.image=[UIImage imageNamed:@"mod_blue.png"];
                if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"₡%@-%@ speed+2",items3[7],items3[4]];
                else detail = [NSString stringWithFormat:@"₡%@-%@ %@+2",items3[7],items3[4],items3[5]];
            }
            if([items3[1] intValue] >= 21 && [items3[1] intValue] <= 27){
                cell.imageView.image=[UIImage imageNamed:@"mod_green.png"];
                if([items3[4] isEqualToString:@"hack"] && [items3[5] isEqualToString:@"time"]) detail = [NSString stringWithFormat:@"₡%@-%@ speed+3",items3[7],items3[4]];
                else detail = [NSString stringWithFormat:@"₡%@-%@ %@+3",items3[7],items3[4],items3[5]];
            }
        }else if([items3[3] isEqualToString:@"exploit"]){
            type = @"- Compiled";
            detail = [NSString stringWithFormat:@"₡%@",items3[7]];
            if([items3[1] isEqualToString:@"1"]) cell.imageView.image=[UIImage imageNamed:@"exploit_bluegreen.png"];
            if([items3[1] isEqualToString:@"2"]) cell.imageView.image=[UIImage imageNamed:@"exploit_blue.png"];
            if([items3[1] isEqualToString:@"3"]) cell.imageView.image=[UIImage imageNamed:@"exploit_green.png"];
        }
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@ %@", items3[0],type];
        cell.detailTextLabel.text = detail;
        
    }
 //   cell.textLabel.text =  [items objectAtIndex:indexPath.row];
    
    
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
- (DLRadioButton *)createRadioButtonWithFrame:(CGRect) frame Title:(NSString *)title Color:(UIColor *)color
{
    DLRadioButton *radioButton = [[DLRadioButton alloc] initWithFrame:frame];
    radioButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [radioButton setTitle:title forState:UIControlStateNormal];
    [radioButton setTitleColor:color forState:UIControlStateNormal];
    radioButton.iconColor = color;
    radioButton.indicatorColor = color;
    radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [radioButton addTarget:self action:@selector(logSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
    [panel addSubview:radioButton];
    
    return radioButton;
}

- (IBAction)logSelectedButton:(DLRadioButton *)radioButton {
    if (radioButton.isMultipleSelectionEnabled) {
        for (DLRadioButton *button in radioButton.selectedButtons) {
            NSLog(@"%@ is selected.\n", button.titleLabel.text);
        }
    } else {
        NSLog(@"%@ is selected.\n", radioButton.selectedButton.titleLabel.text);
    }
}
@end
