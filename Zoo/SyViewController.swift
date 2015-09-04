//
//  ViewController.swift
//  Zoo
//
//  Created by Ifeng on 15/9/3.
//  Copyright (c) 2015年 pincher. All rights reserved.
//


import UIKit

class SyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    var plistData:NSString = ""
    var data:NSMutableDictionary = NSMutableDictionary()
    var SendUrl:NSString!
    //var plist
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //  -----------读取plist文件----------------
        plistData = NSBundle.mainBundle().pathForResource("SyPlist", ofType: "plist")!
        data = NSMutableDictionary(contentsOfFile: plistData as String)!
        


        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return data.count
        
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var tableCell : SyTableViewCell = tableView.dequeueReusableCellWithIdentifier("SyCell") as!SyTableViewCell
        
        var dataRow = indexPath.row + 1 //数组元素从1开始的，所以+1 ，indexPath默认为0
        
        var dataGroup = data["\(dataRow)"] as! NSDictionary
        
        
        var ImageUrl = dataGroup["image"] as! NSString
        tableCell.SyContentImage.image = UIImage(named:"\(ImageUrl)")
        tableCell.SyContentTitle.text = dataGroup["title"] as? String
        
    
        return tableCell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
    
        
        var idRow = indexPath.row + 1
        var idGroup = data["\(idRow)"] as! NSDictionary
        
        SendUrl = idGroup["url"] as! NSString
        var goDetailContent = DetailViewController()

        goDetailContent.ReceiveUrl = SendUrl
        
        self.performSegueWithIdentifier("goDetailContentSegue", sender: indexPath)

        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
             //segue 传值
        
                if segue.identifier == "goDetailContentSegue"{
                    
                    var goDetailContent = segue.destinationViewController as! DetailViewController
                   
                    goDetailContent.ReceiveUrl = SendUrl

                }
    
        
    }
    
    
}
