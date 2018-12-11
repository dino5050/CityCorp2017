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
@property (weak, nonatomic) IBOutlet UITextView *errorCharacters;


@end
NSString *username;
NSString *password;
NSString *password2;
NSString *email;
NSUserDefaults *preferences2;


@implementation Signup
- (IBAction)username:(UITextField *)sender {
    username = sender.text;
    if(username.length < 4) _error.text = @"Too few characters";
    else if(username.length > 17) _error.text = @"Too many characters";
    else _error.text = @"";
}
- (IBAction)password:(UITextField *)sender {
    password = sender.text;
    if(password.length < 4) _errorPassword.text = @"Too few characters";
    else if(password.length > 17) _errorPassword.text = @"Too many characters";
    else _errorPassword.text = @"";
}
- (IBAction)password2:(UITextField *)sender {
    password2 = sender.text;
    if(![password isEqualToString:password2]){
        _errorPassword2.text = @"Passwords don't match";
    }else _errorPassword2.text = @"";
}
- (IBAction)email:(UITextField *)sender {
    email = sender.text;
    if(email.length < 4) _errorEmail.text = @"Too few characters";
    else if(email.length > 32) _errorEmail.text = @"Too many characters";
    else _errorEmail.text = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _errorPassword.text = @"Letters / numbers only";
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
    _errorCharacters.text = @"";
 //   ENCRYPT password
    NSString *key = @"1011240748";
 //   [self performSegueWithIdentifier:@"register" sender:self];
    Functions *users = [[Functions alloc] init];
    NSString *msg;
    if(username.length > 3 && username.length < 17 && password.length > 3 && password.length < 17 && [password isEqualToString:password2] && email.length > 3 && email.length < 32 && [username rangeOfString:@"#"].location == NSNotFound) {
        msg = [users httprequest:@"name,password,email,key" :[NSString stringWithFormat:@"%@,%@,%@,%@", username, password, email, key] :@"users.php"];
    }
    if([msg isEqualToString:@"usernameTaken"]) _error.text = @"Username taken";
    else if([msg isEqualToString:@"emailTaken"]) _errorEmail.text = @"Email already exists";
    else if([msg isEqualToString:@"illegalUsername"]) _error.text = @"Illegal characters used";
    else if([msg isEqualToString:@"illegalPassword"]) _errorPassword.text = @"Illegal characters used";
    else if([msg isEqualToString:@"illegalEmail"]) _errorEmail.text = @"Illegal characters used";
    else if([msg isEqualToString:@"accepted"]){
        [self performSegueWithIdentifier:@"register" sender:self];
        preferences2 = [NSUserDefaults standardUserDefaults];
        [preferences2 setObject:username forKey:@"username"];
        _errorPassword.text = @"Letters / numbers only";
    }
    else _errorCharacters.text = @"Illegal characters used"; //Check all illegal characters!
    
    //   printf("%s", [msg UTF8String]);
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
