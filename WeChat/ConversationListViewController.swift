//
//  ConversationListViewController.swift
//  WeChat
//
//  Created by I_MT on 16/9/3.
//  Copyright © 2016年 I_MT. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {


    @IBAction func leftAction(sender: UIBarButtonItem) {
     self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func showMenu(sender: UIBarButtonItem) {
//        self.showMenu1(sender)
        self.showMenu2()
    }
    func showMenu1(sender:UIBarButtonItem)  {
        var frame = sender.valueForKey("view")?.frame
        frame?.origin.y = (frame?.origin.y)! + 30
        //        KxMenu.setTintColor(UIColor.blueColor())
        
        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
            KxMenuItem.init("客服", image: UIImage.init(named: "news_selected"), target: self, action: #selector(ConversationListViewController.ClickMenu1)),
            KxMenuItem.init("好友", image: UIImage.init(named: "recommend_selected"), target: self, action: #selector(ConversationListViewController.ClickMenu2))
            
            ])
    }
    func ClickMenu1() {
        
    }
    func ClickMenu2()  {
        
    }
    // #MARK: - 全屏弹出
    var menu : PopMenu?
    func showMenu2()  {
        
    
    let items = [
        MenuItem(title: "与小波聊天", iconName: "huihua", glowColor: UIColor.blueColor(), index: 0),
        MenuItem(title: "通讯录", iconName: "friend", glowColor: UIColor.yellowColor(), index: 1),
        MenuItem(title: "客服", iconName: "zixun", glowColor: UIColor.redColor(), index: 2),
        MenuItem(title: "关于", iconName: "liaotian", glowColor: UIColor.grayColor(), index: 3)
    ]
        if let linshiMenu = menu {
            if linshiMenu.isShowed {
                return
            }else{
                linshiMenu .showMenuAtView(self.view)
            }
          }else{
            menu = PopMenu(frame: self.view.bounds, items: items)
            menu!.menuAnimationType = PopMenuAnimationType.NetEase
            if menu!.isShowed {
                return
            }
            menu!.didSelectedItemCompletion = {
                (selectedItem :MenuItem!) in
                switch selectedItem.index {
                case 0:
                let convSB = UIStoryboard.init(name: "Conversation", bundle: nil)
                
                 let vc = convSB.instantiateViewControllerWithIdentifier("ConversationViewController") as! ConversationViewController
                 vc.targetId = "xiaobo"
                 vc.conversationType = RCConversationType.ConversationType_PRIVATE
                 vc.title = "与小波聊天"
                 self.navigationController?.pushViewController(vc, animated: true)
                 case 1:
                 self.tabBarController?.selectedIndex = 1
                 case 2:
                 self.tabBarController?.selectedIndex = 2
                 case 3:
                 self.tabBarController?.selectedIndex = 3
                default:
                    print("???")
                }
            }
            menu!.showMenuAtView(self.view)
        }
    }
    var conVC = RCConversationViewController()
//    static var once :dispatch_once_t = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.conversationListTableView.tableFooterView  = UIView()
        let userInfo = RCIM.sharedRCIM().currentUserInfo
        self.title = userInfo.userId
//            self.navigationItem.title = "连接成功"
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_PUSHSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                ])
        
        self.refreshConversationTableViewIfNeeded()
       
         let pathCoverView = self.addPathCover()
        let headView = UIView.init(frame: CGRectMake(0, 0, 375, 250))
        headView.backgroundColor = UIColor.yellowColor()
        headView.addSubview(pathCoverView)
        self.conversationListTableView.tableHeaderView = headView
    }
    func addPathCover() ->UIView {
    let pathCover = XHPathCover.init(frame: CGRectMake(0, 0, 100, 100))
       pathCover.setBackgroundImage(UIImage(named: "headBg"))
        pathCover.setAvatarImage(UIImage.init(named: "shuaige"))
        pathCover.setInfo([XHUserNameKey:"Jack",XHBirthdayKey:"1990-10-19"])
        return pathCover
    }
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        //代码跳转到会话界面
        self.conVC.targetId = model.targetId
//        conVC.userName = model.conversationTitle
        self.conVC.conversationType = model.conversationType
        self.conVC.title = model.conversationTitle
//        self.navigationController?.pushViewController(self.conVC, animated: true)
        self.tabBarController?.tabBar.hidden = true
        self.performSegueWithIdentifier("tapOnCell", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden=false
        self.refreshConversationTableViewIfNeeded()

    }
    // #MARK: - 重写重连方法
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.tabBarController?.tabBar.hidden = true
        let destVC = segue.destinationViewController as? RCConversationViewController
        destVC?.targetId = self.conVC.targetId
        destVC?.conversationType = self.conVC.conversationType
        destVC?.title = self.conVC.title
    }
    
    

}
