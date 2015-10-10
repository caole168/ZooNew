//
//  DetailViewController.swift
//  Zoo
//
//  Created by caole on 15/9/4.
//  Copyright (c) 2015年 pincher. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController,UIWebViewDelegate {

    
    var ReceiveUrl:NSString!
    var ReceiveTitle:NSString!
    var ReceiveImage:NSString!
    var LoadUrl:NSString!
    var PageTitle:NSString!
    let Screen = UIScreen.mainScreen().bounds
    var loadImage = UIActivityIndicatorView()
    
    
    @IBOutlet weak var WebView: UIWebView!
    
    
    @IBAction func sharButton(sender: AnyObject) {

   
        
        let ShareController = UIAlertController(title: "分享到", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        
        let ShareToWxAction = UIAlertAction(title: "微信好友", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            sendText(0 , ShareTitle:self.ReceiveTitle , ShareUrl:self.ReceiveUrl)
        }
        
        let ShareToConmentsAction = UIAlertAction(title: "微信朋友圈", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            sendText(1 , ShareTitle:self.ReceiveTitle , ShareUrl:self.ReceiveUrl)
        }
        
        
        ShareController.addAction(ShareToWxAction)
        ShareController.addAction(ShareToConmentsAction)
        ShareController.addAction(cancelAction)
        
        presentViewController(ShareController, animated: true, completion: nil)
        
        
        
    }


    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        self.navigationItem.title = "\(ReceiveTitle)"

        let ScreenWidth = Screen.width
        let ScreenHeight = Screen.height
        
        LoadUrl = ReceiveUrl.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        WebView.frame = CGRectMake(0, 20, ScreenWidth, ScreenHeight)
        WebView.reload()
        WebView.reloadInputViews()
        WebView.loadRequest(NSURLRequest(URL:NSURL(string: "http://\(LoadUrl)")! ) )
        WebView.delegate = self
  
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    func webViewDidStartLoad(webView: UIWebView){
        
        let Screen = UIScreen.mainScreen().bounds
        let ScreenWidth = Screen.width
        let ScreenHeight = Screen.height
    
        

        loadImage.frame = CGRectMake(ScreenWidth/2.3, ScreenHeight/2, 50, 50)
        loadImage.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.view.addSubview(loadImage)
        loadImage.startAnimating()
        
        //webview开始加载
    
    }
    func webViewDidFinishLoad(webView: UIWebView){
        
        loadImage.stopAnimating()
        loadImage.hidesWhenStopped = true
        
        //webview结束加载
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?){
        
    }

    
//    
//    @IBAction func ShareWeChat(sender: AnyObject) {
//        let app = UIApplication.sharedApplication().delegate as! AppDelegate
//        app.sendText()
//
//        
//    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
