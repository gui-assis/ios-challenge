//
//  Photo.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 29/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

#import "PhotoOwner.h"
#import "PhotoDetail.h"

@interface Photo : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *farm;
@property (nonatomic, strong) NSString *photoId;
@property (nonatomic, strong) NSString *ownerId;
@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *server;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *thumbNailUrl;
@property (nonatomic, strong) NSString *photoUrl;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, strong) NSString *ownerUrl;

@property (nonatomic, strong) PhotoDetail *photoDetail;

-(void) loadPhotoDetails;

@end
