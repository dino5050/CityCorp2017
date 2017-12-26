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

int login = 1;
int registered = 1;
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
    
 /*   NSString *url = @"http://collegeparkingfinder.com/fiuparkingmonitor/get_color3.php?";

    NSString *color;
    NSString *fullURL = [[NSString alloc] initWithFormat:@"%@time=%@&table=%@",url,hour1,table];
    NSMutableArray *color1 = [[NSMutableArray alloc] initWithCapacity:numColors-1];
        NSURLRequest * urlRequest2 = [NSURLRequest requestWithURL:[NSURL URLWithString: fullURL]];
        NSURLResponse *response2;
        NSError *error2;
        NSError __block *err2 = NULL;
        NSData __block *data2;
        BOOL __block reqProcessed2 = false;
        NSURLResponse __block *resp2;
        
        [[[NSURLSession sharedSession] dataTaskWithRequest:urlRequest2 completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable _response, NSError * _Nullable _error) {
            resp2 = _response;
            err2 = _error;
            data2 = _data;
            reqProcessed2 = true;
        }] resume];
        
        while (!reqProcessed2) {
            [NSThread sleepForTimeInterval:0];
        }
        
        response2 = resp2;
        error2 = err2;
        color = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
        @try{NSArray *colors = [ color componentsSeparatedByString: @","];
            for(int i = 0; i<numColors; i++){
                color1[i] = colors[i];
            }}@catch(NSException *error){}
        */
//add register button and ifregistered vdefault value
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;

    Button *login = [[Button alloc] init];
    login.name = @"login";
    [self.view addSubview:[login button: CGRectMake(screenSize.width/2-120, screenSize.height/1.28-125, 120, 40.0)]];
  
    Button *register1 = [[Button alloc] init];
    register1.name = @"Sign Up";
    [self.view addSubview:[register1 button: CGRectMake(screenSize.width/2+5, screenSize.height/1.28 - 125, 130.0, 40.0)]];
  
}

-(void)login{
    
    [self performSegueWithIdentifier:@"login" sender:self];
}
-(void)map{
    [self performSegueWithIdentifier:@"map" sender:self];
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
