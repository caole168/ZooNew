//
//  DetailViewController.swift
//  Zoo
//
//  Created by caole on 15/9/4.
//  Copyright (c) 2015年 pincher. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var ReceiveUrl:NSString!
    var LoadUrl:NSString!
    

    @IBOutlet weak var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println(ReceiveUrl)
        println(LoadUrl)
        LoadUrl = ReceiveUrl.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        WebView.reload()
        WebView.reloadInputViews()
        println(ReceiveUrl)
        println(LoadUrl)
        //     browserView.loadRequest(b)
        WebView.loadRequest(NSURLRequest(URL:NSURL(string: "http://\(LoadUrl)")! ) )
   
  
        
     
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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