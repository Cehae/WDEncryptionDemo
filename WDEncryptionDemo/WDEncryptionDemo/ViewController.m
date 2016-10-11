//
//  ViewController.m
//  WDEncryptionDemo
//
//  Created by WD on 16/10/12.
//  Copyright © 2016年 WD. All rights reserved.
//  相关博客：http://blog.csdn.net/Cehae/article/details/52793701
//  Github：https://github.com/Cehae/WDEncryptionDemo

#import "ViewController.h"
#import "NSString+Hash.h"

#define salt @"shdcskjfcbskfnslfhs.kfsfvmsf8348390(*^^6R%@@IJEKHRKWKFGKF"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1.base64
    //[self base64];
    
    
    //2(明文+加盐)MD5
    
    NSLog(@"%@",[@"WD" md5String]);
    NSLog(@"%@",[[@"WD" stringByAppendingString:salt] md5String]);
    
    //3先加密+乱序
    //cb0fe21bfcc4c2625469d8ec6f3d710d--->12345
    NSLog(@"%@",[@"WD" hmacMD5StringWithKey:@"WDKEY"]);

}

-(void)base64
{
    NSLog(@"编码：%@",[self base64EncodeString:@"WD"]);
    NSLog(@"解码：%@",[self base64DecodeString:[self base64EncodeString:@"WD"]]);
}
//对一个字符串进行base64编码,并且返回
-(NSString *)base64EncodeString:(NSString *)string
{
    //1.先转换为二进制数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //2.对二进制数据进行base64编码,完成之后返回字符串
    return [data base64EncodedStringWithOptions:0];
}

//对base64编码之后的字符串解码,并且返回
-(NSString *)base64DecodeString:(NSString *)string
{
    //注意:该字符串是base64编码后的字符串
    //1.转换为二进制数据(完成了解码的过程)
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];
    
    //2.把二进制数据在转换为字符串
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
