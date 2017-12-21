//
//  Login.m
//  CityCorp
//
//  Created by Dino Martinez on 12/12/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "Login.h"
//#import "MainMenu.h"
#import "Hexagon.h"
#import "Button.h"
@interface Login ()
@property (weak, nonatomic) IBOutlet UITextField *username;

@end

@implementation Login
- (IBAction)Button:(UIButton *)sender {
    [self performSegueWithIdentifier:@"main" sender:self];
}

int login = 1;
int registered = 1;


/*-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([identifier isEqualToString:@"login"] && login == 1) return YES;
    return NO;
} */


- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 1500)];
    Hexagon *hexagon = [[Hexagon alloc] initWithFrame:CGRectMake(0, 0, 500, 1500)];
 //   [self.view addSubview:hexagon];
 //   hexagon.backgroundColor = [UIColor clearColor];
//add register button and ifregistered vdefault value
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
/*    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [login setTitle:@"Login" forState:UIControlStateNormal];
    login.frame = CGRectMake(screenSize.width/2-160/2, screenSize.height/1.28, 160, 40.0);
    [login setTitleColor:[UIColor colorWithRed:0 green:0 blue:255 alpha:255] forState:UIControlStateNormal];
    [login setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    login.layer.borderWidth = 2.0f;
    login.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [login.titleLabel setFont:[UIFont fontWithName:@"Abduction" size:20]];
    [self.view addSubview:login];
  */
    UIButton *register1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [register1 addTarget:self action:@selector(map) forControlEvents:UIControlEventTouchUpInside];
    [register1 setTitle:@"Register" forState:UIControlStateNormal];
    register1.frame = CGRectMake(screenSize.width/2-180.0/2, screenSize.height/1.28 + 50, 180.0, 40.0);
    [register1 setTitleColor:[UIColor colorWithRed:0 green:0 blue:255 alpha:255] forState:UIControlStateNormal];
    [register1 setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    register1.layer.borderWidth = 2.0f;
    register1.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [register1.titleLabel setFont:[UIFont fontWithName:@"Abduction" size:20]];
    [self.view addSubview:register1];
    
 //   [Button button: name:@"Login": CGRectMake(screenSize.width/2-160/2, screenSize.height/1.28, 160, 40.0)];
    Button *login = [[Button alloc] init];
    NSInteger x = 0;
    NSInteger y = 0;
    NSInteger width = 160;
    NSInteger height = 40;
    [login button: @"login" : &x : &y : &width : &height];
    [self.view addSubview:login];
    
}

-(void)login{
    [self performSegueWithIdentifier:@"mainmenu" sender:self];
}
-(void)map{
    [self performSegueWithIdentifier:@"map" sender:self];
}
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
