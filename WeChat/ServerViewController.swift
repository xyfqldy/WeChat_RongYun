//
//  ServerViewController.swift
//  WeChat
//
//  Created by I_MT on 16/9/6.
//  Copyright © 2016年 I_MT. All rights reserved.
//

import UIKit

class ServerViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureServerId()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #MARK: - 配置客服id
    
    func configureServerId()  {
    let SERVER_ID = "KEFU147312649964103"
//        self.userName = "客服";
        self.conversationType = RCConversationType.ConversationType_APPSERVICE ;
        self.targetId =  SERVER_ID;
        self.title = "客服";
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
