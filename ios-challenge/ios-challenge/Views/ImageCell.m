//
//  ImageCell.m
//  ios-challenge
//
//  Created by Guilherme Augusto on 26/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "ImageCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ImageCell

- (void)awakeFromNib {
    self.photoImageView.layer.cornerRadius = 5;
    self.photoImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
