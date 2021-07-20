//
//  YLViewController.m
//  YLDependencyCategories
//
//  Created by jifengchao on 06/28/2021.
//  Copyright (c) 2021 jifengchao. All rights reserved.
//

#import "YLViewController.h"

#import <NSString+YLParam.h>
#import <UIImage+YLRecognizeQR.h>
#import <NSObject+YLAppInfo.h>
#import <UIColor+YLHEX.h>
#import <UIView+YLTapPhotoBrowser.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self test3];
    
    UIColor *color = [UIColor yl_randomColor];
//    self.view.backgroundColor = color;
    NSLog(@"随机色 = %@", [color yl_hexString]);
}

- (void)test3 {
    NSString *url = @"https://img1.baidu.com/it/u=2192265457,2884791613&fm=26&fmt=auto&gp=0.jpg";
    UIImageView *imgView = [UIImageView new];
    imgView.frame = CGRectMake(20, 100, 100, 100);
    [self.view addSubview:imgView];
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:url]];
    
    // 点击事件
    [imgView hyl_addTapOneImgWithImgUrl:url tapBlock:^{
        // 点击了
        NSLog(@"点击了，图片浏览");
    } showFromVC:self];
}

- (void)test2 {
    [self yl_printAppInfo];
}

- (void)test1 {
    UIImage *img1 = [UIImage imageNamed:@"no"];
    UIImage *img2 = [UIImage imageNamed:@"yes"];
    
    [img1 yl_recognizeImageInnerQRWithResultBlock:^(BOOL hasQR) {
        NSLog(@"");
    }];
    
    [UIImage yl_recognizeImageInnerQRWithImage:img2 resultBlock:^(BOOL hasQR) {
        NSLog(@"");
    }];
}

- (void)test
{
    NSString *str = @"https://www.baidu.com?search=123&user_id=121";
    
    NSDictionary *extra = @{
        @"name": @"daichao",
        @"weight": @20,
    };
    
    str = [str yl_requestStringWith:extra];
    
    NSDictionary *parms = [str yl_parameters];
    NSLog(@"");
}

@end
