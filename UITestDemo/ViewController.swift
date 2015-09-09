//
//  ViewController.swift
//  UITestDemo
//
//  Created by WANG WEI on 2015/09/09.
//  Copyright © 2015年 OneV's Den. All rights reserved.
//

import UIKit

let userInfo = ["onevcat": "123"]

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if let userName = userNameTextField.text,
               password = passwordTextField.text
        {
            if userInfo[userName] == password {
                print("Login successfully.")
                return true
            } else {
                if userName.characters.count == 0 || password.characters.count == 0 {
                    UIAlertController.showAlertTitle("", message: "Empty username/password", cancelButtonTitle: "OK", fromViewController: self)
                } else {
                    UIAlertController.showAlertTitle("", message: "Invalid username/password", cancelButtonTitle: "OK", fromViewController: self)
                }

                return false
            }
        } else {
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

