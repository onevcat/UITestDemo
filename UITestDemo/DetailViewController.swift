//
//  DetailViewController.swift
//  UITestDemo
//
//  Created by Wang Wei on 2015/09/09.
//  Copyright © 2015年 OneV's Den. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var userName: String!
    @IBOutlet weak var countLabel: UILabel!
    
    var count: Int = 0 {
        didSet {
            countLabel.text = String(count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = userName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchValueChanged(sender: UISwitch) {
        if sender.on {
            count = count + 1
        } else {
            count = count - 1
        }
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
