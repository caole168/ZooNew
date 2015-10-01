//
//  share.swift
//  Zoo
//
//  Created by Ifeng on 15/10/1.
//  Copyright © 2015年 pincher. All rights reserved.
//

import Foundation



func sendText(type:Int32) {
    
    //分享到好友
    let req = SendMessageToWXReq()
    
    //        req.text = "hahahahahhahahahhahah"
    
    
    
    
    //分享到朋友圈
    
    let shareUrl = WXWebpageObject()
    shareUrl.webpageUrl = "http://www.baidu.com"
    
    
    let message = WXMediaMessage()
    message.title = "zoo分享测试标题"
    message.description = "zoo分享测试描述"
    message.mediaObject = shareUrl
    
    
    req.message = message
    
    req.bText = false
    
    
    req.scene = Int32(type)
    WXApi.sendReq(req)
    
}
