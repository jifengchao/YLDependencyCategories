//
//  UIColor+YLHEX.h
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import <UIKit/UIKit.h>

@interface UIColor (YLHEX)

/** 根据十六进制获取颜色对象
 hexString = FFFFFF 、 0xFFFFFF 、 0XFFFFFF、 #FFFFFF
 */
+ (UIColor *)yl_colorWithHexString:(NSString *)hexString;

/** 生成随机色*/
+ (UIColor *)yl_randomColor;

/** 获取颜色的十六进制数值*/
- (NSString *)yl_hexString;
/** 获取颜色的十六进制数值*/
+ (NSString *)yl_hexStringWithColor:(UIColor *)color;

@end
