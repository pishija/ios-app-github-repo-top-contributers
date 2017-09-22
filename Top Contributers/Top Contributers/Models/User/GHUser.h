//
//  TCUser.h
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import <Foundation/Foundation.h>

//For the sake of the example mapping from snake_case to camelCase is skipped.

@interface GHUser : NSObject

@property (nonatomic, copy) NSString *login;
@property (nonatomic) NSInteger *uid; //Map from id to uid because id is reserved word
@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, copy) NSString *gravatar_id;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *html_url;
@property (nonatomic, copy) NSString *followers_url;
@property (nonatomic, copy) NSString *following_url;
@property (nonatomic, copy) NSString *gists_url;
@property (nonatomic, copy) NSString *starred_url;
@property (nonatomic, copy) NSString *subscriptions_url;
@property (nonatomic, copy) NSString *organizations_url;
@property (nonatomic, copy) NSString *repos_url;
@property (nonatomic, copy) NSString *events_url;
@property (nonatomic, copy) NSString *received_events_url;
@property (nonatomic, copy) NSString *type; //This field should be enum in the future
@property (nonatomic) BOOL site_admin;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *blog;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *email;
@property (nonatomic) BOOL hireable;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic) NSInteger public_repos;
@property (nonatomic) NSInteger public_gists;
@property (nonatomic) NSInteger followers;
@property (nonatomic) NSInteger following;
@property (nonatomic, copy) NSDate *created_at;
@property (nonatomic, copy) NSDate *updated_at;

- (void)fillWithDummy;

@end
