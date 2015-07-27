//
//  AppHelper.m
//  ios-challenge
//
//  Created by Guilherme Augusto on 16/06/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper

+(OFFlickrAPIContext *)getFlickrContext{
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    return delegate.flickrAPIContext;
    
}

+(NSString *)getAPIKey{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    return delegate.apiKey;
}


+(NSString *)getAPISecretKey{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    return delegate.apiSecretKey;
}

@end
