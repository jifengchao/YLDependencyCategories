//
//  UIImage+YLRecognizeQR.m
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIImage+YLRecognizeQR.h"

#import "ZXingObjC.h"

@implementation UIImage (YLRecognizeQR)

/** 是否含有二维码*/
+ (void)yl_recognizeImageInnerQRWithImage:(UIImage *)image resultBlock:(void(^)(BOOL hasQR))resultBlock {
    if (!resultBlock) { return; }
    if (!image) {
        resultBlock(NO);
        return;
    }
    // 开始识别(借助'ZXingObjC'库)
    [self __recognizeImage:image block:^(ZXBarcodeFormat barcodeFormat, NSString *str) {
        if (str.length) {
            NSLog(@"图像中的二维码 = %@", str);
            resultBlock(YES);
        } else {
            resultBlock(NO);
        }
    }];
}

/** 是否含有二维码*/
- (void)yl_recognizeImageInnerQRWithResultBlock:(void(^)(BOOL hasQR))resultBlock {
    [UIImage yl_recognizeImageInnerQRWithImage:self resultBlock:resultBlock];
}

/** 是否含有二维码*/
+ (void)yl_recognizeImageInnerQRWithBase64:(NSString *)imgBase64String resultBlock:(void(^)(BOOL hasQR))resultBlock {
    if (imgBase64String.length == 0) { return; }
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:imgBase64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:imageData];
    [UIImage yl_recognizeImageInnerQRWithImage:image resultBlock:resultBlock];
}

#pragma mark private methods

/** 识别图片中是否存在二维码*/
+ (void)__recognizeImage:(UIImage*)image block:(void(^)(ZXBarcodeFormat barcodeFormat, NSString *str))block {
    ZXCGImageLuminanceSource *source = [[ZXCGImageLuminanceSource alloc] initWithCGImage:image.CGImage];
    
    ZXHybridBinarizer *binarizer = [[ZXHybridBinarizer alloc] initWithSource: source];
    
    ZXBinaryBitmap *bitmap = [[ZXBinaryBitmap alloc] initWithBinarizer:binarizer];
    
    NSError *error;
    
    id<ZXReader> reader;
    
    if (NSClassFromString(@"ZXMultiFormatReader")) {
        reader = [NSClassFromString(@"ZXMultiFormatReader") performSelector:@selector(reader)];
    }
    
    ZXDecodeHints *_hints = [ZXDecodeHints hints];
    ZXResult *result = [reader decode:bitmap hints:_hints error:&error];
    
    if (result == nil) {
        block(kBarcodeFormatQRCode, nil);
    } else {
        block(result.barcodeFormat, result.text);
    }
}

@end
