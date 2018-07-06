//
//  Tweet.m
//  twitter
//
//  Created by Joel Gutierrez on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        NSDictionary *originalTweet = dictionary[@"retweeted_status"];
        [self ifRetweet:originalTweet :dictionary];
        [self setProperties:dictionary];
    }
    return self;
}

- (void) ifRetweet:(NSDictionary *)originalTweet :(NSDictionary *)dictionary{
    if(originalTweet != nil){
        NSDictionary *userDictionary = dictionary[@"user"];
        self.retweetedByUser = [[User alloc] initWithDictionary:userDictionary];
        dictionary = originalTweet;
    }
}

- (void) setProperties:(NSDictionary *)dictionary {
    self.idStr = dictionary[@"id_str"];
    self.text = dictionary[@"text"];
    self.favoriteCount = [dictionary[@"favorite_count"] intValue];
    self.favorited = [dictionary[@"favorited"] boolValue];
    self.retweetCount = [dictionary[@"retweet_count"] intValue];
    self.retweeted = [dictionary[@"retweeted"] boolValue];
    self.replyCount = [dictionary[@"reply_count"] intValue];
    self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
    NSString *createdAtOriginalString = dictionary[@"created_at"];
    [self formatAndSetString:createdAtOriginalString];
}

- (void) formatAndSetString:(NSString *)createdAtOriginalString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    NSDate *date = [formatter dateFromString:createdAtOriginalString];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    self.createdAtString = [formatter stringFromDate:date];
}

+ (NSMutableArray *) tweetsWithArray:(NSArray *)dictionaries {
    NSMutableArray *tweets = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Tweet *tweet = [[Tweet alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
    return tweets;
}

@end
