//
//  AppDelegate.swift
//  WeChat
//
//  Created by I_MT on 16/9/2.
//  Copyright © 2016年 I_MT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?
    
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId

        switch userId {
        case "xiaoming":
        userInfo.name = "mt"
        userInfo.portraitUri = "http://image.tianjimedia.com/uploadImages/2012/231/00/0588TRI5TMQS.jpg"
        case "xiaobo":
            userInfo.name =  "xiaobo"
            userInfo.portraitUri = "http://img3.imgtn.bdimg.com/it/u=3296863546,1721225991&fm=21&gp=0.jpg"
        default:
        print("无此用户")
        }
        return completion(userInfo)
    }
    func connectSever(userid userid:String?,completion:()->Void)  {
        //用token测试连接1
        var token:String = ""
        var passthroughUserId = userid
        if passthroughUserId == nil {
            passthroughUserId = "xiaoming"
        }
        switch passthroughUserId! {
        case "xiaoming":
            token = "Wn//6q4i9RaQNn/j3LU8cAxpSJRAY6wMM4jcMUKwUeL0/4oKxh4eAJXpqQkO9ktgCrWmBxSzlh+RRNOtEO0j3myKYJn6swec"
        case "xiaobo":
            token = "jZV6xuSxPFeJixJ6drJahhsTdCAaHwWb5jU1PMRgRWtnklhZoeQ9k11+ROmOTJ4llQWxxH2N55VckRNK09Mc+A=="
        case "xiaowang":
            token = "3pYC1o8sZVckRFwEDxe61wxpSJRAY6wMM4jcMUKwUeIRsgswPkeXEPzKKJu7kisPWuahsQyMG10EjwmX4kuKrWyKYJn6swec"
        case "xiaohong":
            token = "iBJ3319yMdHd+3VrWnruRwxpSJRAY6wMM4jcMUKwUeIRsgswPkeXEJIo9Vj9tn0RmaqLodf4hYx2/FNszYOnPWyKYJn6swec"
        default:
            token = ""
        }
        RCIM.sharedRCIM().connectWithToken(token, success: { (_) in
                dispatch_async(dispatch_get_main_queue(), {
                let userInfo = RCUserInfo(userId: passthroughUserId!, name: "", portrait: "")
                RCIM.sharedRCIM().currentUserInfo = userInfo
                    completion()
                })
            
            }, error: { (_) in
                print("连接失败")
        }) {
            print("token不正确")
        }
        

    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //初始化appkey
        RCIM.sharedRCIM().initWithAppKey("tdrvipksrbjt5")
        //设置用户提供信息者为Appdelegate
        RCIM.sharedRCIM().userInfoDataSource = self

        //获取leanCloud授权
        AVOSCloud.setApplicationId("hHKkT2O7HSK5AQXzHgHTgbz4-gzGzoHsz", clientKey: "ilKd2LhsrCdTV9pkBLK8E0GC")
        //注册自定义消息
        RCIM.sharedRCIM().registerMessageType(CustomMessage.superclass())
            
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

