//
//  UIColor+YLHEX.m
//  YLCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIColor+YLHEX.h"

#import "UIColor+JKHEX.h"

@implementation UIColor (YLHEX)

/** 根据十六进制获取颜色对象
 hexString = FFFFFF 、 0xFFFFFF 、 0XFFFFFF、 #FFFFFF
 */
+ (UIColor *)yl_colorWithHexString:(NSString *)hexString {
    NSString *colorString = [hexString copy];
    colorString = [colorString stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    colorString = [colorString stringByReplacingOccurrencesOfString:@"0X" withString:@""];
    colorString = [colorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    return [UIColor jk_colorWithHexString:colorString];
}

/** 生成随机色*/
+ (UIColor *)yl_randomColor {
    UIColor *color;
    
    float randomRed   = (arc4random() % 255) / 255.0f;
    float randomGreen = (arc4random() % 255) / 255.0f;
    float randomBlue  = (arc4random() % 255) / 255.0f;
    
    color = [UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1.0];
    
    return color;
}

/** 获取颜色的十六进制数值*/
- (NSString *)yl_hexString {
    UIColor *color = self;
    
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
        green:components[0]
        blue:components[0]
        alpha:components[1]];
    }

    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }

    NSString *r, *g, *b;

    (int)((CGColorGetComponents(color.CGColor))[0]*255.0) == 0 ?(r = [NSString stringWithFormat:@"0%x",(int)((CGColorGetComponents(color.CGColor))[0]*255.0)]) :(r = [NSString stringWithFormat:@"%x", (int)((CGColorGetComponents(color.CGColor))[0]*255.0)]);

    (int)((CGColorGetComponents(color.CGColor))[1]*255.0) == 0 ?(g = [NSString stringWithFormat:@"0%x",(int)((CGColorGetComponents(color.CGColor))[1]*255.0)]) :(g = [NSString stringWithFormat:@"%x", (int)((CGColorGetComponents(color.CGColor))[1]*255.0)]);

    (int)((CGColorGetComponents(color.CGColor))[2]*255.0) == 0 ?(b = [NSString stringWithFormat:@"0%x",(int)((CGColorGetComponents(color.CGColor))[2]*255.0)]) :(b = [NSString stringWithFormat:@"%x", (int)((CGColorGetComponents(color.CGColor))[2]*255.0)]);

    return [NSString stringWithFormat:@"#%@%@%@",r,g,b];
}

/** 获取颜色的十六进制数值*/
+ (NSString *)yl_hexStringWithColor:(UIColor *)color {
    if (!color) return @"";
    return [color yl_hexString];
}

@end
