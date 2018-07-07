# Twitter

### Starter project
The starter project can be found in the `starter-project` tag. Download and run `pod install`.

### Notes
https://paper.dropbox.com/doc/Twitter--ADuVCVvwop_njSNAbUU96Q2VAQ-g255BPX3K4X7G0reYOWCI

# Project 4 - *Twitter*

**Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).
Time spent: **26** hours spent in total

## User Stories
The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen
- [x] User can sign in using OAuth login flow
- [x] User can Logout
- [x] User can view last 20 tweets from their home timeline
- [x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [x] User can pull to refresh.
- [x] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [x] User can compose a new tweet by tapping on a compose button.
- [x] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation.
- [x] The current signed in user will be persisted across restarts

The following **optional** features are implemented:

- [] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [] User can view their profile in a *profile tab*
- Contains the user header view: picture and tagline
- Contains a section with the users basic stats: # tweets, # following, # followers
- [] Profile view should include that user's timeline
- [x] User should display the relative timestamp for each tweet "8m", "7h"
- [x] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [] Links in tweets are clickable.
- [] User can tap the profile image in any tweet to see another user's profile
- Contains the user header view: picture and tagline
- Contains a section with the users basic stats: # tweets, # following, # followers
- [] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [x] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 140) (**1 point**)
- [x] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet (**2 points**)
- [] User sees embedded images in tweet if available 
- [] User can switch between timeline, mentions, or profile view through a tab bar (**3 points**)
- [] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)


The following **additional** features are implemented:

- [x] refactored my code. not an app implementation but noteworthy?!
- [x] prepended screenname with "@" when displaying in home timeline
- [x] autolayout for compose view tweet

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):
1. how to go about setting up, from scratch, working with a new api
2. i liked working with autolayout, but i would want to know some additional features.

## Video Walkthrough
Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/taqUjd1.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
Spent a good while trying to debug something that was actually working.
Hence no debugging was necessary.
Was a little tough at the start, due to the amount of files, keeping track of the program flow.

## Credits
[DateTools](github.com/MatthewYork/DateTools) - data formatting library
[Twitter API](developer.twitter.com/en/docs.html) - Twitter API library
[AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License
Copyright [2018] [Joel Gutierrez]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
