//
//  TasDealAPI.m
//  TasDelasApp
//
//  Created by One Platinum on 9/4/14.
//  Copyright (c) 2014 One Platinum. All rights reserved.
//

#import "TasDealAPI.h"
#import "ServerURl.h"
static TasDealAPI *_sharedTasDealHTTPClient = nil;

@implementation TasDealAPI

+ (TasDealAPI*)sharedTasDealHTTPClient
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedTasDealHTTPClient = [[self alloc]initWithBaseURL:[NSURL URLWithString:BASE_URL]];
    });
    return _sharedTasDealHTTPClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    
    if (self) {
        [_sharedTasDealHTTPClient setResponseSerializer:[AFJSONRequestSerializer serializerWithWritingOptions:NSJSONReadingAllowFragments]];
        [_sharedTasDealHTTPClient setRequestSerializer:[AFJSONRequestSerializer serializerWithWritingOptions:NSJSONReadingAllowFragments]];
        [_sharedTasDealHTTPClient.requestSerializer setTimeoutInterval:20.0];
       
    }
    return self;
}

- (void)requestWithPath:(NSString*)path params:(NSDictionary*)params onCompletion:(JSONResponseBlock)completionBlock
{
   
    
    

    
    [self POST:path parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:path]];
        [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
        [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"api_konnectplus.tv" password:@"H23RNVSTYPP46WFY"];
        NSLog(@"respose %@",[responseObject description]);
        completionBlock(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completionBlock(nil, [error debugDescription]);
        NSLog(@"request failed : \n ----%@, error:%@", [task description], [error localizedDescription]);

        

    }];
}

@end
