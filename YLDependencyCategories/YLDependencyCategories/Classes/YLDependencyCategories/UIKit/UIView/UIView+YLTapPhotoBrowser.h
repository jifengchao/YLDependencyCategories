//
//  UIView+HYLTapPhotoBrowser.h
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

#if __has_include(<GKPhotoBrowser.h>)
#import <GKPhotoBrowser.h>
#else
#import "GKPhotoBrowser.h"
#endif

@interface UIView (YLTapPhotoBrowser)

- (void)hyl_addTapOneImgWithImg:(UIImage *)img tapBlock:(void(^)(void))tapBlock showFromVC:(UIViewController *)showFromVC;

- (void)hyl_addTapOneImgWithImgUrl:(NSString *)imgUrl tapBlock:(void(^)(void))tapBlock showFromVC:(UIViewController *)showFromVC;

/** 单击方法图片*/
- (void)hyl_addTapOneImgWithImgUrl:(NSString *)imgUrl img:(UIImage *)img tapBlock:(void(^)(void))tapBlock showFromVC:(UIViewController *)showFromVC;

- (void)hyl_addTapOneImgWithImgUrl:(NSString *)imgUrl urlsArray:(NSArray *)urlsArray browserBlock:(void(^)(GKPhotoBrowser *browser))browserBlock showFromVC:(UIViewController *)showFromVC;

/** 直接弹出*/
- (void)hyl_browserOneImgWithImgUrl:(NSString *)imgUrl urlsArray:(NSArray *)urlsArray browserBlock:(void(^)(GKPhotoBrowser *browser))browserBlock showFromVC:(UIViewController *)showFromVC;

/** 直接弹出 oneImg*/
- (void)hyl_browserOneImgWithImg:(UIImage *)oneImg browserBlock:(void(^)(GKPhotoBrowser *browser))browserBlock showFromVC:(UIViewController *)showFromVC;

@end
