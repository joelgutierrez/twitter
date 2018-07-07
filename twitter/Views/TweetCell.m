//
//  TweetCell.m
//  twitter
//
//  Created by Joel Gutierrez on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void) setTweet:(Tweet *)tweet{
     _tweet = tweet;
    self.nameLabel.text = tweet.user.name;
    [self.userImage setImageWithURL:tweet.user.imageUserURL];
    self.timeLabel.text = tweet.createdAtString;
    self.usernameLabel.text = [NSString stringWithFormat:@"@%@", tweet.user.screenName];
    self.descriptionTweetLabel.text = tweet.text;
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    self.likedCountLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
    
    if (self.tweet.favorited) {
        self.likeButton.selected = YES;
    } else {
        self.likeButton.selected = NO;
    }
    
    if(self.tweet.retweeted) {
        self.retweetButton.selected = YES;
    } else {
        self.retweetButton.selected = NO;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
}

#pragma mark - favoriting / unfavoriting

- (IBAction)didTapFavorite:(id)sender{
    [self updateFavoriteInfo:self.tweet.favorited];
    [self checkFavoritedSuccess];
}

- (void) updateFavoriteInfo:(BOOL)isFavorited{
    if (isFavorited) {
        self.tweet.favoriteCount -= 1;
        self.tweet.favorited = NO;
        self.likeButton.selected = NO;
    } else {
        self.tweet.favoriteCount += 1;
        self.tweet.favorited = YES;
        self.likeButton.selected = YES;
    }
    self.likedCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
}

- (void) checkFavoritedSuccess{
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
    }];
}

#pragma mark - retweeting / unretweeting

- (IBAction)didTapRetweet:(id)sender{
    [self updateRetweetInfo:self.tweet.retweeted];
    [self checkRetweetedSuccess];
}

- (void) checkRetweetedSuccess{
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error retweeting: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
        }
    }];
}

- (void) updateRetweetInfo:(BOOL)isRetweeted{
    if(isRetweeted){
        self.tweet.retweetCount -= 1;
        self.tweet.retweeted = NO;
        self.retweetButton.selected = NO;
    } else {
        self.tweet.retweetCount += 1;
        self.tweet.retweeted = YES;
        self.retweetButton.selected = YES;
    }
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
}

@end
