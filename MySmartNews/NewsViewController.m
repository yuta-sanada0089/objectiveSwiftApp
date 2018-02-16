//
//  NewsViewController.m
//  MySmartNews
//
//  Created by Yuta Fujii on 2016/07/12.
//  Copyright © 2016年 Yuta Fujii. All rights reserved.
//

#import "NewsViewController.h"
#import <MRProgress/MRProgress.h>

@interface NewsViewController ()<UIWebViewDelegate>

@end

@implementation NewsViewController
{
    
    IBOutlet UIWebView *webView;
    
    MRProgressOverlayView *progressView;
}

@synthesize urlString;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    webView.delegate = self;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    
    
    
    // Do any additional setup after loading the view.
}



- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


//WebViewが読み込みを開始した時に勝手に呼ばれるデリゲートメソッド
-(void)webViewDidStartLoad:(UIWebView *)webView{

    if(!progressView){
        progressView = [MRProgressOverlayView new];
        progressView.mode = MRProgressOverlayViewModeIndeterminate;
        [self.view addSubview:progressView];
        [progressView setTitleLabelText:@"よみこみ中"];
        [progressView show:YES];
        
    }

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

//        [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];

    [MRProgressOverlayView dismissOverlayForView:self.view animated:YES completion:nil];
    
    
}



/*
-(void)webViewDidStartLoad:(UIWebView*)webView{
    //    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    if(!progressView){
        progressView = [MRProgressOverlayView new];
        progressView.mode = MRProgressOverlayViewModeIndeterminate;
        [self.view addSubview:progressView];
        [progressView setTitleLabelText:@"Loading ..."];
        [progressView show:YES];
    }
    
}

// ページ読込完了時にインジケータを非表示にする
-(void)webViewDidFinishLoad:(UIWebView*)webView{
    //    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
}*/







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
