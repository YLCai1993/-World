//
//  ArticleViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ArticleViewController.h"
#import "DetaileStoreController.h"

@interface ArticleViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)NSURL *url;
@property(nonatomic,strong)NSString *stringPath;

@end

@implementation ArticleViewController

-(NSURL *)url{
    if (!_url) {
        if (_article) {
            NSString *path = [NSString stringWithFormat:@"http://www.duitang.com/life_artist/article/?id=%@",_ID];
            self.stringPath = path;
            _url = [NSURL URLWithString:path];
        }else{
            self.stringPath = _ID;
            _url = [NSURL URLWithString:_ID];
        }
    }
    return _url;
}

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:self.url]];
        _webView.delegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.title;
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [Factory addBackItemToVC:self];
    UISwipeGestureRecognizer *swipe= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (![request.URL.absoluteString isEqualToString:self.stringPath]) {
        DetaileStoreController *detail = [[DetaileStoreController alloc] initWithRequest:request];
        detail.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detail animated:YES];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress]; //旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}


@end
