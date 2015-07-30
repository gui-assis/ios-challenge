//
//  PhotoDetailViewController.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 16/06/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "UIImageView+AFNetworking.h"
#import "CommentCell.h"
#import "PhotoService.h"
#import "PhotoOwner.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface PhotoDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, PhotoServiceDelegate>

@property (nonatomic, strong) Photo *photo;

@end
