//
//  CommentCell.m
//  ios-challenge
//
//  Created by Guilherme Augusto on 29/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (void)awakeFromNib {
    self.imageUser.layer.cornerRadius = self.imageUser.bounds.size.width/2;
    self.imageUser.layer.masksToBounds = YES;
    self.imageUser.layer.borderWidth = 1;
    self.imageUser.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageUser.layer.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
