//
//  ViewController.m
//  TabbedPageViewController
//
//  Created by Merrick Sapsford on 24/12/2015.
//  Copyright © 2015 Merrick Sapsford. All rights reserved.
//

#import "ChildViewController.h"
#import "DDXML.h"
#import "NewsViewController.h"

@implementation ChildViewController
{
    
    NSMutableArray *titleArray;
    NSMutableArray *linkArray;
    NSMutableArray *pubDateArray;
    int pagenumber;


    NSString *urlString;

}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.titleLabel.text = [NSString stringWithFormat:@"Page %i", (int)(self.pageIndex + 1)];
    
    
    self.table.dataSource = self;
    self.table.delegate = self;
    
    [self.table reloadData];

}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
   pagenumber = (int)self.pageIndex + 1;
    
    if (pagenumber == 1) {
        
        
        UIImage *image = [UIImage imageNamed:@"bg1.jpg"];
        UIImageView *backGroungImageView = [[UIImageView alloc]initWithImage:image];
        self.table.backgroundView = backGroungImageView;
        
        [self getXML1];
    }
    if (pagenumber == 2) {
        
        
        UIImage *image = [UIImage imageNamed:@"bg2.jpg"];
        UIImageView *backGroungImageView = [[UIImageView alloc]initWithImage:image];
        self.table.backgroundView = backGroungImageView;
        
        [self getXML2];
    }
    if (pagenumber == 3) {
        
        
        UIImage *image = [UIImage imageNamed:@"bg3.jpg"];
        UIImageView *backGroungImageView = [[UIImageView alloc]initWithImage:image];
        self.table.backgroundView = backGroungImageView;
        
        [self getXML3];
    }
    if (pagenumber == 4) {
        
        
        UIImage *image = [UIImage imageNamed:@"bg4.jpg"];
        UIImageView *backGroungImageView = [[UIImageView alloc]initWithImage:image];
        self.table.backgroundView = backGroungImageView;
        
        [self getXML4];
    }
    
    if (pagenumber == 5) {
        
        
        UIImage *image = [UIImage imageNamed:@"bg5.jpg"];
        UIImageView *backGroungImageView = [[UIImageView alloc]initWithImage:image];
        self.table.backgroundView = backGroungImageView;
        
        [self getXML5];
    }
    if (pagenumber == 6) {
        
        
        UIImage *image = [UIImage imageNamed:@"bg6.jpg"];
        UIImageView *backGroungImageView = [[UIImageView alloc]initWithImage:image];
        self.table.backgroundView = backGroungImageView;
        
        [self getXML6];
    }
    
    [self.table reloadData];
    
    
}

//セクション数を決めるメソッド
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


//セクションの中にあるセルの数の設定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //配列の中身の数
    return titleArray.count;
}

//セルを作成するデリゲート
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    // tableCell の ID で UITableViewCell のインスタンスを生成
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    //タグでひも付けする
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *dateLabel = (UILabel *)[cell viewWithTag:2];
    
    titleLabel.text = [titleArray objectAtIndex:indexPath.row];
    dateLabel.text = [pubDateArray objectAtIndex:indexPath.row];
    
    
    [cell.contentView addSubview:titleLabel];
    [cell.contentView addSubview:dateLabel];
    
    
    return cell;
}





-(void)getXML1{

    //ここでRSS情報を取得する
    
    titleArray = [NSMutableArray array];
    linkArray = [NSMutableArray array];
    pubDateArray = [NSMutableArray array];
    
    //エラー処理をするための変数を準備する(一応)
    
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:@"http://rss.dailynews.yahoo.co.jp/fc/rss.xml"];
    
    NSData *data = [[NSMutableData alloc]initWithContentsOfURL:url];
    

    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithData:data options:0 error:&error];
    
    NSArray *nodes = [NSArray array];
    nodes = [doc nodesForXPath:@"//item" error:nil];

    
    for(DDXMLElement *node in nodes){
    
        NSString *title = [[node childAtIndex:0] stringValue];
        NSString *link = [[node childAtIndex:1] stringValue];
        NSString *pub = [[node childAtIndex:2] stringValue];
        
        [titleArray addObject:title];
        [linkArray addObject:link];
        [pubDateArray addObject:pub];
        
        
    }
    
    
}





-(void)getXML2{
    
    //ここでRSS情報を取得する
    
    titleArray = [NSMutableArray array];
    linkArray = [NSMutableArray array];
    pubDateArray = [NSMutableArray array];
    
    //エラー処理をするための変数を準備する(一応)
    
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:@"http://headlines.yahoo.co.jp/rss/bfj-c_ent.xml"];
    
    NSData *data = [[NSMutableData alloc]initWithContentsOfURL:url];
    
    
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithData:data options:0 error:&error];
    
    NSArray *nodes = [NSArray array];
    nodes = [doc nodesForXPath:@"//item" error:nil];
    
    
    for(DDXMLElement *node in nodes){
        
        NSString *title = [[node childAtIndex:0] stringValue];
        NSString *link = [[node childAtIndex:1] stringValue];
        NSString *pub = [[node childAtIndex:3] stringValue];
        
        [titleArray addObject:title];
        [linkArray addObject:link];
        [pubDateArray addObject:pub];
        
        
    }

    
}

-(void)getXML3{
    
    //ここでRSS情報を取得する
    
    titleArray = [NSMutableArray array];
    linkArray = [NSMutableArray array];
    pubDateArray = [NSMutableArray array];
    
    //エラー処理をするための変数を準備する(一応)
    
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:@"http://headlines.yahoo.co.jp/rss/zdn_m-c_ent.xml"];
    
    NSData *data = [[NSMutableData alloc]initWithContentsOfURL:url];
    
    
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithData:data options:0 error:&error];
    
    NSArray *nodes = [NSArray array];
    nodes = [doc nodesForXPath:@"//item" error:nil];
    
    
    for(DDXMLElement *node in nodes){
        
        NSString *title = [[node childAtIndex:0] stringValue];
        NSString *link = [[node childAtIndex:1] stringValue];
        NSString *pub = [[node childAtIndex:3] stringValue];
        
        [titleArray addObject:title];
        [linkArray addObject:link];
        [pubDateArray addObject:pub];
        
        
    }

    
}
-(void)getXML4{
    
    //ここでRSS情報を取得する
    
    titleArray = [NSMutableArray array];
    linkArray = [NSMutableArray array];
    pubDateArray = [NSMutableArray array];
    
    //エラー処理をするための変数を準備する(一応)
    
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:@"http://headlines.yahoo.co.jp/rss/tospoweb-c_ent.xml"];
    
    NSData *data = [[NSMutableData alloc]initWithContentsOfURL:url];
    
    
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithData:data options:0 error:&error];
    
    NSArray *nodes = [NSArray array];
    nodes = [doc nodesForXPath:@"//item" error:nil];
    
    
    for(DDXMLElement *node in nodes){
        
        NSString *title = [[node childAtIndex:0] stringValue];
        NSString *link = [[node childAtIndex:1] stringValue];
        NSString *pub = [[node childAtIndex:3] stringValue];
        
        [titleArray addObject:title];
        [linkArray addObject:link];
        [pubDateArray addObject:pub];
        
        
    }
    

    
    
}
-(void)getXML5{
    
    //ここでRSS情報を取得する
    
    titleArray = [NSMutableArray array];
    linkArray = [NSMutableArray array];
    pubDateArray = [NSMutableArray array];
    
    //エラー処理をするための変数を準備する(一応)
    
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:@"http://headlines.yahoo.co.jp/rss/it_nlab-c_ent.xml"];
    
    NSData *data = [[NSMutableData alloc]initWithContentsOfURL:url];
    
    
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithData:data options:0 error:&error];
    
    NSArray *nodes = [NSArray array];
    nodes = [doc nodesForXPath:@"//item" error:nil];
    
    
    for(DDXMLElement *node in nodes){
        
        NSString *title = [[node childAtIndex:0] stringValue];
        NSString *link = [[node childAtIndex:1] stringValue];
        NSString *pub = [[node childAtIndex:3] stringValue];
        
        [titleArray addObject:title];
        [linkArray addObject:link];
        [pubDateArray addObject:pub];
        
        
    }
    
}
-(void)getXML6{
    
    //ここでRSS情報を取得する
    
    titleArray = [NSMutableArray array];
    linkArray = [NSMutableArray array];
    pubDateArray = [NSMutableArray array];
    
    //エラー処理をするための変数を準備する(一応)
    
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:@"http://headlines.yahoo.co.jp/rss/zdn_mkt-dom.xml"];
    
    NSData *data = [[NSMutableData alloc]initWithContentsOfURL:url];
    
    
    DDXMLDocument *doc = [[DDXMLDocument alloc]initWithData:data options:0 error:&error];
    
    NSArray *nodes = [NSArray array];
    nodes = [doc nodesForXPath:@"//item" error:nil];
    
    
    for(DDXMLElement *node in nodes){
        
        NSString *title = [[node childAtIndex:0] stringValue];
        NSString *link = [[node childAtIndex:1] stringValue];
        NSString *pub = [[node childAtIndex:3] stringValue];
        
        [titleArray addObject:title];
        [linkArray addObject:link];
        [pubDateArray addObject:pub];
        
        
    }

    
}





-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    urlString = [linkArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"webNews" sender:self];

}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{


    if ([[segue identifier] isEqualToString:@"webNews"]) {

        NewsViewController *newsViewController = (NewsViewController *)[segue destinationViewController];
        newsViewController.urlString = urlString;
    }

}












@end
