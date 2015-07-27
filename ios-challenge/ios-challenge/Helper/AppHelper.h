//
//  AppHelper.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 16/06/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "AppDelegate.h"
#import <Foundation/Foundation.h>
#import <objectiveflickr/ObjectiveFlickr.h>

@interface AppHelper : NSObject

+(OFFlickrAPIContext*) getFlickrContext;

+(NSString*) getAPIKey;
+(NSString*) getAPISecretKey;

@end
