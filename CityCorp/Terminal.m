//
//  Terminal.m
//  CityCorp
//
//  Created by Dino Martinez on 2/6/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Terminal.h"
#import "Button.h"
@import GoogleMobileAds;
#import "Functions.h"

@interface Terminal () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation Terminal

static UIView *panel;
static NSArray *array2;
static NSArray *array3;
static int iD;
static NSUserDefaults *preferences3;
static NSString *username3;
static UITextView *commandline;
static int secondsLeft;
static NSTimer *timer;
static NSString *timestamp;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    Button* back = [[Button alloc] init];
    back.name = @"back";
    [self.view addSubview:[back back: CGRectMake(10, 40, 55, 50.0)]];
    
    preferences3 = [NSUserDefaults standardUserDefaults];
    username3 = [preferences3 stringForKey:@"username"];
    
    Button *cancel = [[Button alloc] init];
    cancel.name = @"cancel";
    [self.view addSubview:[cancel button2: CGRectMake(67+167, 40, 75, 50.0)]];
    
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
    @try{timestamp = [hackingtime httprequest:@"hacker,contest" :[NSString stringWithFormat:@"%@,%@", username, @"player"] :@"hackingtime.php"];
    }@catch(NSException *error){}
    NSArray *getTime = [timestamp componentsSeparatedByString:@"|"];
    if(![getTime[0] isEqualToString:@"nothacking"] && [timestamp intValue] >= (int)[[NSDate date] timeIntervalSince1970]){
        secondsLeft = [timestamp intValue] - (int)[[NSDate date] timeIntervalSince1970] ;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runScheduledTask:) userInfo:nil repeats:YES];
    }
    
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
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(panel.frame.size.width/2-250/2,40,250,300) collectionViewLayout:layout];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [collectionView setBackgroundColor:[UIColor blackColor]];
    Functions *terminal = [[Functions alloc] init];
    NSString *players;
    iD = 0;  //ADD NEXT/PREVIOUS AND MAKE CELLS WIDER
    @try{players = [terminal httprequest:@"id,name" :[NSString stringWithFormat:@"%d,%@",iD,username3] :@"terminal.php"];
    }@catch(NSException *error){}
    array2 = [players componentsSeparatedByString:@"|"];
    
    [panel addSubview: collectionView];
    
    self.bannerView = [[GADBannerView alloc]
                       initWithAdSize:kGADAdSizeBanner];
    
    [self addBannerViewToView:_bannerView];
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}
-(void)scrollTextViewToBottom:(UITextView *)textView {
    if(textView.text.length > 0 ) {
        NSRange bottom = NSMakeRange(textView.text.length -1, 1);
        [textView scrollRangeToVisible:bottom];
    }
}
- (void)runScheduledTask: (NSTimer *) runningTimer {
    int hours, minutes, seconds;
    secondsLeft--;
    hours = secondsLeft / 3600;
    minutes = (secondsLeft % 3600) / 60;
    seconds = (secondsLeft %3600) % 60;
    commandline.text =[NSString stringWithFormat:@"Time Remaining %02d:%02d:%02d", hours, minutes, seconds];
    if (secondsLeft==0) {
        [timer invalidate];
        commandline.text = @"Time up!!";
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return array2.count-1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor blackColor];
    
    UIImage *player = [UIImage imageNamed:@"avatar.png"];
    UIImageView *icon = [[UIImageView alloc] initWithImage:player];
    [icon setFrame:CGRectMake(5, 0, 40, 40)];
 //   NSLog(@"|||||||||%lu", array2.count);
    NSString *chars = array2[indexPath.item];
    array3 = [chars componentsSeparatedByString:@","];
    
    UITextView *name = [[UITextView alloc] initWithFrame:CGRectMake(-10, 30, 70, 20)];
    name.textColor = [UIColor whiteColor];
    name.editable = NO;
    [name setFont: [UIFont fontWithName:@"Arial" size:10]];
    [name setText:array3[0]];
    name.textAlignment=NSTextAlignmentCenter;
    name.backgroundColor = [UIColor clearColor];
 //   [icon contentMode];
    [cell.contentView addSubview:icon];
    [cell.contentView addSubview:name];

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(50, 50);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    NSString *chars = [array2 objectAtIndex:indexPath.row];
    array3 = [chars componentsSeparatedByString: @","];
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@""
                                  message:@""
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* message = [UIAlertAction
                         actionWithTitle:@"Message"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             preferences3 = [NSUserDefaults standardUserDefaults];
                             NSString *username = [preferences3 stringForKey:@"username"];
                             Functions *scan = [[Functions alloc] init];
                             NSString *chance = [scan httprequest:@"hacker,player,exploit" :[NSString stringWithFormat:@"%@,%@,%@", username, array3[0], @"1"] :@"playerscan.php"];
                             
                    
                             
                             
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    UIAlertAction* befriend = [UIAlertAction
                         actionWithTitle:@"Befriend"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             preferences3 = [NSUserDefaults standardUserDefaults];
                             NSString *username = [preferences3 stringForKey:@"username"];
                            
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    UIAlertAction* hack = [UIAlertAction
                               actionWithTitle:@"Hack"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
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
                                    NSString *chance = [scan httprequest:@"hacker,player" :[NSString stringWithFormat:@"%@,%@", username, array3[0]] :@"playerscan.php"];
                                   NSArray *array4 = [chance componentsSeparatedByString:@"|"];
                                   NSString *chance2;
                             //      NSLog(@"?????%@|||||||", chance);
                                   if([array4[0] isEqualToString:@"slotused"]){ chance2 = @"Hacking Slot in Terminal Already Used";
                                   }else if([array4[0] isEqualToString:@"locked"]){ chance2 = @"This Citizen's Computer is Temporarily Locked";
                                   }else if([array4[0] isEqualToString:@"samecorp"]){ chance2 = @"Can't Hack Citizen In Same Corporation As You";
                                   }else if([array4[0] isEqualToString:@"canthack"]){ chance2 = @"Your Computer is Not Capable enough of Attempting a Hack on This Citizen's Computer";
                                   }else{
                                           double percentage = [array4[0] doubleValue]*100;
                                           int percentage2 = percentage;
                                           chance2 = [NSString stringWithFormat:@"Estimated Chance to Hack %@ is %d%%. Do You Want to Proceed?",array3[0],percentage2];
                                           UIAlertAction* hack2 = [UIAlertAction
                                                                      actionWithTitle:@"Hack"
                                                                      style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action)
                                                                      {
                                                                         
                                                                          @try{[scan httprequest:@"hacker,player" :[NSString stringWithFormat:@"%@,%@", username, array3[0]] :@"playercontests.php"];}@catch(NSException *error){}
                                                                    [alert dismissViewControllerAnimated:YES completion:nil];
                                                                      }];
                                           [alert addAction:hack2];
                                       }
                                   [alert dismissViewControllerAnimated:YES completion:nil];
                                   
                                   
                                   UIColor *color = [UIColor orangeColor]; // select needed color
                                   NSString *string = chance2;
                                   NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
                                   NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
                                   [alert setValue:attrStr forKey:@"attributedMessage"];
                                   UIVisualEffect *blurEffect;
                                   blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
                                   [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert class]]] setEffect:blurEffect];
                                   [alert addAction:dismiss];
                                   [self presentViewController:alert animated:YES completion:nil];
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
    NSString *string = @"Choose Action";
    NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    [alert setValue:attrStr forKey:@"attributedMessage"];
    
    color = [UIColor orangeColor];
    NSString *string1 = [NSString stringWithFormat:@"Accessing %@...",array3[0]];
    NSDictionary *attrs1 = @{ NSForegroundColorAttributeName : color/*, NSFontAttributeName : [UIFont fontWithName:@"Abduction" size:16] */};
    NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString:string1 attributes:attrs1];
    [alert setValue:attrStr1 forKey:@"attributedTitle"];
    
    
    [alert addAction:message];
    [alert addAction:befriend];
    [alert addAction:hack];
    [alert addAction:cancel];
    
    
    //   UIVisualEffectView.appearance(whenContainedInInstancesOf: [alert.classForCoder() as! UIAppearanceContainer.Type]).effect = UIBlurEffect(style: .dark)
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    [[UIVisualEffectView appearanceWhenContainedInInstancesOfClasses:@[[alert class]]] setEffect:blurEffect];
    
    //    let attributedString = NSAttributedString(string: "Invalid Name", attributes: [       NSParagraphStyleAttributeName: paragraphStyle,NSFontAttributeName : UIFont.systemFontOfSize(15),NSForegroundColorAttributeName : UIColor.redColor()])
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)back{
    [timer invalidate];
    timer = nil;
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
