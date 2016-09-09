//
//  ContactViewController.swift
//  WeChat
//
//  Created by I_MT on 16/9/6.
//  Copyright © 2016年 I_MT. All rights reserved.
//

import UIKit

class ContactViewController: RCConversationListViewController {
    let discussionId = "lolDiscussion"
    @IBAction func rightAddAction(sender: UIBarButtonItem) {
        let frame = sender.valueForKey("view")?.frame
        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
            KxMenuItem.init("创建讨论组", image: UIImage.init(named: "news_selected"), target: self, action: #selector(ContactViewController.creatDiscussion)),
            KxMenuItem.init("添加成员", image: UIImage.init(named: "recommend_selected"), target: self, action: #selector(ContactViewController.addMember)),
            KxMenuItem.init("移除成员", image: UIImage.init(named: "recommend_selected"), target: self, action: #selector(ContactViewController.removeMember)),
            KxMenuItem.init("修改名字", image: UIImage.init(named: "recommend_selected"), target: self, action: #selector(ContactViewController.setDiscusstionName))
        ])

    }
    func creatDiscussion()  {
        RCIMClient.sharedRCIMClient().createDiscussion(discussionId, userIdList: ["xiaoming","xiaobo","xiaowang"], success: { (discusstion) in
            
            }) { (errorCode) in
                
        }
    }
    func addMember(){
        RCIMClient.sharedRCIMClient().addMemberToDiscussion(discussionId, userIdList: ["xiaohong"], success: { (discussion) in
            
            }) { (errorCode) in
                
        }
    }
    func removeMember() {
        RCIMClient.sharedRCIMClient().removeMemberFromDiscussion(discussionId, userId: "xiaobo", success: { (discussion) in
            
            }) { (errorCode) in
                
        }
    }
    func setDiscusstionName()  {
        RCIMClient.sharedRCIMClient().setDiscussionName(discussionId, name: "Swift技术交流群", success: { 
            
            }) { (errorCode) in
                
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let headView = UIView(frame: CGRectMake(0,0,375,250))
        headView.backgroundColor = UIColor.redColor()
        self.conversationListTableView.tableHeaderView = headView
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
