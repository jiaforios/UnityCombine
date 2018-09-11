//
//  main.m
//  UnityCombine
//
//  Created by admin on 2018/9/10.
//  Copyright © 2018年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include "RegisterMonoModules.h"
#include "RegisterFeatures.h"
#include <csignal>

static const int constsection = 0;

void UnityInitTrampoline();
const char* AppControllerClassName = "AppDelegate";

int main(int argc, char * argv[]) {
    UnityInitStartupTime();

    @autoreleasepool {
        UnityInitTrampoline();
        UnityInitRuntime(argc, argv);
        
        RegisterMonoModules();
        NSLog(@"-> registered mono modules %p\n", &constsection);
        RegisterFeatures();
        
        // iOS terminates open sockets when an application enters background mode.
        // The next write to any of such socket causes SIGPIPE signal being raised,
        // even if the request has been done from scripting side. This disables the
        // signal and allows Mono to throw a proper C# exception.
        std::signal(SIGPIPE, SIG_IGN);
        
//        UIApplicationMain(argc, argv, nil, [NSString stringWithUTF8String: AppControllerClassName]);
        return UIApplicationMain(argc, argv, nil, [NSString stringWithUTF8String:AppControllerClassName]);
    }
    
}

#if TARGET_IPHONE_SIMULATOR && TARGET_TVOS_SIMULATOR

#include <pthread.h>

extern "C" int pthread_cond_init$UNIX2003(pthread_cond_t *cond, const pthread_condattr_t *attr)
{ return pthread_cond_init(cond, attr); }
extern "C" int pthread_cond_destroy$UNIX2003(pthread_cond_t *cond)
{ return pthread_cond_destroy(cond); }
extern "C" int pthread_cond_wait$UNIX2003(pthread_cond_t *cond, pthread_mutex_t *mutex)
{ return pthread_cond_wait(cond, mutex); }
extern "C" int pthread_cond_timedwait$UNIX2003(pthread_cond_t *cond, pthread_mutex_t *mutex,
                                               const struct timespec *abstime)
{ return pthread_cond_timedwait(cond, mutex, abstime); }

#endif // TARGET_IPHONE_SIMULATOR && TARGET_TVOS_SIMULATOR
