//
//  ViewController.m
//  PYHybridKitDemo
//
//  Created by administrator on 2018/2/27.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "ViewController.h"
#import <PYHybridKit/PYHybridKitHeader.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
#ifdef INTERNAL_RELEASE
     self.view.backgroundColor = [UIColor redColor];
#else
     self.view.backgroundColor = [UIColor blueColor];
#endif

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    PYHybirdViewController *hyBird = [[PYHybirdViewController alloc] init];
    [self.navigationController pushViewController:hyBird animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
