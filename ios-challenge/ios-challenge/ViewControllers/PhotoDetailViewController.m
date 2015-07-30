//
//  PhotoDetailViewController.m
//  ios-challenge
//
//  Created by Guilherme Augusto on 16/06/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "Comment.h"

@interface PhotoDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *labelPhotoName;
@property (strong, nonatomic) IBOutlet UILabel *labelOwnerName;
@property (strong, nonatomic) IBOutlet UIImageView *ownerImage;
@property (strong, nonatomic) IBOutlet UIImageView *imagePhoto;
@property (strong, nonatomic) IBOutlet UITableView *commentsTable;
@property (nonatomic, strong) PhotoService *photoService;
@property (nonatomic, strong) MBProgressHUD *hud;
@property (strong, nonatomic) IBOutlet UILabel *labelCommentsQuant;

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"Carregando";
    
    [self.hud show:YES];
    
    self.photoService = [PhotoService new];
    self.photoService.delegate = self;
    
    [self.photoService loadPhotoDetails:self.photo];
    
    self.commentsTable.delegate = self;
    self.commentsTable.dataSource = self;
    
    self.labelPhotoName.text = self.photo.title;
    self.labelOwnerName.text = self.photo.ownerName;
    
    self.ownerImage.layer.cornerRadius = self.ownerImage.bounds.size.width/2;
    self.ownerImage.layer.masksToBounds = YES;
    self.ownerImage.layer.borderWidth = 2;
    self.ownerImage.layer.borderColor = [UIColor whiteColor].CGColor;
    self.ownerImage.layer.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2].CGColor;
    
    NSURL *photoUrl = [NSURL URLWithString:self.photo.photoUrl];
    
    [self.imagePhoto setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
    
    Comment *comment = [self.photo.photoDetail.comments objectAtIndex:indexPath.row];
    
    NSURL *photoUrl = [NSURL URLWithString:[comment userUrl]];
    [cell.imageUser  setImageWithURL:photoUrl];
    
    cell.labelComment.text = comment.text;
    cell.labelUserName.text = comment.realName;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.photo.photoDetail.comments count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark - PhotoService

-(void)didLoadPhotos:(NSArray *)photos{
    
}

-(void)didLoadPhotoDetails:(Photo *)photo{
    
    self.photo = photo;
    
    NSURL *ownerImageUrl = [NSURL URLWithString:[NSString stringWithFormat: @"http://farm%@.staticflickr.com/%@/buddyicons/%@.jpg", photo.photoDetail.photoOwner.iconFarm, photo.photoDetail.photoOwner.iconServer, photo.photoDetail.photoOwner.nsid]];
    
    [self.ownerImage setImageWithURL:ownerImageUrl];

    self.labelCommentsQuant.text = [NSString stringWithFormat:@"%lu comments", (unsigned long)[photo.photoDetail.comments count]];
    
    [self.commentsTable reloadData];
    
    [self.hud hide:YES];
}

@end
