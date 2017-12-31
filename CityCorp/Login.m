//
//  Login.m
//  CityCorp
//
//  Created by Dino Martinez on 12/12/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "Login.h"
#import "MainMenu.h"
#import "Hexagon.h"
#import "Button.h"
@interface Login ()
@property (weak, nonatomic) IBOutlet UITextField *username;

@end

@implementation Login
/*- (IBAction)Button:(UIButton *)sender {
    [self performSegueWithIdentifier:@"main" sender:self];
}
*/

//int login = 1;
int registered = 1;
Button* login;
- (IBAction)username:(UITextField *)sender {
    if(_username.text.length < 20){
        //use and update textfield 'too many chars'
     //   [self performSegueWithIdentifier:@"map" sender:nil];
    }
}
- (IBAction)password:(UITextField *)sender {
    if(_username.text.length < 20){
        //use and update textfield 'too many chars'

    }
}


/*-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([identifier isEqualToString:@"login"] && login == 1) return YES;
    return NO;
} */


- (void)viewDidLoad {
    [super viewDidLoad];
    

//add register button and ifregistered vdefault value
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;

    Button* login = [[Button alloc] init];
    login.name = @"login";
    [self.view addSubview:[login button: CGRectMake(screenSize.width/2-100, screenSize.height/1.28-125, 100, 40.0)]];
  
    Button *register1 = [[Button alloc] init];
    register1.name = @"signup";
    [self.view addSubview:[register1 button: CGRectMake(screenSize.width/2+5, screenSize.height/1.28 - 125, 110.0, 40.0)]];
  
}

-(void)login{    
    [self performSegueWithIdentifier:@"login" sender:self];
}
-(void)signup{
    [self performSegueWithIdentifier:@"register" sender:self];
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
