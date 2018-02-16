//
//  AppDelegate.swift
//  MySmartNews
//
//  Created by 真田雄太 on 2018/02/11.
//  Copyright © 2018年 Yuta Fujii. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]?) -> Bool {
        
        if #available(iOS 10.0, *) {
            // iOS 10 許可をもらう通知タイプの種類を定義(バッジ、サウンド、アラート)
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                
                if granted {
                    debugPrint("通知許可")
                } else {
                    debugPrint("通知拒否")
                }
            })
            
        } else {
            // iOS 9 UIUserNotificationSettingの生成
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            //アプリケーションに登録
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        
        
        //通知登録
        let content = UNMutableNotificationContent()
        content.title = "朝のニュースが更新されました";
        content.body = "更新情報";
        content.sound = UNNotificationSound.default()
        let date = DateComponents(hour:9)//(month:7, day:7, hour:12, minute:0)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: true)//1回だけならrepeatsをfalseに
        let request = UNNotificationRequest.init(identifier: "TestNotification", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request)
        
        return true
    }
    
   
    
    func applicationWillResignActive(_ application: UIApplication) {
        //アプリケーションがアクティブ状態から非アクティブ状態に移行しようとしているときに送信される。これは、特定の種類の一時的な中断（着信電話やSMSメッセージなど）や、ユーザーがアプリケーションを終了してバックグラウンド状態への移行を開始したときに発生する。
        
        //このメソッドを使用して、進行中のタスクを一時停止し、タイマーを無効にし、グラフィックスレンダリングコールバックを無効にする。ゲームはこのメソッドを使用してゲームを一時停止する必要がある。
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //このメソッドを使用して、共有リソースを解放し、ユーザーデータを保存し、タイマーを無効にし、後で終了する場合にアプリケーションを現在の状態に復元するのに十分なアプリケーション状態情報を格納します。アプリケーションがバックグラウンドでの実行をサポートしている場合、ユーザーが終了するとき、このメソッドはapplicationWillTerminateの代わりに呼び出されます。
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //バックグラウンドからアクティブ状態への移行の一部として呼び出されます。背景の入力時に加えられた変更の多くを元に戻すことができます。
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //アプリケーションが停止している間に中断された（またはまだ開始されていない）タスクを再開します。アプリケーションが以前にバックグラウンドにあった場合は、必要に応じてユーザーインターフェイスを更新します。
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        //アプリケーションが終了しようとしているときに呼び出される。必要に応じてデータを保存。 applicationDidEnterBackground：を参照してください。
    }
}
