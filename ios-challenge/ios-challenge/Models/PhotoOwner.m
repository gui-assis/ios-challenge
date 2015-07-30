//
//  PhotoOwner.m
//  ios-challenge
//
//  Created by Guilherme Augusto on 30/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "PhotoOwner.h"

@implementation PhotoOwner

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"nsid": @"nsid",
             @"iconServer": @"iconserver",
             @"iconFarm": @"iconfarm"
             };
}

- (NSString *)getUserPhotoUrl {
    return [NSString stringWithFormat: @"http://farm%@.staticflickr.com/%@/buddyicons/%@.jpg", [self iconFarm], [self iconServer], [self nsid]];
}

@end
