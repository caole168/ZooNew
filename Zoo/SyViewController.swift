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
    var SendTitle:NSString!
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
        var tableCell : SyTableViewCell = tableView.dequeueReusableCellWithIdentifier("SyCell") as! SyTableViewCell
        
    
        //屏幕尺寸
        let Screen = UIScreen.mainScreen().bounds
        let ScreenWidth = Screen.width
        let ScreenHeight = Screen.height
        
        
        //cell元素
        var SyContnetImage = UIImageView()
        
        var SyContentTitle = UILabel()
        SyContentTitle.numberOfLines = 2
        SyContentTitle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        SyContentTitle.textAlignment = NSTextAlignment.Justified
        
        var SyContentTime = UILabel()
        SyContentTime.font = UIFont(name: "", size: 1)
        
        
        
        //加载数据
        var dataRow = indexPath.row + 1 //数组元素从1开始的，所以+1 ，indexPath默认为0
        var dataGroup = data["\(dataRow)"] as! NSDictionary
        var ImageUrl = dataGroup["image"] as! NSString
        
    
        

        
        //屏幕尺寸判断
        
        self.view.frame = CGRect(x: 0, y: 20, width: ScreenWidth, height:4000 )

        if Screen.width == 320.0{
            
            SyContnetImage.frame = CGRectMake(18, 18, 282, 153)
            SyContentTitle.frame = CGRectMake(22, 182, 282, 50)   //**1.17
            tableCell.frame = CGRectMake(0, 0, ScreenWidth, 180)
            println(tableCell.frame)

            
        }

        
        
        if Screen.width == 375.0{
            SyContnetImage.frame = CGRectMake(22,22,ScreenWidth-44,180) //331*180
            SyContentTitle.frame = CGRectMake(22,200, ScreenWidth-44,50)
            SyContentTime.frame = CGRectMake(22, 240, ScreenWidth-44, 20)
            tableCell.frame = CGRectMake(0, 0, ScreenWidth, 600)
        
            println(tableCell.frame)

            
                        }
        
        
        
        if Screen.width == 414.0{   //1.10
            
            SyContnetImage.frame = CGRectMake(24, 24, 364, 198)
            SyContentTitle.frame = CGRectMake(24, 235,364, 30)
        }
        
        
        
        //添加页面元素
        tableCell.frame = CGRectMake(0, 20, ScreenWidth, 1000)
        tableCell.addSubview(SyContnetImage)
        tableCell.addSubview(SyContentTitle)
 //       tableCell.addSubview(SyContentTime)
        
     
        
        //赋值
        SyContnetImage.image = UIImage(named:"\(ImageUrl)")
        SyContentTitle.text = dataGroup["title"] as? String
        SyContentTime.text = dataGroup["time"] as? String
        println(SyContentTime.text)
        
    
        return tableCell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
    
        
        var dataRow = indexPath.row + 1
        var dataGroup = data["\(dataRow)"] as! NSDictionary
        
        SendUrl = dataGroup["url"] as! NSString
        SendTitle = dataGroup["title"] as! NSString
        
    
        var goDetailContent = DetailViewController()
        
        goDetailContent.ReceiveUrl = SendUrl
        goDetailContent.PageTitle = SendTitle
        println(goDetailContent.ReceiveUrl)
        println(goDetailContent.PageTitle)
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

