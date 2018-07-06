//
//  User.m
//  twitter
//
//  Created by Joel Gutierrez on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//
#import "User.h"

@implementation User

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.location = dictionary[@"description"];
        self.url = dictionary[@"url"];
        self.userDescription = dictionary[@"description"];
        self.protectedUser = dictionary[@"protected"];
        self.verifiedUser = dictionary[@"verified"];
        self.followersCount = [dictionary[@"followers_count"] intValue];
        self.friendsCount = [dictionary[@"friends_count"] intValue];
    }
    return self;
}

@end
