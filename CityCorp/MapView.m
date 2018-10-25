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
#import "Oostende.h"
#import "Penzance.h"
#import "Lisbon.h"
#import "Torindor.h"
#import "Button.h"
#import "Functions.h"
@import GoogleMobileAds;

@interface MapView ()
@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation MapView
static NSUserDefaults *preferences3;
static UIViewController *viewController;
static UIView *cancel2;
static UIView *dismiss2;
static NSString *timestamp;
static int secondsLeft;
static NSTimer *timer;
UITextView *commandline;
static Reykjavik *tech;
static UIView *previous2;
static UIView *next2;

static int iD;
-(IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}

static UIView *panel;
- (void)viewDidLoad{
    [super viewDidLoad];
    viewController = [[UIViewController alloc] init];
    [self.view addSubview:viewController.view];
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(redoTimer) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resign) name:UIApplicationWillResignActiveNotification object:nil];
    
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

    tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
    [panel addSubview:tech];
//    [tech industrial: CGRectMake(50, 50, 400, 400)];
    tech.backgroundColor = [UIColor clearColor];
    
    //  [rey setClipsToBounds:TRUE];
    commandline = [[UITextView alloc] initWithFrame:CGRectMake(67, 40, 165, 50)];
    [commandline setBackgroundColor:[UIColor blackColor]];
    commandline.layer.borderWidth = 2.0f;
    commandline.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [self.view addSubview:commandline];
    commandline.editable = NO;
    commandline.textColor = [UIColor greenColor];
    commandline.text = @"connecting to CityCorp...\nconnected";
    commandline.font = [UIFont fontWithName:@"Courier" size:12];
    //    [self scrollTextViewToBottom:commandline];
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences3 stringForKey:@"username"];
    Functions *hackingtime = [[Functions alloc] init];
    @try{timestamp = [hackingtime httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"tech"] :@"hackingtime.php"];
    }@catch(NSException *error){}
    NSArray *getTime = [timestamp componentsSeparatedByString:@"|"];
    if(![getTime[0] isEqualToString:@"nothacking"] && [timestamp intValue] >= (int)[[NSDate date] timeIntervalSince1970]){
        Button *cancel = [[Button alloc] init];
        cancel.name = @"cancel";
        cancel2 = [cancel button2: CGRectMake(67+167, 40, 75, 50.0)];
        [viewController.view addSubview:cancel2];
        secondsLeft = [timestamp intValue] - (int)[[NSDate date] timeIntervalSince1970] ;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runScheduledTask:) userInfo:nil repeats:YES];
        //      [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    }if([getTime[0] isEqualToString:@"failure"]) commandline.text = @"hacking complete: awaiting result...\nhacking failed";
    else if([getTime[0] isEqualToString:@"samefaction"]) commandline.text = @"hacking failed... district same faction as yours";
    else if([getTime[0] isEqualToString:@"hacked"]) commandline.text = @"hacking complete: awaiting result...\nhacking successful!";
    if([getTime[0] isEqualToString:@"hacked"] || [getTime[0] isEqualToString:@"nothing"] || [getTime[0] isEqualToString:@"failure"]){
        [cancel2 removeFromSuperview];
        Button *dismiss = [[Button alloc] init];
        dismiss.name = @"dismiss";
        dismiss2 = [dismiss button2: CGRectMake(67+167, 40, 75, 50.0)];
        [viewController.view addSubview:dismiss2];
        
    }

    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    previous2 = [previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)];
    [panel addSubview:previous2];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    next2 = [next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)];
    [panel addSubview:next2];
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
            
            Oostende *tech = [[Oostende alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
            
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
            
            Penzance *tech = [[Penzance alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
        
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
            
            Lisbon *tech = [[Lisbon alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
            
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
            
            Torindor *tech = [[Torindor alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
            
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
-(void)resign{
    [timer invalidate];
    timer = nil;
}
-(void)redoTimer{
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences3 stringForKey:@"username"];
    Functions *hackingtime = [[Functions alloc] init];
    @try{timestamp = [hackingtime httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"tech"] :@"hackingtime.php"];
    }@catch(NSException *error){}
    //    commandline.text=@"";
    int time = (int)[[NSDate date] timeIntervalSince1970];
    NSArray *getTime = [timestamp componentsSeparatedByString:@"|"];
    if(![getTime[0] isEqualToString:@"nothacking"] && [timestamp intValue] >= (int)[[NSDate date] timeIntervalSince1970]){
        secondsLeft = [timestamp intValue] - time;
        [timer invalidate];
        timer = nil;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runScheduledTask:) userInfo:nil repeats:YES];
    }if([getTime[0] isEqualToString:@"failure"]) commandline.text = @"hacking complete: awaiting result...\nhacking failed";
    else if([getTime[0] isEqualToString:@"failure"]) commandline.text = @"hacking failed... district same faction as yours";
    else if([getTime[0] isEqualToString:@"hacked"]) commandline.text = @"hacking complete: awaiting result...\nhacking successful!";
    if([getTime[0] isEqualToString:@"hacked"] || [getTime[0] isEqualToString:@"nothing"] || [getTime[0] isEqualToString:@"failure"]){
        [cancel2 removeFromSuperview];
        Button *dismiss = [[Button alloc] init];
        dismiss.name = @"dismiss";
        dismiss2 = [dismiss button2: CGRectMake(67+167, 40, 75, 50.0)];
        [viewController.view addSubview:dismiss2];
        [tech removeFromSuperview];
        tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
        [panel addSubview:tech];
        //    [tech industrial: CGRectMake(50, 50, 400, 400)];
        tech.backgroundColor = [UIColor clearColor];
        [panel bringSubviewToFront:previous2];
        [panel bringSubviewToFront:next2];
        
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)dismiss{
    [dismiss2 removeFromSuperview];
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences3 stringForKey:@"username"];
    Functions *playerdelete = [[Functions alloc] init];
    @try{[playerdelete httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"tech"] :@"contestdelete.php"];
    }@catch(NSException *error){}
    commandline.text = @"connecting to CityCorp...\nconnected";
}
-(void)cancel{
    [cancel2 removeFromSuperview];
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences3 stringForKey:@"username"];
    Functions *playerdelete = [[Functions alloc] init];
    @try{[playerdelete httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"tech"] :@"contestdelete.php"];
    }@catch(NSException *error){}
    [timer invalidate];
    Button *dismiss = [[Button alloc] init];
    dismiss.name = @"dismiss";
    dismiss2 = [dismiss button2: CGRectMake(67+167, 40, 75, 50.0)];
    [viewController.view addSubview:dismiss2];
    commandline.text = @"...hacking canceled";
}
- (void)runScheduledTask: (NSTimer *) runningTimer {
    int hours, minutes, seconds;
    secondsLeft--;
    hours = secondsLeft / 3600;
    minutes = (secondsLeft % 3600) / 60;
    seconds = (secondsLeft %3600) % 60;
    commandline.text =[NSString stringWithFormat:@"hacking completes in: %02d:%02d:%02d", hours, minutes, seconds];
    if (secondsLeft<0) {
        commandline.text = @"hacking complete: awaiting result...";
        
    }if(secondsLeft<-6){
        [timer invalidate];
        preferences3 = [NSUserDefaults standardUserDefaults];
        NSString *username = [preferences3 stringForKey:@"username"];
        Functions *hackingtime = [[Functions alloc] init];
        @try{timestamp = [hackingtime httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"tech"] :@"hackingtime.php"];
        }@catch(NSException *error){}
        NSArray *getTime = [timestamp componentsSeparatedByString:@"|"];
        if([getTime[0] isEqualToString:@"failure"]) commandline.text = @"hacking complete: awaiting result...\nhacking failed";
        else if([getTime[0] isEqualToString:@"samefaction"]) commandline.text = @"hacking failed... district same faction as yours";
        else if([getTime[0] isEqualToString:@"hacked"]) commandline.text = @"hacking complete: awaiting result...\nhacking successful!";
        [cancel2 removeFromSuperview];
        Button *dismiss = [[Button alloc] init];
        dismiss.name = @"dismiss";
        dismiss2 = [dismiss button2: CGRectMake(67+167, 40, 75, 50.0)];
        [viewController.view addSubview:dismiss2];
        [tech removeFromSuperview];
        tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
        [panel addSubview:tech];
        //    [tech industrial: CGRectMake(50, 50, 400, 400)];
        tech.backgroundColor = [UIColor clearColor];
        [panel bringSubviewToFront:previous2];
        [panel bringSubviewToFront:next2];
        
        
    }
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
-(void)hackDistrict: (NSString *)district: (NSString *) type: (NSNumber *) level{
 //   NSLog(district);
    UIAlertAction* hack2;
     
     UIAlertController *alert =   [UIAlertController
     alertControllerWithTitle:@""
     message:@""
     preferredStyle:UIAlertControllerStyleAlert];
     UIAlertAction *dismiss = [UIAlertAction
     actionWithTitle:@"Cancel"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * action){
     [alert dismissViewControllerAnimated:YES completion:nil];
     }];
     preferences3 = [NSUserDefaults standardUserDefaults];
     NSString *username = [preferences3 stringForKey:@"username"];
     Functions *scan = [[Functions alloc] init];
    
    NSString *chance2;
    NSArray *array4;
    if([type isEqualToString:@"tech"]){
        NSString *chance = [scan httprequest:@"hacker,name" :[NSString stringWithFormat:@"%@,%@", username, district] :@"techscan.php"];
        array4 = [chance componentsSeparatedByString:@"|"];
    
        
     //    NSLog(@"?????%@?????", chance2);
         if([array4[0] isEqualToString:@"slotused"]){ chance2 = @"Hacking Slot in Terminal Already Used";
         }else if([array4[0] isEqualToString:@"locked"]){ chance2 = @"This District is Temporarily Locked";
         }else if([array4[0] isEqualToString:@"samefaction"]){ chance2 = @"Can't Hack District In Same Faction As You";
         }else if([array4[0] isEqualToString:@"canthack"]){ chance2 = @"Your Computer is Not Capable enough of Attempting a Hack on this District";
         }else{ //CHECK FOR EXPLOIT, REMOVE IN TECHCONTESTS.PHP
             double percentage = [array4[0] doubleValue]*100;
             int percentage2 = percentage;
             chance2 = [NSString stringWithFormat:@"Estimated Chance to Hack %@ is %d%%. Do You Want to Proceed?",district,percentage2];
        } //CHANGE LIMIT id,5 to id>$id LIMIT 5
    }else{
        NSString *chance = [scan httprequest:@"hacker,name,level" :[NSString stringWithFormat:@"%@,%@,%d", username, district,[level intValue]] :@"industrialscan.php"];
        array4 = [chance componentsSeparatedByString:@"|"];
        
        //    NSLog(@"?????%@?????", chance2);
        if([array4[0] isEqualToString:@"slotused"]){ chance2 = @"Hacking Slot in Terminal Already Used";
        }else if([array4[0] isEqualToString:@"locked"]){ chance2 = @"This District is Temporarily Locked. Try another district";
        }else if([array4[0] isEqualToString:@"canthack"]){ chance2 = @"Your Computer is Not Capable enough of Attempting a Hack on this District";
        }else{
            double percentage = [array4[0] doubleValue]*100;
            int percentage2 = percentage;
            chance2 = [NSString stringWithFormat:@"Estimated Chance to Hack %@ is %d%%. Do You Want to Proceed?",district,percentage2];
        }
    }
         hack2 = [UIAlertAction
                  actionWithTitle:@"Hack"
                  style:UIAlertActionStyleDefault
                  handler:^(UIAlertAction * action)
                  {
                      preferences3 = [NSUserDefaults standardUserDefaults];
                      NSString *username = [preferences3 stringForKey:@"username"];
                      Functions *playerdelete = [[Functions alloc] init];
                      @try{[playerdelete httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, type] :@"contestdelete.php"];
                      }@catch(NSException *error){}
                      Button *cancel = [[Button alloc] init];
                      cancel.name = @"cancel";
                      cancel2 = [cancel button2: CGRectMake(67+167, 40, 75, 50.0)];
                      [viewController.view addSubview:cancel2];
                      if([type isEqualToString:@"tech"]){
                      @try{[scan httprequest:@"hacker,name" :[NSString stringWithFormat:@"%@,%@", username,district] :@"techcontests.php"];}@catch(NSException *error){}
                      }else{
                          @try{[scan httprequest:@"hacker,name,level" :[NSString stringWithFormat:@"%@,%@,%d", username,district,[level intValue]] :@"industrialcontests.php"];}@catch(NSException *error){}
                      }
                      [dismiss2 removeFromSuperview];
                      preferences3 = [NSUserDefaults standardUserDefaults];
                      username = [preferences3 stringForKey:@"username"];
                      Functions *hackingtime = [[Functions alloc] init];
                      @try{timestamp = [hackingtime httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, type] :@"hackingtime.php"];
                      }@catch(NSException *error){}
                      NSArray *getTime = [timestamp componentsSeparatedByString:@"|"];
                      if(![getTime[0] isEqualToString:@"nothacking"] && [timestamp intValue] >= (int)[[NSDate date] timeIntervalSince1970]){
                          secondsLeft = [timestamp intValue] - (int)[[NSDate date] timeIntervalSince1970] ;
                          timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runScheduledTask:) userInfo:nil repeats:YES];
                      }
                      [alert dismissViewControllerAnimated:YES completion:nil];
                  }];
         
  //       [alert addAction:hack2];
    
     [alert dismissViewControllerAnimated:YES completion:nil];
     
     
     UIColor *color = [UIColor orangeColor]; // select needed color
     NSString *string = chance2;
     NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
     NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
     [alert setValue:attrStr forKey:@"attributedMessage"];
     UIVisualEffect *blurEffect;
     blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
     [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert class]]] setEffect:blurEffect];
     
     
     UIAlertAction* cancel = [UIAlertAction
     actionWithTitle:@"Cancel"
     style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * action)
     {
     [alert dismissViewControllerAnimated:YES completion:nil];
     
     }];
     
     
     [alert setValue:attrStr forKey:@"attributedMessage"];
     
     color = [UIColor orangeColor];
     
     if(![array4[0] isEqualToString:@"slotused"] && ![array4[0] isEqualToString:@"locked"] && ![array4[0] isEqualToString:@"samefaction"] && ![array4[0] isEqualToString:@"canthack"]) [alert addAction:hack2];
    
     [alert addAction:cancel];
    
     [viewController presentViewController:alert animated:YES completion:nil];
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
