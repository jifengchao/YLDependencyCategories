//
//  NSString+YLParam.h
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSString (YLParam)

/** 参数转字典*/
- (NSDictionary *)yl_parameters;

/** 根据参数名 取参数值*/
- (NSString *)yl_valueForParameter:(NSString *)parameterKey;

/** 根据参数字典 返回链接*/
+ (NSString *)yl_requestUrl:(NSURL *)url params:(NSDictionary *)params;

/** 根据参数字典 返回链接*/
- (NSString *)yl_requestStringWith:(NSDictionary *)params;
- (NSString *)yl_urlAddCompnentForValue:(NSString *)value key:(NSString *)key;

@end
