//
//  AppDelegate.h
//  Demos
//
//  Created by HK on 2018/10/12.
//  Copyright © 2018年 HK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (UIViewController *)currentViewController;

@end

