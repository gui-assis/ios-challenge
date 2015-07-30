//
//  PhotoService.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 29/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objectiveflickr/ObjectiveFlickr.h>

#import "Photo.h"
#import "PhotoOwner.h"
#import "PhotoDetail.h"
#import "Comment.h"

@protocol PhotoServiceDelegate <NSObject>

-(void) didLoadPhotos:(NSArray*) photos;
-(void) didLoadPhotoDetails:(Photo*) photo;

@end

@interface PhotoService : NSObject<OFFlickrAPIRequestDelegate>

@property (nonatomic) id <PhotoServiceDelegate> delegate;

- (void) getRecentPhotosWithPage:(int) page;
- (void) loadPhotoDetails:(Photo*) photo;

@end
