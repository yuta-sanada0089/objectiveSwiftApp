//
//  ChildViewController.swift
//  Paged Tabs Example
//
//  Created by Merrick Sapsford on 04/05/2016.
//  Copyright © 2016 Merrick Sapsford. All rights reserved.
//

import Foundation
import UIKit
import DDXML.h
import NewsViewController.h

class ChildViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    private var titleArray = [AnyHashable]()
    private var linkArray = [AnyHashable]()
    private var pubDateArray = [AnyHashable]()
    private var pagenumber: Int = 0
    private var urlString = ""
    
    func viewDidLoad() {
        super.viewDidLoad()
        //    self.titleLabel.text = [NSString stringWithFormat:@"Page %i", (int)(self.pageIndex + 1)];
        table.dataSource = self
        table.delegate = self
        table.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pagenumber = Int(pageIndex) + 1
        if pagenumber == 1 {
            let image = UIImage(named: "bg1.jpg")
            let backGroungImageView = UIImageView(image: image)
            table.backgroundView = backGroungImageView
            getXML1()
        }
        if pagenumber == 2 {
            let image = UIImage(named: "bg2.jpg")
            let backGroungImageView = UIImageView(image: image)
            table.backgroundView = backGroungImageView
            getXML2()
        }
        if pagenumber == 3 {
            let image = UIImage(named: "bg3.jpg")
            let backGroungImageView = UIImageView(image: image)
            table.backgroundView = backGroungImageView
            getXML3()
        }
        if pagenumber == 4 {
            let image = UIImage(named: "bg4.jpg")
            let backGroungImageView = UIImageView(image: image)
            table.backgroundView = backGroungImageView
            getXML4()
        }
        if pagenumber == 5 {
            let image = UIImage(named: "bg5.jpg")
            let backGroungImageView = UIImageView(image: image)
            table.backgroundView = backGroungImageView
            getXML5()
        }
        if pagenumber == 6 {
            let image = UIImage(named: "bg6.jpg")
            let backGroungImageView = UIImageView(image: image)
            table.backgroundView = backGroungImageView
            getXML6()
        }
        table.reloadData()
    }
    
    //セクション数を決めるメソッド
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セクションの中にあるセルの数の設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //配列の中身の数
        return titleArray.count
    }
    
    //セルを作成するデリゲート
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier = "Cell"
        // tableCell の ID で UITableViewCell のインスタンスを生成
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: CellIdentifier)
        }
        // Configure the cell...
        //タグでひも付けする
        let titleLabel = cell?.viewWithTag(1) as? UILabel
        let dateLabel = cell?.viewWithTag(2) as? UILabel
        titleLabel?.text = titleArray[indexPath.row] as? String
        dateLabel?.text = pubDateArray[indexPath.row] as? String
        cell?.contentView.addSubview(titleLabel ?? UIView())
        cell?.contentView.addSubview(dateLabel ?? UIView())
        return cell ?? UITableViewCell()
    }
    
    func getXML1() {
        //ここでRSS情報を取得する
        titleArray = [AnyHashable]()
        linkArray = [AnyHashable]()
        pubDateArray = [AnyHashable]()
        //エラー処理をするための変数を準備する(一応)
        var error: Error? = nil
        let url = URL(string: "http://rss.dailynews.yahoo.co.jp/fc/rss.xml")
        let data = Data(contentsOf: url!)
        let doc = try? DDXMLDocument(data: data, options: 0)
        var nodes = [Any]()
        nodes = (try? doc?.nodes(forXPath: "//item")) ?? [Any]()
        for node: DDXMLElement in nodes {
            let title = "\(node.child(at: 0))"
            let link = "\(node.child(at: 1))"
            let pub = "\(node.child(at: 2))"
            titleArray.append(title)
            linkArray.append(link)
            pubDateArray.append(pub)
        }
    }
    
    func getXML2() {
        //ここでRSS情報を取得する
        titleArray = [AnyHashable]()
        linkArray = [AnyHashable]()
        pubDateArray = [AnyHashable]()
        //エラー処理をするための変数を準備する(一応)
        var error: Error? = nil
        let url = URL(string: "http://headlines.yahoo.co.jp/rss/bfj-c_ent.xml")
        let data = Data(contentsOf: url!)
        let doc = try? DDXMLDocument(data: data, options: 0)
        var nodes = [Any]()
        nodes = (try? doc?.nodes(forXPath: "//item")) ?? [Any]()
        for node: DDXMLElement in nodes {
            let title = "\(node.child(at: 0))"
            let link = "\(node.child(at: 1))"
            let pub = "\(node.child(at: 3))"
            titleArray.append(title)
            linkArray.append(link)
            pubDateArray.append(pub)
        }
    }
    
    func getXML3() {
        //ここでRSS情報を取得する
        titleArray = [AnyHashable]()
        linkArray = [AnyHashable]()
        pubDateArray = [AnyHashable]()
        //エラー処理をするための変数を準備する(一応)
        var error: Error? = nil
        let url = URL(string: "http://headlines.yahoo.co.jp/rss/zdn_m-c_ent.xml")
        let data = Data(contentsOf: url!)
        let doc = try? DDXMLDocument(data: data, options: 0)
        var nodes = [Any]()
        nodes = (try? doc?.nodes(forXPath: "//item")) ?? [Any]()
        for node: DDXMLElement in nodes {
            let title = "\(node.child(at: 0))"
            let link = "\(node.child(at: 1))"
            let pub = "\(node.child(at: 3))"
            titleArray.append(title)
            linkArray.append(link)
            pubDateArray.append(pub)
        }
    }
    
    func getXML4() {
        //ここでRSS情報を取得する
        titleArray = [AnyHashable]()
        linkArray = [AnyHashable]()
        pubDateArray = [AnyHashable]()
        //エラー処理をするための変数を準備する(一応)
        var error: Error? = nil
        let url = URL(string: "http://headlines.yahoo.co.jp/rss/tospoweb-c_ent.xml")
        let data = Data(contentsOf: url!)
        let doc = try? DDXMLDocument(data: data, options: 0)
        var nodes = [Any]()
        nodes = (try? doc?.nodes(forXPath: "//item")) ?? [Any]()
        for node: DDXMLElement in nodes {
            let title = "\(node.child(at: 0))"
            let link = "\(node.child(at: 1))"
            let pub = "\(node.child(at: 3))"
            titleArray.append(title)
            linkArray.append(link)
            pubDateArray.append(pub)
        }
    }
    
    func getXML5() {
        //ここでRSS情報を取得する
        titleArray = [AnyHashable]()
        linkArray = [AnyHashable]()
        pubDateArray = [AnyHashable]()
        //エラー処理をするための変数を準備する(一応)
        var error: Error? = nil
        let url = URL(string: "http://headlines.yahoo.co.jp/rss/it_nlab-c_ent.xml")
        let data = Data(contentsOf: url!)
        let doc = try? DDXMLDocument(data: data, options: 0)
        var nodes = [Any]()
        nodes = (try? doc?.nodes(forXPath: "//item")) ?? [Any]()
        for node: DDXMLElement in nodes {
            let title = "\(node.child(at: 0))"
            let link = "\(node.child(at: 1))"
            let pub = "\(node.child(at: 3))"
            titleArray.append(title)
            linkArray.append(link)
            pubDateArray.append(pub)
        }
    }
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        urlString = linkArray[indexPath.row] as? String ?? ""
        performSegue(withIdentifier: "webNews", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "webNews") {
            let newsViewController = segue.destination as? NewsViewController
            newsViewController?.urlString = urlString
        }
    }
}

