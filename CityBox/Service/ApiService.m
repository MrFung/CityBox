//
//  ApiService.m
//  test
//
//  Created by 郭枫 on 2017/9/25.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "ApiService.h"
#import "AFNetworking.h"
#import "ApiRequest.h"
#import "NSDictionary+Utility.h"
#import "NSString+Utility.h"

@implementation ApiService

#pragma mark - Object Lifecycle

- (id)init {
  if (self = [super init]) {
  }
  return self;
}

#pragma mark - Public Methods

+ (id)serviceWithDelegate:(id<ApiServiceDelegate>)delegate {
  return [self serviceWithTag:0 delegate:delegate];
}

+ (id)serviceWithTag:(NSInteger)tag delegate:(id<ApiServiceDelegate>)delegate {
  ApiService *service = [[self alloc] init];
  service.tag = tag;
  service.delegate = delegate;
  
  return service;
}

- (void)sendLoginJSONRequest:(ApiRequest *)apiRequest {
  [self sendRequest:apiRequest withCompletion:^(id dictionary, NSInteger responseCode, NSError *error) {
    ApiResponse *apiResponse = nil;
    
    apiResponse = [ApiResponse responseWithLoginDictionary:dictionary responseCode:responseCode error:error];
    
    [self.delegate service:self didFinishRequest:apiRequest withResponse:apiResponse];
  }];
}

- (void)sendCanteenJSONRequest:(ApiRequest *)apiRequest {
  [self sendRequest:apiRequest withCompletion:^(id dictionary, NSInteger responseCode, NSError *error) {
    ApiResponse *apiResponse = nil;
    
    apiResponse = [ApiResponse responseWithCanteenDictionary:dictionary responseCode:responseCode error:error];
    
    [self.delegate service:self didFinishRequest:apiRequest withResponse:apiResponse];
  }];
}

- (void)sendLibraryJSONRequest:(ApiRequest *)apiRequest {
  [self sendRequest:apiRequest withCompletion:^(id dictionary, NSInteger responseCode, NSError *error) {
    ApiResponse *apiResponse = nil;
    
    apiResponse = [ApiResponse responseWithCanteenDictionary:dictionary responseCode:responseCode error:error];
    
    [self.delegate service:self didFinishRequest:apiRequest withResponse:apiResponse];
  }];
}

- (void)sendRequest:(ApiRequest *)apiRequest withResponseBuildBlock:(ApiResponse *(^)(id data, NSError *error))responseBuildBlock {
  [self sendRequest:apiRequest withCompletion:^(id data, NSInteger responseCode, NSError *error) {
    ApiResponse *apiResponse = responseBuildBlock ? responseBuildBlock(data, error) : [ApiResponse responseWithLoginJSON:data  error:error];
    [self.delegate service:self didFinishRequest:apiRequest withResponse:apiResponse];
  }];
}

#pragma mark - Private Methods

- (void)sendRequest:(ApiRequest *)apiRequest withCompletion:(void(^)(id data, NSInteger responseCode, NSError *error))completion {
  if ([self.delegate respondsToSelector:@selector(service:willStartRequest:)]) {
    [self.delegate service:self willStartRequest:apiRequest];
  }
  
  NSURLSessionTask *sessionTask = nil;
  switch (apiRequest.content) {
    case ApiRequestContentJSON:
      sessionTask = [self createJsonDataTaskWithRequest:apiRequest completion:completion];
      [self logJsonDataRequestCall:sessionTask];
      break;
      
    default:
      break;
  }
  
  [sessionTask resume];
}

- (NSURLSessionTask *)createJsonDataTaskWithRequest:(ApiRequest *)apiRequest completion:(void(^)(id data, NSInteger responseCode, NSError *error))completion {
  AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
  manager.responseSerializer = [AFHTTPResponseSerializer serializer];
  
  NSMutableURLRequest *request = [self createJsonRequestWithApiRequest:apiRequest];
  
  NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
    
    NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)response;
    NSInteger responseCode = httpUrlResponse.statusCode;
    
    if (error) {
      [self logRequest:request response:(NSHTTPURLResponse *)response withError:error];
      
      completion(nil, responseCode, error);
    } else {
      id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
      
      [self logRequest:request response:(NSHTTPURLResponse *)response data:json];
      
      completion(json, responseCode, nil);
    }
  }];
  
  return dataTask;
}

- (NSMutableURLRequest *)createJsonRequestWithApiRequest:(ApiRequest *)apiRequest {
  AFHTTPRequestSerializer *afHTTPRequestSerializer = [AFHTTPRequestSerializer serializer];
  [afHTTPRequestSerializer setTimeoutInterval:20];
  
  NSMutableURLRequest *request = [afHTTPRequestSerializer requestWithMethod:@"POST" URLString:apiRequest.url parameters:nil error:nil];
  
  [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
  
  if (ApiRequestMethodPost == apiRequest.method) {
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[apiRequest.parameters toJSONData]];
  }
  
  return request;
}

#pragma mark - Log

- (void)logJsonDataRequestCall:(NSURLSessionTask *)sessionTask {
#if DEBUG
  NSLog(@"----------- WEBSERVICE CALL ----------%@",[sessionTask.currentRequest description]);
  NSData *httpBodyData = sessionTask.currentRequest.HTTPBody;
  NSString *httpBody =  [[NSString alloc] initWithData:httpBodyData encoding:(NSUTF8StringEncoding)];
  NSString *httpMethod = sessionTask.currentRequest.HTTPMethod;
  printf("/%s: %s\n%s\n%s\n",[httpMethod cStringUsingEncoding:NSASCIIStringEncoding], [[[sessionTask.currentRequest URL] absoluteString] cStringUsingEncoding:NSASCIIStringEncoding], [[sessionTask.currentRequest.allHTTPHeaderFields description] cStringUsingEncoding:NSASCIIStringEncoding], [[[httpBody toDictionaryAsJSON] description] cStringUsingEncoding:NSUTF8StringEncoding]);
  NSLog(@"--------- END WEBSERVICE CALL --------%@",[sessionTask.currentRequest description]);
#endif
}

- (void)logRequest:(NSURLRequest*)request response:(NSHTTPURLResponse*)response data:(id)data {
#if DEBUG
  NSLog(@"*********** WEBSERVICE RESPONSE ***********%@",[request description]);
  NSLog(@"Response From Called URL: %s\n%s\n%ld\n%@\n", [[[request URL] absoluteString] cStringUsingEncoding:NSASCIIStringEncoding], [[response.allHeaderFields description] cStringUsingEncoding:NSASCIIStringEncoding], (long)response.statusCode, data);
  NSLog(@"*********** END WEBSERVICE RESPONSE ***********%@",[request description]);
#endif
}

- (void)logRequest:(NSURLRequest*)request response:(NSHTTPURLResponse*)response withError:(NSError*)error {
#if DEBUG
  NSLog(@"*********** WEBSERVICE CALL FAILED ***********%@",[request description]);
  NSLog(@"Response From Called URL: %s\n%s\n%ld\n%@\n", [[[request URL] absoluteString] cStringUsingEncoding:NSASCIIStringEncoding], [[response.allHeaderFields description] cStringUsingEncoding:NSASCIIStringEncoding], (long)response.statusCode, [error description]);
  NSLog(@"*********** END WEBSERVICE CALL FAILED ***********%@",[request description]);
#endif
}


@end
