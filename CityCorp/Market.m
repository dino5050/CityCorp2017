//
//  Market.m
//  CityCorp
//
//  Created by Dino Martinez on 2/6/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Market.h"
#import "Button.h"
@import GoogleMobileAds;

@interface Market () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation Market

static NSArray *items;
static NSString *whichTable;
static UIView *panel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    Button* back = [[Button alloc] init];
    back.name = @"back";
    [self.view addSubview:[back back: CGRectMake(10, 40, 50, 50.0)]];
    
    Button* ccmarket = [[Button alloc] init];
    ccmarket.name = @"ccmarket";
    [self.view addSubview:[ccmarket button2: CGRectMake(10+52, 40, 87, 50.0)]];
    
    Button* blackmarket = [[Button alloc] init];
    blackmarket.name = @"blackmarket";
    [self.view addSubview:[blackmarket button2: CGRectMake(10+52+89+52, 40, 115, 50.0)]];
    
    Button* jobs = [[Button alloc] init];
    jobs.name = @"jobs";
    [self.view addSubview:[jobs button2: CGRectMake(10+52+89, 40, 50, 50.0)]];
    
    Button* space = [[Button alloc] init];
    space.name = @"";
    if(screenSize.width > 10+52+89+52+117)[self.view addSubview:[space button2: CGRectMake(10+52+89+52+117, 40, screenSize.width-(10+52+89+52+117+10), 50.0)]];
    /*   Button* space = [[Button alloc] init];
     space.name = @"";
     [self.view addSubview:[space button2: CGRectMake(10+87+67+70+70, 40, screenSize.width-(10+87+67+70+70+10), 50.0)]];
     */
    panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50)];
    [panel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    panel.layer.borderWidth = 2.0f;
    panel.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [self.view addSubview:panel];
    
    [self.view addSubview:panel];
    
    self.bannerView = [[GADBannerView alloc]
                       initWithAdSize:kGADAdSizeBanner];
    
    [self addBannerViewToView:_bannerView];
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)back{
    [self dismissViewControllerAnimated:false completion:nil];
}
-(void)ccmarket{
    [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    Button *back = [[Button alloc] init];
    back.name = @"back";
    [panel addSubview:[back button2: CGRectMake(panel.frame.size.width-60-5, panel.frame.size.height-50-5, 60, 50.0)]];
    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
    
    items = @[ @"Nezennin Corp.", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises", @"Nez Enterprises"];
    whichTable = @"ccmarket";
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
    
    if([whichTable isEqualToString:@"ccmarket"]){ UITableView *market = [[UITableView alloc] init];
        market.frame = CGRectMake(0, 50, panel.frame.size.width-10, items.count*60);
        market.layer.borderWidth = 2.0;
        market.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor clearColor]);
        market.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:0 green:0 blue:0 alpha:255]);
        market.delegate = self;
        market.dataSource = self;
        [panel addSubview:market];
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
    return items.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"title of cell %@", [items objectAtIndex:indexPath.row]);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    if([whichTable isEqualToString:@"ccmarket"]){
        UIImage *gotoCorp = [UIImage imageNamed:@"goto.png"];
        cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:255];
        cell.textLabel.font = [UIFont fontWithName:@"Abduction" size:12];
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:255];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.imageView.image = gotoCorp;
        cell.detailTextLabel.text = @"1 member";
    }
    
    cell.textLabel.text =  [items objectAtIndex:indexPath.row];
    
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
