//
//  tab_testAppDelegate.h
//  tab test
//
//  Created by Matthew French on 7/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabController.h"

@interface tab_testAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TabController *tabBarController;
	
	BOOL timerActive,timerRang;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TabController *tabBarController;

@end
