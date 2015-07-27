//
//  ImageCell.h
//  ios-challenge
//
//  Created by Guilherme Augusto on 26/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelSubTitle;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;

@end
