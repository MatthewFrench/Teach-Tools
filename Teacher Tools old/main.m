//
//  main.m
//  tab test
//
//  Created by Matthew French on 7/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tab_testAppDelegate.h"

int main(int argc, char *argv[]) {
    //NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    //int retVal = UIApplicationMain(argc, argv, nil, nil);
    //[pool release];
    //return retVal;
    
   // int main(int argc, char * argv[]) {
        @autoreleasepool {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([tab_testAppDelegate class]));
        }
   // }

}

