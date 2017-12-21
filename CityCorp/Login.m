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

    Button *login = [[Button alloc] init];
    login.name = @"map";
    [self.view addSubview:[login button: CGRectMake(screenSize.width/2-160/2, screenSize.height/1.28, 160, 40.0)]];
    
    Button *register1 = [[Button alloc] init];
    register1.name = @"register";
    [self.view addSubview:[register1 button: CGRectMake(screenSize.width/2-180.0/2, screenSize.height/1.28 + 50, 180.0, 40.0)]];
  
}

-(void)login{
    
    [self performSegueWithIdentifier:@"login" sender:self];
}
-(void)map{
    [self performSegueWithIdentifier:@"map" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"login"]){
        MainMenu *destViewController = segue.destinationViewController;
        destViewController.name=@"Stuff";
    }
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
