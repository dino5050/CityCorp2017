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
static UIView *cancel22;
static UIView *dismiss22;
static NSString *timestamp;
static NSString *timestamp2;
static int secondsLeft;
static int secondsLeft2;
static NSTimer *timer;
static NSTimer *timer2;
UITextView *commandline;
UITextView *commandline2;
static Reykjavik *tech;
static Bergen *tech2;
static Oostende *tech3;
static Penzance *tech4;
static Lisbon *tech5;
static Torindor *tech6;
static NSString *city;
static NSInteger day;


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
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    day = [comps weekday];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(redoTimer) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resign) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(redoTimer2) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resign2) name:UIApplicationWillResignActiveNotification object:nil];
    
    Button* back = [[Button alloc] init];
    back.name = @"back";
    [self.view addSubview:[back back: CGRectMake(10, 40, 55, 50.0)]];
    
    if(screenSize.height >= 667 && screenSize.height < 812)panel = [[UIView alloc] initWithFrame:CGRectMake(10+20, 55+40, screenSize.width-10-10-40, screenSize.height-55-40-125)];
    else if (screenSize.height >= 896) panel = [[UIView alloc] initWithFrame:CGRectMake(10+20, 55+40, screenSize.width-10-10-40, screenSize.height-55-40-285)];
    else if (screenSize.height >= 812) panel = [[UIView alloc] initWithFrame:CGRectMake(10+20, 55+40, screenSize.width-10-10-40, screenSize.height-55-40-200)];
    else panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50)];
    [panel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    panel.layer.borderWidth = 2.0f;
    panel.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [panel setClipsToBounds:TRUE];
    [self.view addSubview:panel];
    
    [self map];
    
 /*   UIImage *rey5 = [UIImage imageNamed:@"Reykjavik5_3-1.png"];
    UIImageView *rey = [[UIImageView alloc] initWithImage:rey5];
    rey.frame = CGRectMake(0, -90, 900*0.63, 959*0.63);
    [panel addSubview:rey];

    tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
    [panel addSubview:tech];
//    [tech industrial: CGRectMake(50, 50, 400, 400)];
    tech.backgroundColor = [UIColor clearColor];
    */
    //  [rey setClipsToBounds:TRUE];

    commandline = [[UITextView alloc] initWithFrame:CGRectMake(67-20, panel.frame.size.height-50-10, 165, 50)];
    [commandline setBackgroundColor:[UIColor blackColor]];
    commandline.layer.borderWidth = 2.0f;
    commandline.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    commandline.editable = NO;
    commandline.textColor = [UIColor greenColor];
    commandline.font = [UIFont fontWithName:@"Courier" size:12];
    
    commandline2 = [[UITextView alloc] initWithFrame:CGRectMake(67, 40, 165, 50)];
    [commandline2 setBackgroundColor:[UIColor blackColor]];
    commandline2.layer.borderWidth = 2.0f;
    commandline2.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [self.view addSubview:commandline2];
    commandline2.editable = NO;
    commandline2.textColor = [UIColor greenColor];
    commandline2.text = [NSString stringWithFormat:@"connecting to %@...\nconnected",city];
    commandline2.font = [UIFont fontWithName:@"Courier" size:12];
    //    [self scrollTextViewToBottom:commandline];
  
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences3 stringForKey:@"username"];
    Functions *hackingtime = [[Functions alloc] init];
    @try{timestamp = [hackingtime httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"tech"] :@"hackingtime.php"];
    }@catch(NSException *error){}
    NSArray *getTime = [timestamp componentsSeparatedByString:@"|"];
    if(![getTime[0] isEqualToString:@"nothacking"] && [timestamp intValue] >= (int)[[NSDate date] timeIntervalSince1970]){
        [panel addSubview:commandline];
        Button *cancel = [[Button alloc] init];
        cancel.name = @"Cancel";
    //    cancel2 = [cancel button2: CGRectMake(67+167, 40, 75, 50.0)];
        cancel2 = [cancel button2:CGRectMake(67+167-20, panel.frame.size.height-50-10, 75, 50)];
 //       [viewController.view addSubview:cancel2];
        [panel addSubview:cancel2];
        secondsLeft = [timestamp intValue] - (int)[[NSDate date] timeIntervalSince1970] ;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runScheduledTask:) userInfo:nil repeats:YES];
        //      [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    }if([getTime[0] isEqualToString:@"failure"]) {commandline.text = @"hacking complete: awaiting result...\nhacking failed";
        [panel addSubview:commandline];
    }
    else if([getTime[0] isEqualToString:@"samefaction"]){ commandline.text = @"hacking failed... district same faction as yours";
        [panel addSubview:commandline];
    }
    else if([getTime[0] isEqualToString:@"nocorp"]){ commandline.text = @"hacking failed... you're not in a corporation at time of hack";
        [panel addSubview:commandline];
    }
    else if([getTime[0] isEqualToString:@"hacked"]) {commandline.text = @"hacking complete: awaiting result...\nhacking successful!";
        [panel addSubview:commandline];
    }
    if([getTime[0] isEqualToString:@"hacked"] || [getTime[0] isEqualToString:@"nothing"] || [getTime[0] isEqualToString:@"failure"] || [getTime[0] isEqualToString:@"samefaction"] || [getTime[0] isEqualToString:@"nocorp"]){
        [panel addSubview:commandline];
        [cancel2 removeFromSuperview];
        Button *dismiss = [[Button alloc] init];
        dismiss.name = @"Dismiss";
        //dismiss2 = [dismiss button2: CGRectMake(67+167, 40, 75, 50.0)];
        dismiss2 = [dismiss button2:CGRectMake(67+167-20, panel.frame.size.height-50-10, 75, 50)];
        [panel addSubview:dismiss2];
    }
    
    Functions *hackingtime2 = [[Functions alloc] init];
    @try{timestamp2 = [hackingtime2 httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"industrial"] :@"hackingtime.php"];
    }@catch(NSException *error){}
    getTime = [timestamp2 componentsSeparatedByString:@"|"];
    if(![getTime[0] isEqualToString:@"nothacking"] && [timestamp2 intValue] >= (int)[[NSDate date] timeIntervalSince1970]){
        Button *cancel21 = [[Button alloc] init];
        cancel21.name = @"Cancel ";
        //    cancel2 = [cancel button2: CGRectMake(67+167, 40, 75, 50.0)];
        cancel22 = [cancel21 button2:CGRectMake(67+167, 40, 75, 50)];
        //       [viewController.view addSubview:cancel2];
        [self.view addSubview:cancel22];
        secondsLeft2 = [timestamp2 intValue] - (int)[[NSDate date] timeIntervalSince1970] ;
        timer2 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runScheduledTask2:) userInfo:nil repeats:YES];
        //      [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    }if([getTime[0] isEqualToString:@"failure"]) {commandline2.text = @"hacking complete: awaiting result...\nhacking failed";
    }
    else if([getTime[0] isEqualToString:@"samefaction"]){ commandline2.text = @"hacking failed... district same faction as yours";
    }
    else if([getTime[0] isEqualToString:@"nocorp"]){ commandline.text = @"hacking failed... you're not in a corporation at time of hack";
        [panel addSubview:commandline];
    }
    else if([getTime[0] isEqualToString:@"hacked"]) {commandline2.text = @"...hacking successful! Check your inventory...";
    }
    if([getTime[0] isEqualToString:@"hacked"] || [getTime[0] isEqualToString:@"nothing"] || [getTime[0] isEqualToString:@"failure"] || [getTime[0] isEqualToString:@"samefaction"] || [getTime[0] isEqualToString:@"nocorp"]){
        [cancel22 removeFromSuperview];
        Button *dismiss21 = [[Button alloc] init];
        dismiss21.name = @"Dismiss ";
        //dismiss2 = [dismiss button2: CGRectMake(67+167, 40, 75, 50.0)];
        dismiss22 = [dismiss21 button2:CGRectMake(67+167, 40, 85, 50)];
        [self.view addSubview:dismiss22];
    
    }

/*    Button *previous = [[Button alloc] init];
    previous.name = @"previous";
    previous2 = [previous previous: CGRectMake(panel.frame.size.width/2-56, 60*6, 55, 50.0)];
    [panel addSubview:previous2];
    Button *next = [[Button alloc] init];
    next.name = @"next";
    next2 = [next next: CGRectMake(panel.frame.size.width/2+1, 60*6, 55, 50.0)];
    [panel addSubview:next2];
    iD = 0;
    */
    self.bannerView = [[GADBannerView alloc]
                       initWithAdSize:kGADAdSizeBanner];
    
    [self addBannerViewToView:_bannerView];
    
    self.bannerView.adUnitID = @"ca-app-pub-3188229665332758/3829260800";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];

}
-(void)map{
    
 //   if(iD<5){
 //       iD++;
        if(day == 2){
    //        [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *rey5 = [UIImage imageNamed:@"Reykjavik5_3-1.png"];
            UIImageView *rey = [[UIImageView alloc] initWithImage:rey5];
            rey.frame = CGRectMake(0, -90, 900*0.63, 959*0.63);
            [panel addSubview:rey];
            city = @"Reykjavik";
            commandline2.text = [NSString stringWithFormat:@"connecting to %@...\nconnected",city];
            tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
        }else if(day == 3){
   //         [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *bergen1 = [UIImage imageNamed:@"Bergen.png"];
            UIImageView *bergen = [[UIImageView alloc] initWithImage:bergen1];
            bergen.frame = CGRectMake(-200, -50, 1159*0.63, 1128*0.63);
            [panel addSubview:bergen];
            city = @"Bergen";
            commandline2.text = [NSString stringWithFormat:@"connecting to %@...\nconnected",city];
            tech2 = [[Bergen alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech2];
            tech2.backgroundColor = [UIColor clearColor];
        }else if(day == 4){
    //        [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *oostende = [UIImage imageNamed:@"Oostende.png"];
            UIImageView *oostende1 = [[UIImageView alloc] initWithImage:oostende];
            oostende1.frame = CGRectMake(-90, -80, 1100*0.58, 1057*0.58);
            [panel addSubview:oostende1];
            city = @"Oostende";
            commandline2.text = [NSString stringWithFormat:@"connecting to %@...\nconnected",city];
            tech3 = [[Oostende alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech3];
            tech3.backgroundColor = [UIColor clearColor];
        }else if(day == 5){
     //       [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *penzance = [UIImage imageNamed:@"Penzance.png"];
            UIImageView *penzance1 = [[UIImageView alloc] initWithImage:penzance];
            penzance1.frame = CGRectMake(-210, -40, 902*0.63, 1050*0.63);
            [panel addSubview:penzance1];
            city = @"Penzance";
            commandline2.text = [NSString stringWithFormat:@"connecting to %@...\nconnected",city];
            tech4 = [[Penzance alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech4];
            tech4.backgroundColor = [UIColor clearColor];
        }else if(day == 6){
     //       [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *lisbon = [UIImage imageNamed:@"Lisbon.png"];
            UIImageView *lisbon1 = [[UIImageView alloc] initWithImage:lisbon];
            lisbon1.frame = CGRectMake(-150, -150, 1064*0.63, 1101*0.63);
            [panel addSubview:lisbon1];
            city = @"Lisbon";
            commandline2.text = [NSString stringWithFormat:@"connecting to %@...\nconnected",city];
            tech5 = [[Lisbon alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech5];
            tech5.backgroundColor = [UIColor clearColor];
        }else{
       //     [[panel subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
            
            UIImage *torindor = [UIImage imageNamed:@"Torindor.png"];
            UIImageView *torindor1 = [[UIImageView alloc] initWithImage:torindor];
            torindor1.frame = CGRectMake(-170, -200, 1032*0.63, 1335*0.63);
            [panel addSubview:torindor1];
            city = @"Torindor";
            commandline2.text = [NSString stringWithFormat:@"connecting to %@...\nconnected",city];
            tech6 = [[Torindor alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech6];
            tech6.backgroundColor = [UIColor clearColor];
        }
}

-(void)resign{
    [timer invalidate];
    timer = nil;
}
-(void)resign2{
    [timer2 invalidate];
    timer2 = nil;
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
        dismiss.name = @"Dismiss";
        dismiss2 = [dismiss button2: CGRectMake(67+167-20, panel.frame.size.height-50-10, 75, 50.0)];
//        [viewController.view addSubview:dismiss2];
        [panel addSubview:dismiss2];
        
        if([city isEqualToString:@"Reykjavik"]){
            [tech removeFromSuperview];
            tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Bergen"]){
            [tech2 removeFromSuperview];
            tech2 = [[Bergen alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech2];
            tech2.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Oostende"]){
            [tech3 removeFromSuperview];
            tech3 = [[Oostende alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech3];
            tech3.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Penzance"]){
            [tech4 removeFromSuperview];
            tech4 = [[Penzance alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech4];
            tech4.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Lisbon"]){
            [tech5 removeFromSuperview];
            tech5 = [[Lisbon alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech5];
            tech5.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Torindor"]){
            [tech6 removeFromSuperview];
            tech6 = [[Torindor alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech6];
            tech6.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }
    }
}
-(void)redoTimer2{
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences3 stringForKey:@"username"];
    Functions *hackingtime = [[Functions alloc] init];
    @try{timestamp2 = [hackingtime httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"industrial"] :@"hackingtime.php"];
    }@catch(NSException *error){}
    //    commandline.text=@"";
    int time = (int)[[NSDate date] timeIntervalSince1970];
    NSArray *getTime = [timestamp2 componentsSeparatedByString:@"|"];
    if(![getTime[0] isEqualToString:@"nothacking"] && [timestamp2 intValue] >= (int)[[NSDate date] timeIntervalSince1970]){
        secondsLeft2 = [timestamp2 intValue] - time;
        [timer2 invalidate];
        timer2 = nil;
        timer2 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runScheduledTask2:) userInfo:nil repeats:YES];
    }if([getTime[0] isEqualToString:@"failure"]) commandline2.text = @"hacking complete: awaiting result...\nhacking failed";
    else if([getTime[0] isEqualToString:@"failure"]) commandline2.text = @"hacking failed... district same faction as yours";
    else if([getTime[0] isEqualToString:@"hacked"]) commandline2.text = @"...hacking successful! Check your inventory...";
    if([getTime[0] isEqualToString:@"hacked"] || [getTime[0] isEqualToString:@"nothing"] || [getTime[0] isEqualToString:@"failure"]){
        [cancel2 removeFromSuperview];
        Button *dismiss = [[Button alloc] init];
        dismiss.name = @"Dismiss ";
        dismiss22 = [dismiss button2: CGRectMake(67+167, 40, 85, 50.0)];
        [viewController.view addSubview:dismiss22];
        
    }
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)dismiss{
    [dismiss2 removeFromSuperview];
    commandline.text=@"";
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences3 stringForKey:@"username"];
    Functions *playerdelete = [[Functions alloc] init];
    @try{[playerdelete httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"tech"] :@"contestdelete.php"];
    }@catch(NSException *error){}
    [commandline removeFromSuperview];
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
    dismiss.name = @"Dismiss";
    dismiss2 = [dismiss button2: CGRectMake(67+167-20, panel.frame.size.height-50-10, 75, 50.0)];
    [panel addSubview:dismiss2];
    commandline.text = @"...hacking canceled";
}
-(void)dismiss_{
    [dismiss22 removeFromSuperview];
    commandline2.text = [NSString stringWithFormat:@"connecting to %@...\nconnected",city];
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences3 stringForKey:@"username"];
    Functions *playerdelete = [[Functions alloc] init];
    @try{[playerdelete httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"industrial"] :@"contestdelete.php"];
    }@catch(NSException *error){}
}
-(void)cancel_{
    [cancel22 removeFromSuperview];
    preferences3 = [NSUserDefaults standardUserDefaults];
    NSString *username = [preferences3 stringForKey:@"username"];
    Functions *playerdelete = [[Functions alloc] init];
    @try{[playerdelete httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"industrial"] :@"contestdelete.php"];
    }@catch(NSException *error){}
    [timer2 invalidate];
    Button *dismiss = [[Button alloc] init];
    dismiss.name = @"Dismiss ";
    dismiss22 = [dismiss button2: CGRectMake(67+167, 40, 85, 50.0)];
    [viewController.view addSubview:dismiss22];
    commandline2.text = @"...hacking canceled";
}
- (void)runScheduledTask: (NSTimer *) runningTimer {
    int hours, minutes, seconds;
    secondsLeft--;
    hours = secondsLeft / 3600;
    minutes = (secondsLeft % 3600) / 60;
    seconds = (secondsLeft %3600) % 60;
    commandline.text = [NSString stringWithFormat:@"hacking completes in: %02d:%02d:%02d",hours,minutes,seconds];
    
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
        else if([getTime[0] isEqualToString:@"nocorp"]) commandline.text = @"hacking failed... you're not in a corporation at time of hack";
        else if([getTime[0] isEqualToString:@"hacked"]) commandline.text = @"hacking complete: awaiting result...\nhacking successful!";
        [cancel2 removeFromSuperview];
        Button *dismiss = [[Button alloc] init];
        dismiss.name = @"Dismiss";
        dismiss2 = [dismiss button2: CGRectMake(67+167-20, panel.frame.size.height-50-10, 75, 50)];
        [panel addSubview:dismiss2];
        if([city isEqualToString:@"Reykjavik"]){
            [tech removeFromSuperview];
            tech = [[Reykjavik alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech];
            tech.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Bergen"]){
            [tech2 removeFromSuperview];
            tech2 = [[Bergen alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech2];
            tech2.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Oostende"]){
            [tech3 removeFromSuperview];
            tech3 = [[Oostende alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech3];
            tech3.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Penzance"]){
            [tech4 removeFromSuperview];
            tech4 = [[Penzance alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech4];
            tech4.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Lisbon"]){
            [tech5 removeFromSuperview];
            tech5 = [[Lisbon alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech5];
            tech5.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }else if([city isEqualToString:@"Torindor"]){
            [tech6 removeFromSuperview];
            tech6 = [[Torindor alloc] initWithFrame:CGRectMake(-15, 0, 400, 450)];
            [panel addSubview:tech6];
            tech6.backgroundColor = [UIColor clearColor];
            [panel bringSubviewToFront:commandline];
            [panel bringSubviewToFront:dismiss2];
        }
        [panel bringSubviewToFront:dismiss2];
        [panel bringSubviewToFront:commandline];
    }
}
- (void)runScheduledTask2: (NSTimer *) runningTimer {
    int hours, minutes, seconds;
    secondsLeft2--;
    hours = secondsLeft2 / 3600;
    minutes = (secondsLeft2 % 3600) / 60;
    seconds = (secondsLeft2 %3600) % 60;
    commandline2.text = [NSString stringWithFormat:@"hacking completes in: %02d:%02d:%02d",hours,minutes,seconds];
    
    if (secondsLeft2<0) {
        commandline2.text = @"hacking complete: awaiting result...";
        
    }if(secondsLeft2<-6){
        [timer2 invalidate];
        preferences3 = [NSUserDefaults standardUserDefaults];
        NSString *username = [preferences3 stringForKey:@"username"];
        Functions *hackingtime = [[Functions alloc] init];
        @try{timestamp2 = [hackingtime httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"industrial"] :@"hackingtime.php"];
        }@catch(NSException *error){}
        NSArray *getTime = [timestamp2 componentsSeparatedByString:@"|"];
        if([getTime[0] isEqualToString:@"failure"]) commandline2.text = @"hacking complete: awaiting result...\nhacking failed";
        else if([getTime[0] isEqualToString:@"samefaction"]) commandline2.text = @"hacking failed... district same faction as yours";
        else if([getTime[0] isEqualToString:@"nocorp"]) commandline.text = @"hacking failed... you're not in a corporation at time of hack";
        else if([getTime[0] isEqualToString:@"hacked"]) commandline2.text = @"...hacking successful! Check your inventory...";
        [cancel22 removeFromSuperview];
        Button *dismiss21 = [[Button alloc] init];
        dismiss21.name = @"Dismiss ";
        dismiss22 = [dismiss21 button2: CGRectMake(67+167, 40, 85, 50)];
        [viewController.view addSubview:dismiss22];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)back{
    [timer invalidate];
    timer = nil;
    [timer2 invalidate];
    timer2 = nil;
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
        NSString *chance = [scan httprequest:@"hacker,name,server" :[NSString stringWithFormat:@"%@,%@,%ld", username, district,[preferences3 integerForKey:@"server"]] :@"techscan.php"];
        array4 = [chance componentsSeparatedByString:@"|"];
        if([array4[0] isEqualToString:@"notcorporate"]){ chance2 = @"You can only hack dark red, black and red districts. Only the corporate class can hack tech districts";
        }else if([array4[0] isEqualToString:@"nocorp"]){ chance2 = @"You need to be in a corporation first to be able to hack tech districts.";
        }else if([array4[0] isEqualToString:@"slotused"]){ chance2 = @"Hacking Slot in Terminal Already Used";
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
        
        if([array4[0] isEqualToString:@"slotused"]) chance2 = @"Hacking Slot in Terminal Already Used";
        else if([array4[0] isEqualToString:@"noexploit"]){
            if([level intValue]/10==1) chance2 = [NSString stringWithFormat:@"Level %d Compiled Exploit required. Go to Market -> BlackMarket to buy Level 1 exploits",[level intValue]/10];
            else chance2 = [NSString stringWithFormat:@"Level %d Compiled Exploit required.",[level intValue]/10];
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
                      
                      if([type isEqualToString:@"tech"]){
                          [panel addSubview:commandline];
                          Button *cancel = [[Button alloc] init];
                          cancel.name = @"Cancel";
                          cancel2 = [cancel button2: CGRectMake(67+167-20, panel.frame.size.height-50-10, 75, 50.0)];
                          [panel addSubview:cancel2];
                          @try{[scan httprequest:@"hacker,name,server" :[NSString stringWithFormat:@"%@,%@,%ld", username,district,[preferences3 integerForKey:@"server"]] :@"techcontests.php"];}@catch(NSException *error){}
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
                      }else{
                          
                          Button *cancel = [[Button alloc] init];
                          cancel.name = @"Cancel ";
                          cancel22 = [cancel button2: CGRectMake(67+167, 40, 75, 50.0)];
                          [viewController.view addSubview:cancel22];
                          @try{[scan httprequest:@"hacker,name,level" :[NSString stringWithFormat:@"%@,%@,%d", username,district,[level intValue]] :@"industrialcontests.php"];}@catch(NSException *error){}
                          @try{[scan httprequest:@"hacker,level" :[NSString stringWithFormat:@"%@,%d", username,[level intValue]] :@"exploitdelete.php"];}@catch(NSException *error){}
                          [dismiss22 removeFromSuperview];
                          preferences3 = [NSUserDefaults standardUserDefaults];
                          username = [preferences3 stringForKey:@"username"];
                          Functions *hackingtime = [[Functions alloc] init];
                          @try{timestamp2 = [hackingtime httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, type] :@"hackingtime.php"];
                          }@catch(NSException *error){}
                          NSArray *getTime = [timestamp2 componentsSeparatedByString:@"|"];
                          if(![getTime[0] isEqualToString:@"nothacking"] && [timestamp2 intValue] >= (int)[[NSDate date] timeIntervalSince1970]){
                              secondsLeft2 = [timestamp2 intValue] - (int)[[NSDate date] timeIntervalSince1970] ;
                              timer2 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runScheduledTask2:) userInfo:nil repeats:YES];
                          }
                      
                      
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
     
    if(![array4[0] isEqualToString:@"nocorp"] && ![array4[0] isEqualToString:@"noexploit"] && ![array4[0] isEqualToString:@"notcorporate"] && ![array4[0] isEqualToString:@"slotused"] && ![array4[0] isEqualToString:@"locked"] && ![array4[0] isEqualToString:@"samefaction"] && ![array4[0] isEqualToString:@"canthack"]) [alert addAction:hack2];
    
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
