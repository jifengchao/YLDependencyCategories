//
//  NSObject+YLAppInfo.h
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import <Foundation/Foundation.h>

@interface NSObject (YLAppInfo)

- (NSString *)yl_systemVersion;
- (NSString *)yl_platformString;
- (NSString *)yl_version;
- (NSInteger)yl_build;
- (NSString *)yl_identifier;
- (NSString *)yl_currentLanguage;
- (NSString *)yl_deviceModel;
- (NSString *)yl_appDisplayName;
- (NSString *)yl_getIDFA;

/** 打印*/
- (void)yl_printAppInfo;

@end
