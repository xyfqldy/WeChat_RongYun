//
//  LoginViewController.swift
//  WeChat
//
//  Created by I_MT on 16/9/4.
//  Copyright © 2016年 I_MT. All rights reserved.
//

import UIKit
//extension UIView {
//    @IBInspectable var cornerRadius:CGFloat{
//        get{
//            return self.layer.cornerRadius
//         }
//        set{
//            layer.cornerRadius = newValue
//            layer.masksToBounds = (newValue > 0)
//        }
//    }
//}
class LoginViewController: UIViewController,RCAnimatedImagesViewDelegate {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var wallpapaerImageView: RCAnimatedImagesView!
    @IBAction func loginAction(sender: UIButton) {
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        struct Static {
            static var onceToken : dispatch_once_t = 0
            //            static var instance : Singleton? = nil
        }
        if self.userName.text == nil {
            return
        }
        dispatch_once(&Static.onceToken,{
            appDelegate?.connectSever(userid: self.userName.text!,completion: {
                let mainSb = UIStoryboard(name: "Main", bundle: nil)
                self.navigationController?.presentViewController(mainSb.instantiateViewControllerWithIdentifier("UITabBarController-fgX-q8-tvx"), animated: true, completion: nil)

            })
        })
    }
    @IBAction func rightMoreAction(sender: UIBarButtonItem) {
        showMenu1(sender)
//        self.wallpapaerImageView.stopAnimating()
    }
    
    func showMenu1(sender:UIBarButtonItem)  {
        var frame = sender.valueForKey("view")?.frame
        frame?.origin.y = (frame?.origin.y)! + 30
        //        KxMenu.setTintColor(UIColor.blueColor())
        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
            KxMenuItem.init("客服", image: UIImage.init(named: "news_selected"), target: self, action: #selector(LoginViewController.ClickMenu1)),
            KxMenuItem.init("好友列表", image: UIImage.init(named: "recommend_selected"), target: self, action: #selector(LoginViewController.ClickMenu2)),
            KxMenuItem.init("好友列表", image: UIImage.init(named: "recommend_selected"), target: self, action: #selector(LoginViewController.ClickMenu2))
            ])
    }
    let app = UIApplication.sharedApplication().delegate as! AppDelegate
    func ClickMenu1()  {
       let  serverSb = UIStoryboard(name: "Serve", bundle: nil)
       app.window?.rootViewController = serverSb.instantiateViewControllerWithIdentifier("ServerNav")
    }
    func ClickMenu2()  {
//        let  conversationlistSB = UIStoryboard(name: "Conversation", bundle: nil)
//        app.window?.rootViewController = conversationlistSB.instantiateViewControllerWithIdentifier("ConversationListNav")
    let mainSb = UIStoryboard(name: "Main", bundle: nil)
    self.navigationController?.presentViewController(mainSb.instantiateViewControllerWithIdentifier("UITabBarController-fgX-q8-tvx"), animated: true, completion: nil)
    }

    override func viewDidLoad() {
 
        super.viewDidLoad()
            
        // #MARK: - wallpaper
        self.wallpapaerImageView.delegate = self
        // #MARK: - 消除一像素的黑线
        let list = self.navigationController?.navigationBar.subviews
        if let newViews = list {
            for  view  in newViews {
                if view is UIImageView {
                    let thisView = view as UIView
                    thisView.hidden = true
                }
            }
 
        }

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.8) {
            self.loginStackView.axis = UILayoutConstraintAxis.Vertical
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.wallpapaerImageView.startAnimating()
        self.navigationController?.navigationBar.lt_setBackgroundColor(UIColor .clearColor())
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.lt_reset()
      
          self.navigationController?.navigationBar.lt_setBackgroundColor(UIColor.init(colorLiteralRed:0/255.0, green: 175/255.0, blue: 240/255.0, alpha: 1))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #MARK: -RCAnimatedImagesViewDelegate 
    func animatedImagesNumberOfImages(animatedImagesView: RCAnimatedImagesView!) -> UInt {
        return 3
    }
    func animatedImagesView(animatedImagesView: RCAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "image\(index+1)")
    }
    deinit{
        
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
