//
//  UIImageView+YLWebCache.m
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIImageView+YLWebCache.h"

#if __has_include(<SDWebImage/UIImageView+WebCache.h>)
#import <SDWebImage/UIImageView+WebCache.h>
#else
#import "UIImageView+WebCache.h"
#endif

//#import <YYWebImage/UIImageView+YYWebImage.h>

@implementation UIImageView (YLWebCache)

- (void)yl_setImageWithURL:(NSURL *)url {
    [self yl_setImageWithURL:url placeholderImage:nil completed:nil];
}

- (void)yl_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [self yl_setImageWithURL:url placeholderImage:placeholder completed:nil];
}

- (void)yl_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(void(^)(UIImage *image))completedBlock {
    [self __locationUrl:url];
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (completedBlock) {
            completedBlock(image);
        }
    }];
}

/** 渐进式图片加载*/
- (void)yl_setImageProgressiveWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completion:(void(^)(UIImage *image))completion {
    [self __locationUrl:url];
    // 渐进式：边下载边显示
//    [self yy_setImageWithURL:url placeholder:placeholder options:YYWebImageOptionSetImageWithFadeAnimation completion:nil];
    
    // 渐进式：边下载边显示
//    [self yy_setImageWithURL:url placeholder:placeholder options:YYWebImageOptionSetImageWithFadeAnimation completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
//        if (completion) { completion(image); }
//    }];
}

#pragma mark private methods

/** 加载图片前预处理*/
- (void)__locationUrl:(NSURL *)url {
    // 对图片链接做统一处理
    /*
     如Debug版本，默认添加什么参数
     如默认添加前缀等
     */
}

/** 渐现动画
 https://www.jianshu.com/p/58532c8fa037
 */
- (void)__setImageWithFadeInAnimationWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(void(^)(UIImage *image))completedBlock {
    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (completedBlock) {
            completedBlock(image);
        }
        
        if (image) {
            // 设置动画（可自定义）
            CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            alphaAnimation.fromValue = @0.0f;
            alphaAnimation.toValue = @1.0f;
            alphaAnimation.duration = 0.5f;
            alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [weakSelf.layer addAnimation:alphaAnimation forKey:@""];
            [weakSelf setNeedsLayout];
        }
    }];
}

@end
