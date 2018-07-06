//
//  User.h
//  twitter
//
//  Created by Joel Gutierrez on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+AFNetworking.h"

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImageView *userImage;
@property (strong, nonatomic) NSURL *imageUserURL;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *userDescription;
@property (nonatomic) BOOL protectedUser;
@property (nonatomic) BOOL verifiedUser;
@property (nonatomic) int followersCount;
@property (nonatomic) int friendsCount;

- (instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end
