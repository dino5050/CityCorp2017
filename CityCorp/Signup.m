//
//  Signup.m
//  CityCorp
//
//  Created by Dino Martinez on 1/2/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Signup.h"
#import "Button.h"
#import "Functions.h"

@interface Signup ()

@property (weak, nonatomic) IBOutlet UITextView *error;

@property (weak, nonatomic) IBOutlet UITextView *errorPassword;
@property (weak, nonatomic) IBOutlet UITextView *errorPassword2;
@property (weak, nonatomic) IBOutlet UITextView *errorEmail;



@end
NSString *username;
NSString *password;
NSString *password2;
NSString *email;


@implementation Signup
- (IBAction)username:(UITextField *)sender {
    username = sender.text;
}
- (IBAction)password:(UITextField *)sender {
    password = sender.text;
}
- (IBAction)password2:(UITextField *)sender {
    password2 = sender.text;
    if(![password isEqualToString:password2]){
        _errorPassword2.text = @"Passwords don't match";
    }else _errorPassword2.text = @"";
}
- (IBAction)email:(UITextField *)sender {
    email = sender.text;
}








- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Button* next = [[Button alloc] init];
    next.name = @"next";
    [self.view addSubview:[next button: CGRectMake(180, 230, 100, 50.0)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)next{
   // _error.text = username;
    Functions *users = [[Functions alloc] init];
    [users httprequest:@"name,password,email" :[NSString stringWithFormat:@"%@,%@,%@", username, password, email] :@"users.php"];
    
    [self performSegueWithIdentifier:@"register" sender:self];
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
