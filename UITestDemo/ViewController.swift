//
//  ViewController.swift
//  UITestDemo
//
//  Created by WANG WEI on 2015/09/09.
//  Copyright © 2015年 OneV's Den. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Login"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPressed(sender: AnyObject) {

        if let userName = userNameTextField.text,
            password = passwordTextField.text
        {
            let indicator = UIActivityIndicatorView.showInView(view)
            APIClient.login(userName, password: password, completionHandler: { (successful, error) -> () in
                
                indicator.hide()
                
                if successful {
                    self.performSegueWithIdentifier("showDetail", sender: sender)
                } else {
                    switch error! {
                    case .EmptyUserName, .EmptyPassword:
                        UIAlertController.showAlertTitle("", message: "Empty username/password", cancelButtonTitle: "OK", fromViewController: self)
                    case .UserNotFound:
                        UIAlertController.showAlertTitle("", message: "User not exists", cancelButtonTitle: "OK", fromViewController: self)
                    case .WrongPassword:
                        UIAlertController.showAlertTitle("", message: "Wrong password", cancelButtonTitle: "OK", fromViewController: self)
                    }
                }
            })
        }  else {
            fatalError("should not hit here")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        (segue.destinationViewController as! DetailViewController).userName = userNameTextField.text
    }
}

extension UIAlertController {
    static func showAlertTitle(title: String?, message: String?, cancelButtonTitle: String?, fromViewController viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: cancelButtonTitle, style: .Cancel, handler: nil)
        alert.addAction(action)
        viewController.presentViewController(alert, animated: true, completion: nil)
    }
}

var activityShowingCount = 0
extension UIActivityIndicatorView {
    
    static func showInView(view: UIView) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        indicator.center = view.center
        
        view.addSubview(indicator)
        indicator.startAnimating()
        
        if activityShowingCount == 0 {
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        }
        
        activityShowingCount += 1
        
        return indicator
    }
    
    func hide() {
        activityShowingCount -= 1
        if activityShowingCount == 0 {
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        }

        removeFromSuperview()
    }
}

