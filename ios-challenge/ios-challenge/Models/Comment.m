//
//  Comment.m
//  ios-challenge
//
//  Created by Guilherme Augusto on 30/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "Comment.h"

@implementation Comment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"authorId": @"author",
             @"authorName": @"authorname",
             @"iconServer": @"iconserver",
             @"iconFarm": @"iconfarm",
             @"realName":@"realname",
             @"text": @"_text"
             };
}

- (NSString *)userUrl {
    return [NSString stringWithFormat: @"http://farm%@.staticflickr.com/%@/buddyicons/%@.jpg", [self iconFarm], [self iconServer], [self authorId]];
}

@end
