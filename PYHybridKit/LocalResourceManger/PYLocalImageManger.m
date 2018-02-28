//
//  PYLocalImageManger.m
//  PYHybridKit
//
//  Created by administrator on 2018/2/28.
//

#import "PYLocalImageManger.h"
static PYLocalImageManger *_instance;
@implementation PYLocalImageManger
+ (PYLocalImageManger*)sharedLocalImageMangerInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[PYLocalImageManger alloc] init];
    });
    return _instance;
}

@end
