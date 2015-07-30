//
//  PhotoOwner.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 30/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface PhotoOwner : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic) NSString *nsid;
@property (copy, nonatomic) NSString *iconServer;
@property (copy, nonatomic) NSString *iconFarm;


@end
