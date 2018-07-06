//
//  TweetCell.m
//  twitter
//
//  Created by Joel Gutierrez on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void) setTweet:(Tweet *)tweet {
     _tweet = tweet;
    self.nameLabel.text = tweet.user.name;
    //self.userAndTimeStamp =
    self.usernameLabel.text = tweet.user.screenName;
    self.descriptionTweetLabel.text = tweet.text;
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    self.likedCountLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
   
    
    if (self.tweet.favorited) {
        self.likeButton.selected = YES;
    } else {
        self.likeButton.selected = NO;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited) {
        self.tweet.favoriteCount -= 1;
        self.tweet.favorited = NO;
        self.likeButton.selected = NO;
    } else {
        self.tweet.favoriteCount += 1;
        self.tweet.favorited = YES;
        self.likeButton.selected = YES;
    }

    [self refreshData];
    
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
    }];
}

- (IBAction)didTapRetweet:(id)sender {
    if (self.tweet.retweeted) {
        self.tweet.retweetCount -= 1;
        self.tweet.retweeted = NO;
        self.retweetButton.selected = NO;
    } else {
        self.tweet.retweetCount += 1;
        self.tweet.retweeted = YES;
        self.retweetButton.selected = YES;
    }
    
    [self refreshData];
    
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error retweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
        }
    }];
}


- (void) refreshData {
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.likedCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    //update timestamp
}

@end
