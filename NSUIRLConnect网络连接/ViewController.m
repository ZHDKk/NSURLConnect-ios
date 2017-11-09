//
//  ViewController.m
//  NSUIRLConnect网络连接
//
//  Created by zh dk on 2017/8/30.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"连接数据" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void) pressBtn
{
    //定义字符串网址
    NSString *strUrl = @"http://www.baidu.com";
    
    //将字符串转换成一个地址连接对象
    NSURL *url = [NSURL URLWithString:strUrl];
    
    //定义一个链接请求对象，在连接之前的信息的封装
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //创建一个网络连接对象
    _connect = [NSURLConnection connectionWithRequest:request delegate:self];
    
    _data = [[NSMutableData alloc]init];
}

//处理错误信息的代理协议
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error = %@",error);
}
//处理服务器返回的响应码
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse *res = (NSHTTPURLResponse*) response;
    
    if (res.statusCode == 200) {
        NSLog(@"连接成功");
    }
    else if (res.statusCode == 404){
        NSLog(@"服务器正常开启，没有找到连接地址页面或数据");
    }
    else if (res.statusCode == 500){
        NSLog(@"服务器宕机或关机");
    }
}

//接收服务器回传的数据时调用
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    //将每次回传的数据连接起来
    [_data appendData:data];
}

//
-(void) connectionDidFinishLoading:(NSURLConnection*) connection
{
    //将二进制数据转化为字符串数据
    NSString *str=[[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    NSLog(@"baidu page = %@",str);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
