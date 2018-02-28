//
//  PYLocalRequestManger.m
//  PYHybridKit
//
//  Created by administrator on 2018/2/28.
//

#import "PYLocalApiManger.h"

@implementation PYLocalApiManger

+ (NSURLResponse *)constructLocalRequestResponse:(NSData *)resultBridgeData requestURL:(NSURL *)requestURL {
    
    NSURLResponse *customResponse = nil;
    NSMutableDictionary *customFields = [NSMutableDictionary dictionaryWithCapacity:2];
    
//    customFields[@"Content-Type"] = @"application/json;charset=utf-8";
    [customFields setObject:@"application/json;charset=utf-8" forKey:@"Content-Type"];
    // content length
//    customFields[@"Content-Length"] = [NSString stringWithFormat:@"%ld", (unsigned long)[resultBridgeData length]];
    [customFields setObject:[NSString stringWithFormat:@"%ld", (unsigned long)[resultBridgeData length]] forKey:@"Content-Length"];
    customResponse = [[NSHTTPURLResponse alloc] initWithURL:requestURL
                                                 statusCode:200
                                                HTTPVersion:@"HTTP/1.1"
                                               headerFields:customFields];
    return customResponse;
    
}
@end
