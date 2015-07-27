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
#import "UIImageView+AFNetworking.h"

@interface PhotoListViewController ()

@property (nonatomic, strong) OFFlickrAPIContext *flickrContext;
@property (nonatomic, strong) OFFlickrAPIRequest *flickrRequestPhotos;
@property (nonatomic, strong) OFFlickrAPIRequest *flickrRequestPhotoInfo;

@property (nonatomic, strong) NSMutableArray *arrayImages;

@end

@implementation PhotoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayImages = [NSMutableArray new];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewDidAppear:(BOOL)animated{
    self.flickrContext = [[OFFlickrAPIContext alloc] initWithAPIKey:@"d2427bdc6ee8f3e43aab166ba44658de" sharedSecret:@"9a16da71de8fadba"];
    
    self.flickrRequestPhotos = [[OFFlickrAPIRequest alloc] initWithAPIContext:self.flickrContext];
    self.flickrRequestPhotos.delegate = self;
    
    self.flickrRequestPhotoInfo = [[OFFlickrAPIRequest alloc] initWithAPIContext:self.flickrContext];
    self.flickrRequestPhotoInfo.delegate = self;
    
    [self.flickrRequestPhotos callAPIMethodWithGET:@"flickr.photos.getRecent" arguments:[NSDictionary dictionaryWithObjectsAndKeys:@"100", @"per_page", nil]];
}

#pragma mark - FlickrAPIDelegate

-(void)flickrAPIRequest:(OFFlickrAPIRequest *)inRequest didCompleteWithResponse:(NSDictionary *)inResponseDictionary{

    NSDictionary *photosDict = [inResponseDictionary valueForKeyPath:@"photos.photo"];
    
    for (NSDictionary *photoDict in photosDict) {
        [self.arrayImages addObject:photoDict];
    }
    
    [self.tableView reloadData];
}

-(void)flickrAPIRequest:(OFFlickrAPIRequest *)inRequest didFailWithError:(NSError *)inError{
    NSLog(@"%@", [inError localizedDescription]);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayImages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    NSDictionary *photoDict = [self.arrayImages objectAtIndex:indexPath.row];
    
    NSURL *staticPhotoURL = [self.flickrContext photoSourceURLFromDictionary:photoDict size:OFFlickrSmallSize];
    
    [cell.photoImageView setImageWithURL:staticPhotoURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.labelTitle.text = [photoDict objectForKey:@"title"];
    
    return cell;
}

@end
