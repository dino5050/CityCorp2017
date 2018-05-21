//
//  MapView.m
//  CityCorp
//
//  Created by Dino Martinez on 12/13/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "MapView.h"
#import "Reykjavik.h"
#import "Bergen.h"
#import "Button.h"
@import GoogleMobileAds;

@interface MapView ()
@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation MapView

static int iD;
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
    
    if(screenSize.height >= 667 && screenSize.height < 812)panel = [[UIView alloc] initWithFrame:CGRectMake(10+20, 55+40, screenSize.width-10-10-40, screenSize.height-55-40-125)];
    else if (screenSize.height >= 812) panel = [[UIView alloc] initWithFrame:CGRectMake(10+20, 55+40, screenSize.width-10-10-40, screenSize.height-55-40-200)];
    else panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50)];
    [panel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    panel.layer.borderWidth = 2.0f;
    panel.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [panel setClipsToBounds:TRUE];
    [self.view addSubview:panel];
    
    
    
    UIImage *rey5 = [UIImage imageNamed:@"Reykjavik5_3-1.png"];
    UIImageView *rey = [[UIImageView alloc] initWithImage:rey5];
    rey.frame = CGRectMake(0, -90, 900*0.63, 959*0.63);
    [panel addSubview:rey];

    Reykjavik *tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
    [panel addSubview:tech];
//    [tech industrial: CGRectMake(50, 50, 400, 400)];
    tech.backgroundColor = [UIColor clearColor];
    
    //  [rey setClipsToBounds:TRUE];

    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];

    iD = 0;
    
    self.bannerView = [[GADBannerView alloc]
                       initWithAdSize:kGADAdSizeBanner];
    
    [self addBannerViewToView:_bannerView];
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];

}
-(void)next{
    
    if(iD<5){
        iD++;
        if(iD == 0){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *rey5 = [UIImage imageNamed:@"Reykjavik5_3-1.png"];
            UIImageView *rey = [[UIImageView alloc] initWithImage:rey5];
            rey.frame = CGRectMake(0, -90, 900*0.63, 959*0.63);
            [panel addSubview:rey];
            
            Reykjavik *tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 40, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 40, 55, 50.0)]];
            //  [rey setClipsToBounds:TRUE];
        }else if(iD == 1){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *bergen1 = [UIImage imageNamed:@"Bergen.png"];
            UIImageView *bergen = [[UIImageView alloc] initWithImage:bergen1];
            bergen.frame = CGRectMake(-200, -50, 1159*0.63, 1128*0.63);
            [panel addSubview:bergen];
            
            Bergen *tech = [[Bergen alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
     
        }else if(iD == 2){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *oostende = [UIImage imageNamed:@"Oostende.png"];
            UIImageView *oostende1 = [[UIImageView alloc] initWithImage:oostende];
            oostende1.frame = CGRectMake(-90, -80, 1100*0.58, 1057*0.58);
            [panel addSubview:oostende1];
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
        }else if(iD == 3){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *penzance = [UIImage imageNamed:@"Penzance.png"];
            UIImageView *penzance1 = [[UIImageView alloc] initWithImage:penzance];
            penzance1.frame = CGRectMake(-210, -40, 902*0.63, 1050*0.63);
            [panel addSubview:penzance1];
        
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
        }else if(iD == 4){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *lisbon = [UIImage imageNamed:@"Lisbon.png"];
            UIImageView *lisbon1 = [[UIImageView alloc] initWithImage:lisbon];
            lisbon1.frame = CGRectMake(-150, -150, 1064*0.63, 1101*0.63);
            [panel addSubview:lisbon1];
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
        }else if(iD == 5){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *torindor = [UIImage imageNamed:@"Torindor.png"];
            UIImageView *torindor1 = [[UIImageView alloc] initWithImage:torindor];
            torindor1.frame = CGRectMake(-170, -200, 1032*0.63, 1335*0.63);
            [panel addSubview:torindor1];
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
        }
    }
}
-(void)previous{
    if(iD>0){
        iD--;
        if(iD == 0){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *rey5 = [UIImage imageNamed:@"Reykjavik5_3-1.png"];
            UIImageView *rey = [[UIImageView alloc] initWithImage:rey5];
            rey.frame = CGRectMake(0, -90, 900*0.63, 959*0.63);
            [panel addSubview:rey];
            
            Reykjavik *tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
            //  [rey setClipsToBounds:TRUE];
        }else if(iD == 1){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *bergen1 = [UIImage imageNamed:@"Bergen.png"];
            UIImageView *bergen = [[UIImageView alloc] initWithImage:bergen1];
            bergen.frame = CGRectMake(-230, -50, 1159*0.53, 1128*0.53);
            [panel addSubview:bergen];
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
            
        }else if(iD == 2){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
            
        }else if(iD == 3){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
        }else if(iD == 4){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
        }else if(iD == 5){
            [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            
            Button *previous = [[Button alloc] init];
            previous.name = @"previous";
            [panel addSubview:[previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)]];
            Button *next = [[Button alloc] init];
            next.name = @"next";
            [panel addSubview:[next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)]];
        }
    }
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
