//
//  TCUser.m
//  Top Contributers
//
//  Created by Mihail Stevcev on 9/22/17.
//  Copyright © 2017 Rumberos. All rights reserved.
//

#import "GHUser.h"

@implementation GHUser


+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"uid": @"id",
                                                                  }];
}

- (void)fillWithDummy{
    self.name = @"Test";
    self.login = @"Testisov";
}

@end
