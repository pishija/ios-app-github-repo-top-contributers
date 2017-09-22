//
//  GHApiManager.h
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface GHApiManager : AFHTTPSessionManager

- (void)fetchContributorsForRepo:(NSString *)repo
                           owner:(NSString *)owner
                            page:(NSInteger)page
                 completionBlock:(void (^)(NSArray *users, NSError *error))completionBlock;
@end
