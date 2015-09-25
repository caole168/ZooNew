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
    var LoadUrl:NSString!
    var PageTitle:NSString!
    
    var loadImage = UIActivityIndicatorView()
    
    

    @IBOutlet weak var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        print(ReceiveUrl)
        
        
        
        
        self.navigationItem.title = "\(PageTitle)"
        let Screen = UIScreen.mainScreen().bounds
        let ScreenWidth = Screen.width
        let ScreenHeight = Screen.height
        
        LoadUrl = ReceiveUrl.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        WebView.frame = CGRectMake(0, 20, ScreenWidth, ScreenHeight)
        WebView.reload()
        WebView.reloadInputViews()

        //     browserView.loadRequest(b)
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
