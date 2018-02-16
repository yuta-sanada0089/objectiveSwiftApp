//
//  AppDelegate.m
//  MySmartNews
//
//  Created by Yuta Fujii on 2016/07/12.
//  Copyright © 2016年 Yuta Fujii. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 許可をもらう通知タイプの種類を定義
    UIUserNotificationType types = UIUserNotificationTypeBadge | // アイコンバッチ
    UIUserNotificationTypeSound | // サウンド
    UIUserNotificationTypeAlert;  // テキスト
    // UIUserNotificationSettingsの生成
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    // アプリケーションに登録
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    [self registerNotification];

    
    return YES;
}


//通知登録
-(void)registerNotification
{
    //全ての通知をキャンセル
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    //1:日曜日～7:土曜日で指定　※ここでは例として日、月、水を指定
    NSArray *weekAry = @[@1,@2,@3,@4,@5,@6,@7];
    
    //通知時間生成
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger repeart = 30;//繰り返し日数
    NSDate *today = [NSDate date];//今日
    NSDate *date;
    NSDateComponents *componentsForFireDate;
    for (int i = 0; i < repeart; i++) {
        date = [today dateByAddingTimeInterval:i * 24 * 60 * 60];
        componentsForFireDate = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday)fromDate:date];
       
        //8:30を指定
        [componentsForFireDate setHour:9];
        [componentsForFireDate setMinute:00] ;
        [componentsForFireDate setSecond:0] ;
        NSDate *fireDateOfNotification = [calendar dateFromComponents: componentsForFireDate];
        
        if ([weekAry containsObject:[NSNumber numberWithInteger:componentsForFireDate.weekday]]) {
            if ([[NSDate date] compare:fireDateOfNotification] == NSOrderedAscending) {//今より未来であること
                UILocalNotification *notification = [[UILocalNotification alloc] init];
                notification.fireDate = fireDateOfNotification;     //年月日・曜日を指定
                notification.timeZone = [NSTimeZone defaultTimeZone];
                notification.alertBody = @"更新情報";     //メッセージ
                notification.alertAction = @"朝のニュースが更新されました";          //タイトル
                // 通知を登録する
                [[UIApplication sharedApplication] scheduleLocalNotification:notification];
            }
        }
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
