//
//  ComposeViewController.h
//  twitter
//
//  Created by Joel Gutierrez on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@protocol ComposeViewControllerDelegate

- (void)didTweet:(Tweet *)tweet;

@end

@interface ComposeViewController : UIViewController

@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *characterLabel;

@end


