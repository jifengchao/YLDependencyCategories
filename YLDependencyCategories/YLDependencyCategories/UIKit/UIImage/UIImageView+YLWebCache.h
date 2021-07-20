//
//  UIImageView+YLWebCache.h
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YLWebCache)

- (void)yl_setImageWithURL:(NSURL *)url;

- (void)yl_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)yl_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(void(^)(UIImage *image))completedBlock;

/** 渐进式图片加载*/
- (void)yl_setImageProgressiveWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completion:(void(^)(UIImage *image))completion;

@end
