//
//  Photo.m
//  ios-challenge
//
//  Created by Guilherme Augusto on 29/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "Photo.h"

@implementation Photo

+(NSDictionary *)JSONKeyPathsByPropertyKey{
    
    return @{
             @"farm": @"farm",
             @"photoId": @"id",
             @"ownerId": @"owner",
             @"secret": @"secret",
             @"server": @"server",
             @"title": @"title",
             @"thumbNailUrl": @"url_t",
             @"ownerName": @"ownername",
             @"photoUrl": @"url_m"
             };
}

-(void)loadPhotoDetails{
    
}

@end
