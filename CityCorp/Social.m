//
//  Social.m
//  CityCorp
//
//  Created by Dino Martinez on 2/6/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Social.h"
#import "Button.h"
@import GoogleMobileAds;

@interface Social ()
@property(nonatomic, strong) GADBannerView *bannerView;
@end

@implementation Social
static UIView *panel;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    //send message to buddy on home screen, number of messages
    
    Button* back = [[Button alloc] init];
    back.name = @"back";
    [self.view addSubview:[back back: CGRectMake(10, 40, 50, 50.0)]];
    
    Button* corp = [[Button alloc] init];
    corp.name = @"corp";
    [self.view addSubview:[corp button2: CGRectMake(10+52, 40, 70, 50.0)]];
    
    Button* faction = [[Button alloc] init];
    faction.name = @"faction";
    [self.view addSubview:[faction button2: CGRectMake(10+52+72, 40, 80, 50.0)]];
    
    Button* mail = [[Button alloc] init];
    mail.name = @"mail";
 //   [self.view addSubview:[mail button2: CGRectMake(10+52+72+82, 40, 64, 50.0)]];
    
    Button* space = [[Button alloc] init];
    space.name = @"";
    [self.view addSubview:[space button2: CGRectMake(10+52+72+82, 40, screenSize.width-(10+52+72+82+66+10)+64, 50.0)]];
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
    
    [self.view addSubview:panel];
    
    UITextView *general = [[UITextView alloc] initWithFrame:CGRectMake(5, 5, 215, 25)];
    general.text = @"General Chat";
    general.editable = NO;
    general.backgroundColor = [UIColor blackColor];
    general.font = [UIFont fontWithName:@"Abduction" size:14];
    general.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:255];
    [panel addSubview:general];
    
    UITextView *chat = [[UITextView alloc] initWithFrame:CGRectMake(3, 85, 210, 333)];
    chat.backgroundColor = [UIColor blackColor];
    chat.layer.borderColor = [UIColor blueColor].CGColor;
    chat.layer.borderWidth = 2.0f;
    chat.font = [UIFont fontWithName:@"Arial" size:10];
    chat.textColor = [UIColor whiteColor];
    chat.text = @"dino5050: Hello everyone!";
    chat.editable = NO;
    [panel addSubview:chat];
    
    UITextView *new = [[UITextView alloc ] initWithFrame:CGRectMake(panel.frame.size.width-83-3, 85-6+20
                                                                    , 86, 20)];
    new.backgroundColor = [UIColor blackColor];
    new.textColor = [UIColor whiteColor];
    new.text = @"2 new messages";
    new.font = [UIFont fontWithName:@"Arial" size:10];
 //   [panel addSubview:new];
    
    Button *inbox = [[Button alloc] init];
    inbox.name = @"inbox";
 //   [panel addSubview:[inbox button2: CGRectMake(panel.frame.size.width-83-3, 100+20, 83, 50.0)]];
    
    UITextField *message = [[UITextField alloc] initWithFrame:CGRectMake(3+1, 85-32, 210-1, 30)];
    message.layer.borderWidth = 2.0f;
    message.layer.borderColor = [UIColor blueColor].CGColor;
    message.textColor = [UIColor whiteColor];
    message.backgroundColor = [UIColor grayColor];
    [panel addSubview:message];
    
    Button *send = [[Button alloc] init];
    send.name = @"send";
    [panel addSubview:[send button2: CGRectMake(3+212, 85-32, 60, 30.0)]];
    
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
