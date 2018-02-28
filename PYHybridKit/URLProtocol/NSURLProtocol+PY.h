//
//  NSURLProtocol+PY.h
//  Pods-PYHybridKitDemo
//
//  Created by administrator on 2018/2/28.
//

#import <Foundation/Foundation.h>

@interface NSURLProtocol (PY)
+ (void)py_registerScheme:(NSString*)scheme;
+ (void)py_unregisterScheme:(NSString*)scheme;
@end
