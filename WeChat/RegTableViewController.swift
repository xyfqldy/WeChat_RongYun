//
//  RegTableViewController.swift
//  WeChat
//
//  Created by I_MT on 16/9/4.
//  Copyright © 2016年 I_MT. All rights reserved.
//

import UIKit
import Validator
class RegTableViewController: UITableViewController {
    @IBOutlet weak var user: UITextBox!
    @IBOutlet weak var mail: UITextBox!
    @IBOutlet weak var pass: UITextBox!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var region: UITextField!
    
    @IBOutlet var loginTextfields: [UITextBox]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.title = "新用户注册"
        let bgIv = UIImageView.init(frame: self.tableView.bounds)
        bgIv.image = UIImage.init(named: "1")
        self.tableView.backgroundView?.addSubview(bgIv)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let rightBarButtonItem = self.navigationItem.rightBarButtonItems![0]
        rightBarButtonItem.action = #selector(self.rightAction)
        rightBarButtonItem.target = self
//        rightBarButtonItem.enabled = false
        
    }
    // #MARK: - 右侧item的点击事件！

    func rightAction ()   {
        //显示载入提示
        self.pleaseWait()
        //建立用户的AVObject
        let user = AVObject(className: "XBUser")
        //把输入的值存入对象中
            user["user"] = self.user.text
            user["pass"] = self.pass.text
            user["mail"] = self.mail.text
            user["region"] = self.region.text
            user["question"] = self.question.text
            user["answer"] = self.answer.text
         //查询用户是否已经注册
         let querry = AVQuery(className: "XBUser")
         querry.whereKey("user", equalTo: self.user.text)
         //执行查询
         querry.getFirstObjectInBackgroundWithBlock { (object, error) in
            self.clearAllNotice()
            if object != nil{
                self.errorNotice("用户已注册")
                self.user.becomeFirstResponder()
            }else{
                self.successNotice("用户未注册")
                user.saveInBackgroundWithBlock({ (isSucceed, error) in
                    if isSucceed{
                        self.successNotice("注册成功")
                        self.navigationController?.popViewControllerAnimated(true)
                    }else{
                        self.errorNotice(error.localizedDescription)
                    }
                })
            }
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // #MARK: - 校验登录信息
    
    func checkRequiredField()  {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
//        let predicate = NSPredicate.init(format: "SELF MATCHES \(regex)", argumentArray: nil)
        let predicate = NSPredicate(format: "SELF MATCHES %@",regex)
        guard predicate.evaluateWithObject(mail.text) else{
            self.errorNotice("Email格式不正确")
            return
        }
    }
  //这个还有问题，没搞清楚！
    func validateInfo() {
        let error = ValidationError(message: "用户名输入错误")
        let userTfLengthRule =  ValidationRuleLength(min: 3, max: 6, failureError: error)
        let set = ValidationRuleSet(rules: [userTfLengthRule])
        self.user.text?.validate(rules: set)
        self.user.validationHandler = {
            result in
            switch result {
            case .Valid:
                print("valid!")
                
            case .Invalid(let failError):
                let messages = failError.map{return $0.message}
                print("invalid!", messages)
                
            }
        }
        self.user.validateOnInputChange(true)
    }
//    var predicate:NSPredicate { NSPredicate(format: "SELF MATCHES %@",regex)}

    // MARK: - Table view data source

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
