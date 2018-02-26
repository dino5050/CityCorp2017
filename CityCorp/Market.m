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

@interface Market ()
@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation Market
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
