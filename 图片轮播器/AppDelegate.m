//
//  AppDelegate.m
//  图片轮播器
//
//  Created by 郝一鹏 on 16/3/16.
//  Copyright © 2016年 bupt. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ViewController *VC = [[ViewController alloc] init];
    self.window.rootViewController = VC;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
