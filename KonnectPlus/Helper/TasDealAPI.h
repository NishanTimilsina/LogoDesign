//
//  TasDealAPI.h
//  TasDelasApp
//
//  Created by One Platinum on 9/4/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"
typedef void (^JSONResponseBlock)(NSDictionary *json, NSString *errorMessage);
@interface TasDealAPI : AFHTTPSessionManager
+ (TasDealAPI*)sharedTasDealHTTPClient;
- (void)requestWithPath:(NSString*)path params:(NSDictionary*)params onCompletion:(JSONResponseBlock)completionBlock;
@end
