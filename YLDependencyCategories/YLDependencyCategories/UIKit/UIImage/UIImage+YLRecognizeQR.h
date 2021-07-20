//
//  UIImage+YLRecognizeQR.h
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLRecognizeQR)

/** 是否含有二维码*/
+ (void)yl_recognizeImageInnerQRWithImage:(UIImage *)image resultBlock:(void(^)(BOOL hasQR))resultBlock;

/** 是否含有二维码*/
- (void)yl_recognizeImageInnerQRWithResultBlock:(void(^)(BOOL hasQR))resultBlock;

/** 是否含有二维码*/
+ (void)yl_recognizeImageInnerQRWithBase64:(NSString *)imgBase64String resultBlock:(void(^)(BOOL hasQR))resultBlock;

@end
