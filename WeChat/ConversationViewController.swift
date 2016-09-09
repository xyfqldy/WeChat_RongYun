//
//  ConversationViewController.swift
//  WeChat
//
//  Created by I_MT on 16/9/2.
//  Copyright © 2016年 I_MT. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RCIM.sharedRCIM().globalMessageAvatarStyle =  (.USER_AVATAR_CYCLE)
        self.enableNewComingMessageIcon = true
//        self.chatSessionInputBarControl.emojiBoardView
    customInputBar()
//        self.registerClass(CustomMessageCell.superclass(), forMessageClass: CustomMessage.superclass())
        self.registerClass(CustomMessageCell.classForCoder(), forCellWithReuseIdentifier: "custom")
    
    }
    // #MARK: - 自定义扩展项
    
    func customInputBar()  {
       self.chatSessionInputBarControl.pluginBoardView.insertItemWithImage(UIImage(named: "luyinBtn"), title: "录音", tag: 3)
        let fileImage = RCKitUtility.imageNamed("actionbar_file_icon", ofBundle: "RongCloud.bundle")
        self.chatSessionInputBarControl.pluginBoardView.insertItemWithImage(fileImage, title: "发送文件", tag:  Int(PLUGIN_BOARD_ITEM_FILE_TAG))
        self.chatSessionInputBarControl.pluginBoardView.insertItemWithImage(UIImage(named: "yuezhan"), title: "发送约战", tag:  4)

    }
    override func pluginBoardView(pluginBoardView: RCPluginBoardView!, clickedItemWithTag tag: Int) {
        if tag == 4 {
//        RCMessage
//            let warningMessage = RCInformationNotificationMessage.notificationWithMessage("提醒消息", extra: Optional())
            let message = CustomMessage.init(content: "hahahaha")
            var insertMessage : RCMessage!
            insertMessage = RCIMClient.sharedRCIMClient().insertMessage(self.conversationType, targetId: self.targetId, senderUserId: RCIMClient.sharedRCIMClient().currentUserInfo.userId, sendStatus: RCSentStatus.SentStatus_SENT, content: message)
            self.appendAndDisplayMessage(insertMessage)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = true
        
            
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        self.conversationMessageCollectionView
    }
    // #MARK: - 自定义cell的回调
    override func rcConversationCollectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> RCMessageBaseCell! {
//    RCMessageModel
        let model = self.conversationDataRepository.objectAtIndex(indexPath.row)
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("custom", forIndexPath: indexPath)as!RCMessageCell
//        let cell = CustomMessageCell()
        cell .setDataModel(model as! RCMessageModel)
        return cell
    }
    override func rcConversationCollectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
        return  CGSize(width: 300, height: 250)
    }
    override func didTapMessageCell(model: RCMessageModel!) {
        print("123")
    }

}
