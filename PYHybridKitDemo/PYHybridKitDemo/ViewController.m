//
//  ViewController.m
//  PYHybridKitDemo
//
//  Created by administrator on 2018/2/27.
//  Copyright © 2018年 administrator. All rights reserved.
//

#import "ViewController.h"
#import <PYHybridKit/PYHybridKitHeader.h>
static NSString *baiduBig = @"https://m.baidu.com/static/index/plus/homepage-newlogo.png";
//https://m.baidu.com/se/static/img/iphone/logo.png
//https://m.baidu.com/static/search/baiduapp_icon.png
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
    hyBird.webSiteUrlStr = @"https://www.tmall.com/#/main";
    hyBird.webSiteUrlStr = @"https://www.baidu.com";
    [self.navigationController pushViewController:hyBird animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
