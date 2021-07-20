//
//  UIView+YLTapPhotoBrowser.m
//  YLDependencyCategories
//
//  Created by YL on 2020/1/1.
//

#import "UIView+YLTapPhotoBrowser.h"

#if __has_include(<JKCategories/UIView+JKBlockGesture.h>)
#import <JKCategories/UIView+JKBlockGesture.h>
#else
#import "UIView+JKBlockGesture.h"
#endif

@implementation UIView (YLTapPhotoBrowser)

- (void)hyl_addTapOneImgWithImg:(UIImage *)img tapBlock:(void(^)(void))tapBlock showFromVC:(UIViewController *)showFromVC {
    [self hyl_addTapOneImgWithImgUrl:nil img:img tapBlock:tapBlock showFromVC:showFromVC];
}

- (void)hyl_addTapOneImgWithImgUrl:(NSString *)imgUrl tapBlock:(void(^)(void))tapBlock showFromVC:(UIViewController *)showFromVC {
    [self hyl_addTapOneImgWithImgUrl:imgUrl img:nil tapBlock:tapBlock showFromVC:showFromVC];
}

- (void)hyl_addTapOneImgWithImgUrl:(NSString *)imgUrl img:(UIImage *)img tapBlock:(void(^)(void))tapBlock showFromVC:(UIViewController *)showFromVC {
    self.userInteractionEnabled = YES;
    __weak typeof(self) weakSelf = self;
    [self jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        if (tapBlock) {
            tapBlock();
        }
        NSMutableArray *photos = [NSMutableArray new];
        GKPhoto *photo = [GKPhoto new];
        if (imgUrl.length) {
            photo.url = [NSURL URLWithString:imgUrl]; // 图片路径
        } else if (img) {
            photo.image = img;
        }
        if ([weakSelf isKindOfClass:[UIImageView class]]) {
            photo.sourceImageView = (UIImageView *)weakSelf;
        } else {
            photo.sourceFrame = weakSelf.frame;
        }
        [photos addObject:photo];
        
        NSInteger currentIndex = 0;
        [self __browserWithPhotos:photos currentIndex:currentIndex showFromVC:showFromVC];
    }];
}

- (void)hyl_addTapOneImgWithImgUrl:(NSString *)imgUrl urlsArray:(NSArray *)urlsArray browserBlock:(void(^)(GKPhotoBrowser *browser))browserBlock showFromVC:(UIViewController *)showFromVC {
    self.userInteractionEnabled = YES;
    __weak typeof(self) weakSelf = self;
    [self jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        NSMutableArray *photos = [NSMutableArray new];
        for (NSString *urlString in urlsArray)
        {
            GKPhoto *photo = [GKPhoto new];
            photo.url = [NSURL URLWithString:urlString];
            if ([weakSelf isKindOfClass:[UIImageView class]]) {
                photo.sourceImageView = (UIImageView *)weakSelf;
            } else {
                photo.sourceFrame = weakSelf.frame;
            }
            [photos addObject:photo];
        }
        
        NSInteger currentIndex = 0;
        if ([urlsArray containsObject:imgUrl]) {
            currentIndex = [urlsArray indexOfObject:imgUrl];
        }
        GKPhotoBrowser *browser = [self __browserWithPhotos:photos currentIndex:currentIndex showFromVC:showFromVC];
        
        if (browserBlock) { browserBlock(browser); }
    }];
}

/** 直接弹出*/
- (void)hyl_browserOneImgWithImgUrl:(NSString *)imgUrl urlsArray:(NSArray *)urlsArray browserBlock:(void(^)(GKPhotoBrowser *browser))browserBlock showFromVC:(UIViewController *)showFromVC {
    NSMutableArray *photos = [NSMutableArray new];
    for (NSString *urlString in urlsArray) {
        GKPhoto *photo = [GKPhoto new];
        photo.url = [NSURL URLWithString:urlString];
        if ([self isKindOfClass:[UIImageView class]]) {
            photo.sourceImageView = (UIImageView *)self;
        } else {
            photo.sourceFrame = self.frame;
        }
        [photos addObject:photo];
    }
    
    NSInteger currentIndex = 0;
    if ([urlsArray containsObject:imgUrl]) {
        currentIndex = [urlsArray indexOfObject:imgUrl];
    }
    GKPhotoBrowser *browser = [self __browserWithPhotos:photos currentIndex:currentIndex showFromVC:showFromVC];
    
    if (browserBlock) { browserBlock(browser); }
}

/** 直接弹出 oneImg*/
- (void)hyl_browserOneImgWithImg:(UIImage *)oneImg browserBlock:(void(^)(GKPhotoBrowser *browser))browserBlock showFromVC:(UIViewController *)showFromVC {
    if (!oneImg) { return; }
    
    NSMutableArray *photos = [NSMutableArray new];
    GKPhoto *photo = [GKPhoto new];
    photo.image = oneImg;
    if ([self isKindOfClass:[UIImageView class]]) {
        photo.sourceImageView = (UIImageView *)self;
    } else {
        photo.sourceFrame = self.frame;
    }
    [photos addObject:photo];
    
    NSInteger currentIndex = 0;
    GKPhotoBrowser *browser = [self __browserWithPhotos:photos currentIndex:currentIndex showFromVC:showFromVC];
    
    if (browserBlock) { browserBlock(browser); }
}

- (GKPhotoBrowser *)__browserWithPhotos:(NSArray<GKPhoto *> *)photos currentIndex:(NSInteger)currentIndex showFromVC:(UIViewController *)showFromVC {
    GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photos currentIndex:currentIndex];
    browser.showStyle = GKPhotoBrowserShowStyleZoom;
    browser.hideStyle = GKPhotoBrowserHideStyleZoomScale;
    browser.isFollowSystemRotation = YES;
    
    [browser showFromVC:showFromVC];
    
    return browser;
}

@end
