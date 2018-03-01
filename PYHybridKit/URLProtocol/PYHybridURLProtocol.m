//
//  PYHybridNSURLProtocol.m
//  Pods
//
//  Created by administrator on 2018/2/28.
//

#import "PYHybridURLProtocol.h"
#import "PYLocalApiManger.h"
#import "PYLocalImageManger.h"
#import "PYLocalJavaScriptManger.h"

static NSString* const kPYHybridNSURLProtocolKey = @"kPYHybridNSURLProtocol";

@interface PYHybridURLProtocol()<NSURLSessionDelegate>
@property (nonnull,strong) NSURLSessionDataTask *task;
@end
@implementation PYHybridURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSString *scheme = [[request URL] scheme];
    if ( ([scheme caseInsensitiveCompare:@"http"]  == NSOrderedSame ||
          [scheme caseInsensitiveCompare:@"https"] == NSOrderedSame ))
    {
        //看看是否已经处理过了，防止无限循环
        if ([NSURLProtocol propertyForKey:kPYHybridNSURLProtocolKey inRequest:request])
            return NO;
        return YES;
    }
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
//    NSMutableURLRequest *mutableReqeust = [request mutableCopy];
//    //替换本地图片
//    if ([[PYLocalImageManger sharedLocalImageMangerInstance] canReplaceWithLocalImage:request.URL])
//    {
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"testimage.png" ofType:nil];
//        NSURL* url1 = [NSURL URLWithString:path];
//        mutableReqeust = [NSMutableURLRequest requestWithURL:[url1 filePathURL]];
//    }
//    return mutableReqeust;
}

- (void)startLoading
{
    NSMutableURLRequest *mutableReqeust = [[self request] mutableCopy];
    //给我们处理过的请求设置一个标识符, 防止无限循环,
    [NSURLProtocol setProperty:@YES forKey:kPYHybridNSURLProtocolKey inRequest:mutableReqeust];
    //缓存判断
    if ([[PYLocalImageManger sharedLocalImageMangerInstance] canReplaceWithLocalImage:self.request.URL]) {
        [PYLocalImageManger responseWithLocalImageData:nil urlProtocol:self];
        return;
    }else {
        //网络发起请求
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
        self.task = [session dataTaskWithRequest:self.request];
        [self.task resume];
    }
}

- (void)stopLoading
{
    if (self.task != nil)
    {
        [self.task  cancel];
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    [[self client] URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
    
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    [[self client] URLProtocol:self didLoadData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    [self.client URLProtocolDidFinishLoading:self];
}
@end
