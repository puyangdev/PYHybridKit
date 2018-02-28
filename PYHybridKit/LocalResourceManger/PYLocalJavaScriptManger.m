//
//  PYLocalJavaScriptManger.m
//  PYHybridKit
//
//  Created by administrator on 2018/2/28.
//

#import "PYLocalJavaScriptManger.h"
static PYLocalJavaScriptManger *_instance;
@implementation PYLocalJavaScriptManger
+ (PYLocalJavaScriptManger*)sharedLocalJavaScriptMangerInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[PYLocalJavaScriptManger alloc] init];
    });
    return _instance;
}
@end
