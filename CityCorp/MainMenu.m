//
//  MainMenu.m
//  CityCorp
//
//  Created by Dino Martinez on 12/13/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "MainMenu.h"
#import "Button.h"
//#import <QuartzCore/QuartzCore.h>

@interface MainMenu ()

@end

@implementation MainMenu

-(IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    Button* terminal = [[Button alloc] init];
    terminal.name = @"terminal";
    [self.view addSubview:[terminal button2: CGRectMake(10, 40, 85, 50.0)]];
    
    Button* map = [[Button alloc] init];
    map.name = @"map";
    [self.view addSubview:[map button2: CGRectMake(10+87, 40, 65, 50.0)]];
    
    Button* market = [[Button alloc] init];
    market.name = @"market";
    [self.view addSubview:[market button2: CGRectMake(10+87+67, 40, 68, 50.0)]];
    
    Button* social = [[Button alloc] init];
    social.name = @"social";
    [self.view addSubview:[social button2: CGRectMake(10+87+67+70, 40, 68, 50.0)]];
    
    Button* space = [[Button alloc] init];
    space.name = @"";
    [self.view addSubview:[space button2: CGRectMake(10+87+67+70+70, 40, screenSize.width-(10+87+67+70+70+10), 50.0)]];
    
    UIView *panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50)];
    [panel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    panel.layer.borderWidth = 2.0f;
    panel.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [self.view addSubview:panel];
}
-(void)viewDidAppear:(BOOL)animated{
    //load data from default values (username)
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
