//
//  ViewController.h
//  NSUIRLConnect网络连接
//
//  Created by zh dk on 2017/8/30.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate,NSURLConnectionDelegate>

{
    //定义url连接对象,通过网络地址可以进行连接工作
    NSURLConnection *_connect ;
    //创建一个可变二进制数据对象，接收服务器传回的数据
    NSMutableData *_data;
}


@end

