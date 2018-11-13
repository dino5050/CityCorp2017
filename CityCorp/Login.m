//
//  Login.m
//  CityCorp
//
//  Created by Dino Martinez on 12/12/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "Login.h"
#import "MainMenu.h"
#import "Button.h"
#import "Functions.h"
@interface Login ()

@property (weak, nonatomic) IBOutlet UITextView *error;

@property (weak, nonatomic) IBOutlet UITextView *connecting;

@end

@implementation Login
- (IBAction)username:(UITextField *)sender {
    username1 = sender.text;
}
- (IBAction)password:(UITextField *)sender {
    password1 = sender.text;
}


//int login = 1;
int registered = 1;
Button* login;
NSString *username1;
NSString *password1;
NSUserDefaults *preferences;



/*-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([identifier isEqualToString:@"login"] && login == 1) return YES;
    return NO;
} */


- (void)viewDidLoad {
    [super viewDidLoad];
//    Functions *users = [[Functions alloc] init];
//    [users httprequest:@"name,password,email" :@"dino5050,1011,dino5050@hotmail.com" :@"users.php"];
    
    
    
//add register button and ifregistered vdefault value
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)login{    
  //  [self performSegueWithIdentifier:@"login" sender:self];
    Functions *login = [[Functions alloc] init];
    NSString *key = @"1011240748";
    NSString *auth = [login httprequest:@"name,password,key" :[NSString stringWithFormat:@"%@,%@,%@", username1, password1, key] :@"login.php"];
    if([auth isEqualToString:@"granted"]) {
        preferences = [NSUserDefaults standardUserDefaults];
        [preferences setObject:username1 forKey:@"username"];
    //    [preferences synchronize];
        [self performSegueWithIdentifier:@"login" sender:self];
        _error.text = @"";
        //set preferences
    }
    else if([auth isEqualToString:@"denied"]) _error.text = @"Wrong combination of username/password";

}
-(void)signup{
    [self performSegueWithIdentifier:@"signup" sender:self];
}
-(void)forgot_password{
    [self performSegueWithIdentifier:@"forgot" sender:self];
}

/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"login"]){
        MainMenu *destViewController = segue.destinationViewController;
        destViewController.name=@"Stuff";
    }
} */
-(void)viewDidAppear:(BOOL)animated{
   // if(registered==1) [self performSegueWithIdentifier:@"login" sender:self];
    //else if password correct [self performSegueWithIdentifier:@"login" sender:self];
    //else wrong password
    preferences = [NSUserDefaults standardUserDefaults];
    Functions *hasProfession = [[Functions alloc] init];
    if([preferences objectForKey:@"username"] != nil){
        int profession = [[hasProfession httprequest:@"name" :[preferences objectForKey:@"username"] :@"checkProfession.php"] intValue];
        int faction = [[hasProfession httprequest:@"name" :[preferences objectForKey:@"username"] :@"checkFaction.php"] intValue];
        if([preferences objectForKey:@"hasProfession"] != nil || profession != 0){
            if([preferences objectForKey:@"hasProfession"] == nil && faction != 0){[preferences setInteger:1 forKey:@"hasProfession"];
                [preferences setInteger:1 forKey:@"hasFaction"];
                [self performSegueWithIdentifier:@"login" sender:self];}
            else if([preferences objectForKey:@"hasFaction"] == nil && faction != 0){
                [preferences setInteger:1 forKey:@"hasFaction"];
                [self performSegueWithIdentifier:@"login" sender:self];
            }
            else if([preferences objectForKey:@"hasFaction"] != nil) [self performSegueWithIdentifier:@"login" sender:self];
            else [self performSegueWithIdentifier:@"faction2" sender:self];
        }
        //else if(profession != 0)[self performSegueWithIdentifier:@"faction2" sender:self];
        else [self performSegueWithIdentifier:@"profession" sender:self];
    }else{
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGSize screenSize = screenBound.size;
        int offset = 0;
        [_connecting removeFromSuperview];
        if (screenSize.height >= 812) offset = 60;
        
        Button* login = [[Button alloc] init];
        login.name = @"Login";
        [self.view addSubview:[login button: CGRectMake(screenSize.width/2-100, screenSize.height/1.28-125-offset, 100, 40.0)]];
        
        Button *register1 = [[Button alloc] init];
        register1.name = @"Signup";
        [self.view addSubview:[register1 button: CGRectMake(screenSize.width/2+5, screenSize.height/1.28 - 125-offset, 110.0, 40.0)]];
        
        Button *forgot = [[Button alloc] init];
        forgot.name = @"Forgot Password";
        [self.view addSubview:[forgot button2: CGRectMake(screenSize.width/2-100, screenSize.height/1.28 - 80-offset, 215.0, 20.0)]];
        preferences = [NSUserDefaults standardUserDefaults];
        printf("%s", [[preferences stringForKey:@"username"] UTF8String]);
        
        [self.view endEditing:YES];
    }
    printf("%s", [[preferences stringForKey:@"hasProfession"] UTF8String]);
}
//FIX MINIMIZE KEYBOARD AND PROFESSION

//ADD hasPROFESSION column in users
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
