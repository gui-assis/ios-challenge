//
//  PhotoService.m
//  ios-challenge
//
//  Created by Guilherme Augusto on 29/07/15.
//  Copyright (c) 2015 helabs. All rights reserved.
//

#import "PhotoService.h"

#define kRequestRecents @"flickr.photos.getRecent"
#define kRequestInfo @"flickr.photos.getInfo"
#define kReqeustComments @"flickr.photos.comments.getList"

@interface PhotoService ()

@property (nonatomic, strong) OFFlickrAPIContext *flickrContext;
@property (nonatomic, strong) OFFlickrAPIRequest *flickrRequest;
@property (nonatomic, strong) NSString *request;
@property (nonatomic, strong) Photo *photo;

@end

@implementation PhotoService

-(void) initObjects{
    self.flickrContext = [[OFFlickrAPIContext alloc] initWithAPIKey:@"d2427bdc6ee8f3e43aab166ba44658de" sharedSecret:@"9a16da71de8fadba"];
    
    self.flickrRequest = [[OFFlickrAPIRequest alloc] initWithAPIContext:self.flickrContext];
    self.flickrRequest.delegate = self;
}

-(void)getRecentPhotosWithPage:(int) page{
    [self initObjects];
    
    self.request = kRequestRecents;
    
    [self.flickrRequest callAPIMethodWithGET:kRequestRecents arguments:[NSDictionary dictionaryWithObjectsAndKeys:@"20", @"per_page", [NSString stringWithFormat:@"%d", page], @"page", @"owner_name, url_t, url_m", @"extras", nil]];
}

-(void)loadPhotoDetails:(Photo *)photo{
    [self initObjects];
    
    self.request = kRequestInfo;
    self.photo = photo;
    
    [self.flickrRequest callAPIMethodWithGET:kRequestInfo arguments:[NSDictionary dictionaryWithObjectsAndKeys: photo.photoId, @"photo_id", photo.secret, @"photo_secret", nil]];
}

-(void)loadPhotoComments{
    [self initObjects];
    
    self.request = kReqeustComments;
    
    [self.flickrRequest callAPIMethodWithGET:kReqeustComments arguments:[NSDictionary dictionaryWithObjectsAndKeys: self.photo.photoId, @"photo_id", self.photo.secret, @"photo_secret", nil]];
}


#pragma mark - flickrAPI

-(void)flickrAPIRequest:(OFFlickrAPIRequest *)inRequest didCompleteWithResponse:(NSDictionary *)inResponseDictionary{
    
    if ([self.request isEqualToString:kRequestRecents]) {
        
        NSMutableArray *responseArray = [NSMutableArray new];
        
        NSArray *photos = [[inResponseDictionary objectForKey:@"photos"] objectForKey:@"photo"];
        
        for (NSDictionary *dicPhoto in photos){
            Photo *photoObject = [MTLJSONAdapter modelOfClass:[Photo class] fromJSONDictionary:dicPhoto error:nil];
            [responseArray addObject:photoObject];
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didLoadPhotos:)]) {
            [self.delegate didLoadPhotos:responseArray];
        }
        
    } else if ([self.request isEqualToString:kRequestInfo]){
        
        PhotoDetail *photoDetail = [PhotoDetail new];
        
        NSDictionary *dicPhoto = [inResponseDictionary objectForKey:@"photo"];
        
        PhotoOwner *photoOwner = [MTLJSONAdapter modelOfClass:[PhotoOwner class] fromJSONDictionary:[dicPhoto objectForKey:@"owner"] error:nil];
        
        photoDetail.photoOwner = photoOwner;
        
        self.photo.photoDetail = photoDetail;
        
//        NSDictionary *dicComments = [dicPhoto objectForKey:@"comments"];
//        NSString *comments = [dicComments objectForKey:@"_text"];
//        photoDetail.comments = comments;
        
        [self loadPhotoComments];
        
    } else if ([self.request isEqualToString:kReqeustComments]){
        
        NSArray *commentsArray = [[inResponseDictionary objectForKey:@"comments"] objectForKey:@"comment"];
        
        NSMutableArray *comments = [NSMutableArray array];
        
        for (NSDictionary *commentDic in commentsArray){
            Comment *c = [MTLJSONAdapter modelOfClass:[Comment class] fromJSONDictionary:commentDic error:nil];
            [comments addObject:c];
        }
        
        self.photo.photoDetail.comments = comments;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didLoadPhotoDetails:)]) {
            [self.delegate didLoadPhotoDetails:self.photo];
        }
    }
}

-(void)flickrAPIRequest:(OFFlickrAPIRequest *)inRequest didFailWithError:(NSError *)inError{
    NSLog(@"%@", [inError localizedDescription]);
}

@end
