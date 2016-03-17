//
//  DataManager.h
//  TasDelasApp
//
//  Created by One Platinum on 9/4/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataManager : NSObject
+ (DataManager * ) sharedDataManger;



-(void)setDataforOffline:(NSArray *)array;
-(NSArray*)fetchDataFromCoreData;
@end
