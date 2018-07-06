//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "ComposeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
//#import "UIImageView+AFNetworking.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *tweetsArray;
@property (weak, nonatomic) IBOutlet UITableView *timelineView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end


@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDataSourceAndDelegate];
    [self fetchTimeLineTweets];
    [self createRefreshControl];
}

- (void) setDataSourceAndDelegate {
    self.timelineView.delegate = self;
    self.timelineView.dataSource = self;
}

- (void) fetchTimeLineTweets {
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSMutableArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            self.tweetsArray = tweets;
            [self.timelineView reloadData];
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.refreshControl endRefreshing];
    }];
}

- (void) createRefreshControl {
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchTimeLineTweets) forControlEvents:UIControlEventValueChanged];
    [self.timelineView insertSubview:self.refreshControl atIndex:0];
}

#pragma mark - table view protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TweetCell *cell = [self.timelineView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    Tweet* tweet = self.tweetsArray[indexPath.row];
    cell.tweet = tweet;
    //cell.userImage.image = nil;
    return cell;
}

#pragma mark - compose tweet protocol

- (void)didTweet:(Tweet *)tweet {
    [self fetchTimeLineTweets];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Pass the selected object to the new view controller.
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
}

#pragma mark - logout actions

- (IBAction)tapLogoutAction:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];
}

@end
