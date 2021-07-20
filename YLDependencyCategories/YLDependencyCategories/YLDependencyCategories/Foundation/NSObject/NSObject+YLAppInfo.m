//
//  NSObject+YLAppInfo.m
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import "NSObject+YLAppInfo.h"

#import <sys/utsname.h>
#import <AdSupport/ASIdentifierManager.h>
#import "UIDevice+JKHardware.h"

@implementation NSObject (YLAppInfo)

- (NSString *)yl_systemVersion {
    return [UIDevice jk_systemVersion];
}

- (NSString *)yl_platformString {
    return [UIDevice jk_platformString];
}

- (NSString *)yl_version {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

- (NSInteger)yl_build {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return [app_build integerValue];
}

- (NSString *)yl_identifier {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * bundleIdentifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}

- (NSString *)yl_currentLanguage {
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages firstObject];
    return [NSString stringWithString:currentLanguage];
}

- (NSString *)yl_deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return [NSString stringWithString:deviceString];
}

- (NSString *)yl_appDisplayName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appDisplayName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    if (!appDisplayName.length) {
        appDisplayName = [infoDictionary objectForKey:@"CFBundleName"];
    }
    return appDisplayName;
}

- (NSString *)yl_getIDFA {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

/** 打印*/
- (void)yl_printAppInfo {
    NSLog(@"systemVersion = %@", [self yl_systemVersion]);
    NSLog(@"platformString = %@", [self yl_platformString]);
    NSLog(@"version = %@", [self yl_version]);
    NSLog(@"build = %zd", [self yl_build]);
    NSLog(@"identifier = %@", [self yl_identifier]);
    NSLog(@"currentLanguage = %@", [self yl_currentLanguage]);
    NSLog(@"deviceModel = %@", [self yl_deviceModel]);
    NSLog(@"appDisplayName = %@", [self yl_appDisplayName]);
}

@end
