//
//  relatedMediaDataModel.h
//  KonnectPlus
//
//  Created by One Platinum on 12/17/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface relatedMediaDataModel : NSObject
@property(nonatomic,strong)NSString *sdimage_url;
@property(nonatomic,strong)NSString *hdimage_url;
@property(nonatomic,strong)NSString *smallimage_url;
@property(nonatomic,strong)NSString *mediumimage_url;
@property(nonatomic,strong)NSString *largeimage_url;
@property(nonatomic,strong)NSString *classification;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *slug;
@property(nonatomic,strong)NSString *media_id;
@property(nonatomic,strong)NSString *paymentstatusl;

@end
