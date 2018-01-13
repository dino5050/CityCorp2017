//
//  Forgot.m
//  CityCorp
//
//  Created by Dino Martinez on 1/12/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Forgot.h"
#import "Button.h"
#import "Functions.h"
@interface Forgot ()
@property (weak, nonatomic) IBOutlet UITextView *error;

@end

@implementation Forgot
-(IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{}

- (IBAction)email:(UITextField *)sender {
    email1 = sender.text;
}
NSString *email1;

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    Button* forgot = [[Button alloc] init];
    forgot.name = @"recover_password";
    [self.view addSubview:[forgot button: CGRectMake(screenSize.width/2-110, screenSize.height/1.28-245, 220, 40.0)]];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)recover_password{
    //  [self performSegueWithIdentifier:@"login" sender:self];
    Functions *forgot = [[Functions alloc] init];
    NSString *key = @"1011240748";
    NSString *access = [forgot httprequest:@"email,key" :[NSString stringWithFormat:@"%@,%@", email1,key] :@"forgot.php"];
    if([access isEqualToString:@"emailFound"]) [self performSegueWithIdentifier:@"recovered" sender:self];
    else if([access isEqualToString:@"emailNotFound"]) _error.text = @"Email not found";

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
