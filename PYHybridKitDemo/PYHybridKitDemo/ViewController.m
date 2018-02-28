//
//  ViewController.m
//  PYHybridKitDemo
//
//  Created by administrator on 2018/2/27.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
#ifdef INTERNAL_RELEASE
    NSLog(@"ddddd");
     self.view.backgroundColor = [UIColor redColor];
#else
    NSLog(@"kkkkkk");
     self.view.backgroundColor = [UIColor blueColor];
#endif

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
