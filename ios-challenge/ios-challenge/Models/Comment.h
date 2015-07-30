//
//  Comment.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 30/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface Comment : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic) NSString *authorId;
@property (copy, nonatomic) NSString *authorName;
@property (copy, nonatomic) NSString *iconServer;
@property (copy, nonatomic) NSString *iconFarm;
@property (copy, nonatomic) NSString *realName;
@property (copy, nonatomic) NSString *text;

- (NSString *) userUrl;


@end
