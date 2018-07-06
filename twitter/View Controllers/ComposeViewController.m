//
//  ComposeViewController.m
//  twitter
//
//  Created by Joel Gutierrez on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *composeTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *tweetButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.composeTextView.delegate = self;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    int characterLimit = 140;
    NSString *newText = [self.composeTextView.text stringByReplacingCharactersInRange:range withString:text];
    
    if(self.composeTextView.text.length < 140){
        self.characterLabel.text = [NSString stringWithFormat:@"%lu", characterLimit-newText.length];
    } 
    return newText.length < characterLimit;
}

#pragma mark - navigation bar actions

- (IBAction)didTapClose:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)didTapPost:(id)sender {
    [[APIManager shared] postStatusWithText:self.composeTextView.text completion:(^(Tweet *tweet, NSError * error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
        }
    })];
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
