//
//  PhotoListViewController.m
//  ios-challenge
//
//  Created by Guilherme Augusto on 26/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "PhotoListViewController.h"
#import "AppHelper.h"
#import "ImageCell.h"
#import "Photo.h"
#import "PhotoDetailViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface PhotoListViewController ()

@property (nonatomic, strong) NSMutableArray *arrayPhotos;
@property (nonatomic) int currentPage;
@property (nonatomic, strong) PhotoService *photoService;
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation PhotoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"Carregando";
    
    [self.hud show:YES];
    
    self.photoService = [PhotoService new];
    self.photoService.delegate = self;
    
    self.currentPage = 1;
    
    self.arrayPhotos = [NSMutableArray new];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

-(void)viewDidAppear:(BOOL)animated{
    [self loadPhotos];
}

-(void) loadPhotos{
    [self.photoService getRecentPhotosWithPage:self.currentPage];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segueToPhotoDetail"]) {
        PhotoDetailViewController *photoDetailVC = (PhotoDetailViewController*) segue.destinationViewController;
        photoDetailVC.photo = (Photo*) sender;
    }
}

#pragma mark - PhotoServiceDelegate

-(void)didLoadPhotos:(NSArray *)photos{
    [self.hud hide:YES];
    [self.arrayPhotos addObjectsFromArray:photos];
    [self.tableView reloadData];
}

-(void)didLoadPhotoDetails:(PhotoDetail *)photoDetail{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayPhotos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    Photo *photo = [self.arrayPhotos objectAtIndex:indexPath.row];
    
    NSURL *photoUrl = [NSURL URLWithString:photo.thumbNailUrl];
    
    [cell.photoImageView setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cell.labelTitle.text = photo.title;
    cell.labelSubTitle.text = photo.ownerName;
    
    if (indexPath.row == [self.arrayPhotos count] - 1)
    {
        self.currentPage++;
        [self loadPhotos];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.hud show:YES];
    Photo *photo = [self.arrayPhotos objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"segueToPhotoDetail" sender:photo];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
