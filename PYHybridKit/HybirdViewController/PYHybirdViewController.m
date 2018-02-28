//
//  PYHybirdViewController.m
//  Pods
//
//  Created by administrator on 2018/2/28.
//

#import "PYHybirdViewController.h"
#import <WebKit/WebKit.h>
#import "PYHybridNSURLProtocol.h"
#import "NSURLProtocol+PY.h"

@interface PYHybirdViewController ()<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic,strong)WKWebView* webView;
@end

@implementation PYHybirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSURLProtocol registerClass:[PYHybridNSURLProtocol class]];
        [NSURLProtocol py_registerScheme:@"http"];
        [NSURLProtocol py_registerScheme:@"https"];
    });
    [self.view addSubview:self.webView];
    if (self.webSiteUrlStr) {
        NSURL *url = [NSURL URLWithString:self.webSiteUrlStr];
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
}

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = [WKUserContentController new];
        
        WKPreferences *preferences = [WKPreferences new];
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
//        preferences.minimumFontSize = 30.0;
        configuration.preferences = preferences;
        
        _webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        if ([_webView respondsToSelector:@selector(setNavigationDelegate:)]) {
            [_webView setNavigationDelegate:self];
        }
        
        if ([_webView respondsToSelector:@selector(setDelegate:)]) {
            [_webView setUIDelegate:self];
        }
//        NSString *jsToScaleFit = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
//        WKUserScript *toFitScript = [[WKUserScript alloc] initWithSource:jsToScaleFit injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:true];
//        [configuration.userContentController addUserScript:toFitScript];
    }
    return _webView;
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"%s",__func__);
    NSLog(@"%@",webView.URL.absoluteString);
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"%s",__func__);
    NSLog(@"%@",webView.URL.absoluteString);
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"%s",__func__);
    NSLog(@"%@",webView.URL.absoluteString);
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"%s",__func__);
    NSLog(@"%@",webView.URL.absoluteString);
}

// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"%s",__func__);
    NSLog(@"%@",webView.URL.absoluteString);
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    // 允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    return;
    // 不允许跳转
//    decisionHandler(WKNavigationResponsePolicyCancel);
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    NSLog(@"xxxxx%@",[self mimeType:navigationAction.request.URL]);
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    // 不允许跳转
//    decisionHandler(WKNavigationActionPolicyCancel);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
