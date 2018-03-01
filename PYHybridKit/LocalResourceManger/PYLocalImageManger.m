//
//  PYLocalImageManger.m
//  PYHybridKit
//
//  Created by administrator on 2018/2/28.
//

#import "PYLocalImageManger.h"
#import "PYHybridURLProtocol.h"
static PYLocalImageManger *_instance;
@interface PYLocalImageManger()
@property (nonatomic,strong) NSMutableDictionary* localDic;
@property (nonatomic,strong) NSMutableArray* localArr;

@end
@implementation PYLocalImageManger

+ (PYLocalImageManger*)sharedLocalImageMangerInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[PYLocalImageManger alloc] init];
    });
    return _instance;
}

- (BOOL)canReplaceWithLocalImage:(NSURL*)url {
    if ([self.localArr containsObject:url.absoluteString]) {
        return YES;
    }
    return NO;
}

+ (void)responseWithLocalImageData:(NSData*)localImageData urlProtocol:(PYHybridURLProtocol*)urlProtocol {
    NSData* data = UIImagePNGRepresentation([UIImage imageNamed:@"testimage"]);
    NSURLResponse* response = [[NSURLResponse alloc] initWithURL:urlProtocol.request.URL MIMEType:@"image/png" expectedContentLength:data.length textEncodingName:nil];
    [urlProtocol.client URLProtocol:urlProtocol didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
    [urlProtocol.client URLProtocol:urlProtocol didLoadData:data];
    [urlProtocol.client URLProtocolDidFinishLoading:urlProtocol];
}

- (NSMutableDictionary *)localDic {
    if (_localDic == nil) {
        _localDic = [[NSMutableDictionary alloc] init];
    }
    return _localDic;
}

- (NSMutableArray *)localArr {
    if (_localArr == nil) {
        _localArr = [[NSMutableArray alloc] init];
        [_localArr addObject:@"https://m.baidu.com/static/index/plus/homepage-newlogo.png"];
        [_localArr addObject:@"https://m.baidu.com/static/search/baiduapp_icon.png"];
        [_localArr addObject:@"https://m.baidu.com/se/static/img/iphone/logo.png"];
    }
    return _localArr;
}
//+ (NSURLResponse *)constructLocalImageRequestResponse:(NSData *)resultBridgeData requestURL:(NSURL *)requestURL{
//
//}

@end
