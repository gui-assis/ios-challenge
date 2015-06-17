//
//  AppDelegate.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 16/06/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objectiveflickr/ObjectiveFlickr.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) OFFlickrAPIContext *flickrAPIContext;

@end

