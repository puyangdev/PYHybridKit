//
//  PYLocalImageManger.h
//  PYHybridKit
//
//  Created by administrator on 2018/2/28.
//

#import <Foundation/Foundation.h>
@class PYHybridURLProtocol;
@interface PYLocalImageManger : NSObject
+ (PYLocalImageManger*)sharedLocalImageMangerInstance;
- (BOOL)canReplaceWithLocalImage:(NSURL*)url;
+ (void)responseWithLocalImageData:(NSData*)localImageData urlProtocol:(PYHybridURLProtocol*)urlProtocol;
@end
