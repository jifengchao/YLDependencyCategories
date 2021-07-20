//
//  NSString+YLParam.m
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSString+YLParam.h"

#import "NSURL+JKParam.h"

@implementation NSString (YLParam)

/** 参数转字典*/
- (NSDictionary *)yl_parameters {
    return [[NSURL URLWithString:self] jk_parameters];
}

/** 根据参数名 取参数值*/
- (NSString *)yl_valueForParameter:(NSString *)parameterKey {
    return [[self yl_parameters] objectForKey:parameterKey];
}

/** 根据参数字典 返回链接*/
+ (NSString *)yl_requestUrl:(NSURL *)url params:(NSDictionary *)params {
    return [[url absoluteString] yl_requestStringWith:params];
}

/** 根据参数字典 返回链接*/
- (NSString *)yl_requestStringWith:(NSDictionary *)params {
    if (!params) return self;
    // 参数拼接
    NSString *joinParamsString = [self __joinedKeysAndValuesWith:params];
    if (joinParamsString.length) {
        NSString *formatedPath = [self __formatUrlPathWith:self];
        return [formatedPath stringByAppendingString:joinParamsString];
    }
    return self;
}

- (NSString *)yl_urlAddCompnentForValue:(NSString *)value key:(NSString *)key {
    NSMutableString *string = [[NSMutableString alloc] initWithString:self];
    if (key.length == 0) return string.copy;
    @try {
        NSString *formatedPath = [self __formatUrlPathWith:string];
        NSString *joinParamsString = [NSString stringWithFormat:@"%@=%@",key,value];
        string = [[NSMutableString alloc] initWithString:[formatedPath stringByAppendingString:joinParamsString]];
    } @catch (NSException *exception) {
    } @finally {
    }
    
    return string.copy;
}

#pragma mark private methods

/** 处理url路径，以'?'或者'&'结尾*/
- (NSString *)__formatUrlPathWith:(NSString *)path {
    if (path.length == 0 || ![path isKindOfClass:[NSString class]]) return @"";
    NSRange range = [path rangeOfString:@"?"];
    if (range.location != NSNotFound) { // 包含'?'
        if ([path hasSuffix:@"?"]) { // 以'?'结尾
            return path;
        } else {
            /*判断结尾是否为'&'*/
            if ([path hasSuffix:@"&"]) { // 以'&'结尾
                return path;
            } else {
                return [NSString stringWithFormat:@"%@&", path];
            }
        }
    } else {
        return [NSString stringWithFormat:@"%@?", path];
    }
}

/** 将字典的键值对拼接(如：key=value&key=value)*/
- (NSString *)__joinedKeysAndValuesWith:(NSDictionary *)dic {
    if (!dic) return @"";
    NSArray *allKeys = [dic allKeys];
    if (allKeys.count == 0) return @"";
    NSString *joinedString = @"";
    for (int index = 0; index < allKeys.count; index++) {
        id key = allKeys[index];
        id value = dic[key];
        NSString *str1 = [NSString stringWithFormat:@"%@=%@", key, value];
        if (index != (allKeys.count - 1)) {
            str1 = [NSString stringWithFormat:@"%@&", str1];
        }
        joinedString = [joinedString stringByAppendingString:str1];
    }
    return joinedString;
}


@end
