//
//  Tweet.h
//  twitter
//
//  Created by Joel Gutierrez on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "DateTools.h"

@interface Tweet : NSObject

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) User *retweetedByUser;
@property (strong, nonatomic) NSString *idStr;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *createdAtString;
@property (nonatomic) int favoriteCount;
@property (nonatomic) int replyCount;
@property (nonatomic) int retweetCount;
@property (nonatomic) BOOL favorited;
@property (nonatomic) BOOL retweeted;

+ (NSMutableArray *) tweetsWithArray:(NSArray *)dictionaries;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
