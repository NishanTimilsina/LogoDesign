//
//  DetailDataModel.h
//  KonnectPlus
//
//  Created by One Platinum on 12/12/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailDataModel : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *detail;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *length;
@property(nonatomic,strong)NSString *media_url;
@property(nonatomic,strong)NSString *classification;
@property(nonatomic,strong)NSString *hdimage;
@property(nonatomic,strong)NSString *seeking_position;

@property(nonatomic,strong)NSString *release_date;
@property(nonatomic,strong)NSDictionary *cast;
@property(nonatomic,strong)NSDictionary *crew;
@property(nonatomic,strong)NSDictionary *resume;




@end
