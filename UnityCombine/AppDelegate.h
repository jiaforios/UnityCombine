//
//  AppDelegate.h
//  UnityCombine
//
//  Created by admin on 2018/9/10.
//  Copyright © 2018年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UnityAppController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWindow *unityWindow;

@property (strong, nonatomic)UnityAppController* unityController;

- (void)showUnityWindow;
- (void)hideUnityWindow;

@end

