//
//  AppDelegate.swift
//  test
//
//  Created by 熊盛 on 2020/11/6.
//

import UIKit
import Moya
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        gitRequest()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func gitRequest() {
        GCDTimer.share.scheduledDispatchTimer(withName: GITTIMER, timeInterval: 5, queue: .main, repeats: true) {
            //code
            let time = Date.getDateFormatString()
            NetworkProvider.request(ServerAPI.gitRequest) {result in
                if case .success(let response) = result {
                    if var dic = try! response.mapJSON() as? Dictionary<String,String> {
                        dic.updateValue(time, forKey: GITDATATIME)
                        
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: GITNOTIFICATION), object: nil, userInfo: dic)
                        
                        if var array = UserDefaults.standard.object(forKey: GITDATA) as? [Dictionary<String,String>] {
                            array.insert(dic, at: 0)
                            UserDefaults.standard.setValue(array, forKey: GITDATA)
                        }
                        else {
                            let array = [dic]
                            UserDefaults.standard.setValue(array, forKey: GITDATA)
                        }
                        
                    }
                }
                
            }
        }
        
    }
}

