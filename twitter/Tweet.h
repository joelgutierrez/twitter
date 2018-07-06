//
//  Tweet.h
//  twitter
//
//  Created by Joel Gutierrez on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) User *retweetedByUser;
@property (strong, nonatomic) NSString *idStr; // For fav'ing, retweeting, replying
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *createdAtString;
@property (nonatomic) int favoriteCount; //update fav count label
@property (nonatomic) int replyCount;
@property (nonatomic) int retweetCount; // Update fav count label
@property (nonatomic) BOOL favorited; // Config favorite button
@property (nonatomic) BOOL retweeted; // Config retweet button

+ (NSMutableArray *) tweetsWithArray:(NSArray *)dictionaries;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
