//
//  GHApiManager.m
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import "GHApiManager.h"
#import <AFNetworkActivityIndicatorManager.h>
#import "GHUser.h"

@implementation GHApiManager

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self  = [super initWithBaseURL:url];
    if(self)
    {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    }
    return self;
}

#pragma mark - Public

- (void)fetchContributorsForRepo:(NSString *)repo
                           owner:(NSString *)owner
                            page:(NSInteger)page
                 completionBlock:(void (^)(NSArray *users, NSError *error))completionBlock{
    
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"/repos/%@/%@/contributors",owner, repo];
    
    NSDictionary *params = @{@"page": @(page)};
    
    [self GET:requestString
   parameters:params
     progress:nil
      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          NSError *error = nil;
          NSArray *users = [GHUser arrayOfModelsFromDictionaries:responseObject error:&error];
          if(error == nil){
              completionBlock(users, nil);
          } else {
              completionBlock(nil, error);
          }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionBlock(nil, error);
    }];
}

@end
