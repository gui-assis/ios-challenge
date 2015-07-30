//
//  PhotoListViewController.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 26/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoService.h"
#import "UIImageView+AFNetworking.h"

@interface PhotoListViewController : UITableViewController<PhotoServiceDelegate>

@end
