//
//  TCUser.h
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import <JSONModel/JSONModel.h>

//For the sake of the example mapping from snake_case to camelCase is skipped.

@interface GHUser : JSONModel

@property (nonatomic, copy) NSString *login;
@property (nonatomic) NSNumber *uid; //Map from id to uid because id is reserved word
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
@property (nonatomic, copy) NSString <Optional> *name;
@property (nonatomic, copy) NSString <Optional> *company;
@property (nonatomic, copy) NSString <Optional> *blog;
@property (nonatomic, copy) NSString <Optional> *location;
@property (nonatomic, copy) NSString <Optional> *email;
@property (nonatomic, copy) NSNumber <Optional> *hireable;
@property (nonatomic, copy) NSString <Optional> *bio;
@property (nonatomic, copy) NSNumber <Optional> *public_repos;
@property (nonatomic, copy) NSNumber <Optional> *followers;
@property (nonatomic, copy) NSNumber <Optional> *following;
@property (nonatomic, copy) NSString <Optional> *created_at;
@property (nonatomic, copy) NSString <Optional> *updated_at;

- (void)fillWithDummy;

@end
