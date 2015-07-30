//
//  PhotoDetail.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 30/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>
#import "PhotoOwner.h"

@interface PhotoDetail : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) PhotoOwner *photoOwner;
@property (nonatomic, strong) NSMutableArray *comments;

@end
