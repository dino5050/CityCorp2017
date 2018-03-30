//
//  MapView.m
//  CityCorp
//
//  Created by Dino Martinez on 12/13/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "MapView.h"
#import "Hexagon.h"
#import "Button.h"
@import GoogleMobileAds;

@interface MapView ()
@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation MapView
-(IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}

static UIView *panel;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    Button* back = [[Button alloc] init];
    back.name = @"back";
    [self.view addSubview:[back back: CGRectMake(10, 40, 55, 50.0)]];
    
    
    
    
    
 /*   Button* space = [[Button alloc] init];
    space.name = @"";
    [self.view addSubview:[space button2: CGRectMake(10+87+67+70+70, 40, screenSize.width-(10+87+67+70+70+10), 50.0)]];
    */
    panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50)];
    [panel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    panel.layer.borderWidth = 2.0f;
    panel.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [panel setClipsToBounds:TRUE];
    [self.view addSubview:panel];
    
    UIImage *rey5 = [UIImage imageNamed:@"Reykjavik5_3-1.png"];
    UIImageView *rey = [[UIImageView alloc] initWithImage:rey5];
    rey.frame = CGRectMake(0, -90, 900*0.63, 959*0.63);
    [panel addSubview:rey];
    
    Hexagon *tech = [[Hexagon alloc] initWithFrame:CGRectMake(3, 90, 400, 400)];
    [panel addSubview:tech];
    tech.backgroundColor = [UIColor clearColor];
  //  [rey setClipsToBounds:TRUE];
    
    
    
    self.bannerView = [[GADBannerView alloc]
                       initWithAdSize:kGADAdSizeBanner];
    
    [self addBannerViewToView:_bannerView];
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];

}
-(void)viewDidAppear:(BOOL)animated{
/*    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    Hexagon *hexagon = [[Hexagon alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    [self.view addSubview:hexagon];
    hexagon.backgroundColor = [UIColor clearColor];
*/
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
