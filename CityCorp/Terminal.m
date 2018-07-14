//
//  Terminal.m
//  CityCorp
//
//  Created by Dino Martinez on 2/6/18.
//  Copyright © 2018 Nezennin Corp. All rights reserved.
//

#import "Terminal.h"
#import "Button.h"
@import GoogleMobileAds;
#import "Functions.h"

@interface Terminal () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation Terminal

static UIView *panel;
static NSArray *array2;
static NSArray *array3;
static int iD;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    Button* back = [[Button alloc] init];
    back.name = @"back";
    [self.view addSubview:[back back: CGRectMake(10, 40, 55, 50.0)]];
    
    
    
    
    /*   Button* space = [[Button alloc] init];
     space.name = @"";
     [self.view addSubview:[space button2: CGRectMake(10+87+67+70+70, 40, screenSize.width-(10+87+67+70+70+10), 50.0)]];
     */
    if(screenSize.height >= 812) panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50-50)];
    else panel = [[UIView alloc] initWithFrame:CGRectMake(10, 55+40, screenSize.width-10-10, screenSize.height-55-40-50)];
    [panel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:255]];
    panel.layer.borderWidth = 2.0f;
    panel.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255].CGColor;
    [self.view addSubview:panel];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(panel.frame.size.width/2-250/2,40,250,300) collectionViewLayout:layout];
    [collectionView setDataSource:self];
    [collectionView setDelegate:self];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [collectionView setBackgroundColor:[UIColor blackColor]];
    Functions *terminal = [[Functions alloc] init];
    NSString *players;
    iD = 0;
    @try{players = [terminal httprequest:@"id" :[NSString stringWithFormat:@"%d",iD] :@"terminal.php"];
    }@catch(NSException *error){}
    array2 = [players componentsSeparatedByString:@"|"];
    
    [panel addSubview: collectionView];
    
    self.bannerView = [[GADBannerView alloc]
                       initWithAdSize:kGADAdSizeBanner];
    
    [self addBannerViewToView:_bannerView];
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return array2.count-1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor blackColor];
    
    UIImage *player = [UIImage imageNamed:@"avatar.png"];
    UIImageView *icon = [[UIImageView alloc] initWithImage:player];
    [icon setFrame:CGRectMake(5, 0, 40, 40)];
    NSLog(@"|||||||||%lu", array2.count);
    NSString *chars = array2[indexPath.item];
    array3 = [chars componentsSeparatedByString:@","];
    
    UITextView *name = [[UITextView alloc] initWithFrame:CGRectMake(0, 30, 50, 20)];
    name.textColor = [UIColor whiteColor];
    name.editable = NO;
    [name setFont: [UIFont fontWithName:@"Arial" size:10]];
    [name setText:array3[0]];
    name.textAlignment=NSTextAlignmentCenter;
    name.backgroundColor = [UIColor clearColor];
 //   [icon contentMode];
    [cell.contentView addSubview:icon];
    [cell.contentView addSubview:name];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(50, 50);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"title of cell %@", @"player");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)back{
    [self dismissViewControllerAnimated:false completion:nil];
    
}
- (void)addBannerViewToView:(UIView *)bannerView {
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.bottomLayoutGuide
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0]
                                ]];
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
