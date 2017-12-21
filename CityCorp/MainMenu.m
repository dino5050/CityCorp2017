//
//  MainMenu.m
//  CityCorp
//
//  Created by Dino Martinez on 12/13/17.
//  Copyright © 2017 Nezennin Corp. All rights reserved.
//

#import "MainMenu.h"
//#import <QuartzCore/QuartzCore.h>

@interface MainMenu ()

@end

@implementation MainMenu

-(IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *map = [UIButton buttonWithType:UIButtonTypeCustom];
    [map addTarget:self action:@selector(NSNull) forControlEvents:UIControlEventTouchUpInside];
    [map setTitle:@"Map" forState:UIControlStateNormal];
    map.frame = CGRectMake(0, 0, 160.0, 40.0);
    [map setTitleColor:[UIColor colorWithRed:0 green:0 blue:255 alpha:255] forState:UIControlStateNormal];
    [map setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    map.layer.borderWidth = 2.0f;
    map.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    
    [self.view addSubview:map];
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
