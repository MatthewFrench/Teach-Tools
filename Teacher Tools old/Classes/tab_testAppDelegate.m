//
//  tab_testAppDelegate.m
//  tab test
//
//  Created by Matthew French on 7/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "tab_testAppDelegate.h"


@implementation tab_testAppDelegate

@synthesize window;
@synthesize tabBarController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the tab bar controller's view to the window and display.
	
	NSLog(@"Started");
	
    [window addSubview:tabBarController.view];
    [window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
	//NSLog(@"Resigning");
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
	[tabBarController saveSettings];
	Class cls = NSClassFromString(@"UILocalNotification");
	timerActive = FALSE;
	timerRang = TRUE;
	if (tabBarController.timer && cls) {
		timerActive = TRUE;
		timerRang = FALSE;
		[tabBarController.timer invalidate];
		tabBarController.timer = nil;
		UIApplication *app                = [UIApplication sharedApplication];
		UILocalNotification *notification = [[UILocalNotification alloc] init];
		
		NSDate *notificationDate = [NSDate dateWithTimeIntervalSinceNow:
									[[tabBarController.secondsTxt text] intValue]+
									[[tabBarController.minutesTxt text] intValue]*60+
									[[tabBarController.hoursTxt text] intValue]*60*60
									];
		
		notification.fireDate  = notificationDate;
		notification.timeZone  = [NSTimeZone systemTimeZone];
		notification.alertBody = @"Time's Up";
		notification.soundName = @"Timer Ting.aiff";
		
		[app scheduleLocalNotification:notification];
	}
	tabBarController.backgroundTime = [[NSDate alloc] init];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	//NSLog(@"In Background");
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
	//NSLog(@"Recieved Notification");
	if (timerActive) {
		[tabBarController.timer invalidate];
		tabBarController.timer = nil;
	}
	[tabBarController.secondsTxt setText:@"00"];
	[tabBarController.minutesTxt setText:@"00"];
	[tabBarController.hoursTxt setText:@"00"];
	timerRang = TRUE;
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	//NSLog(@"Coming to foreground");
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
	
}
	


- (void)applicationDidBecomeActive:(UIApplication *)application {
	//NSLog(@"Active");
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
	[tabBarController loadSettings];
	if (timerActive) {
		[[UIApplication sharedApplication] cancelAllLocalNotifications];
		
		int timeLeft = [[tabBarController.secondsTxt text] intValue]+
		[[tabBarController.minutesTxt text] intValue]*60+
		[[tabBarController.hoursTxt text] intValue]*60*60;
		NSDate* now = [[NSDate alloc] init];
		double timeGone = [now timeIntervalSinceDate:tabBarController.backgroundTime];
		//NSLog(@"%g",timeGone);
		if (timeLeft != 0) {
			timeLeft -= timeGone;
			if (timeLeft > 0) {
				tabBarController.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:tabBarController selector:@selector(timerTick) userInfo:nil repeats:YES];
				[tabBarController.secondsTxt setText:[NSString stringWithFormat:@"%d",timeLeft]];
				[tabBarController.minutesTxt setText:@"00"];
				[tabBarController.hoursTxt setText:@"00"];
				[tabBarController calibrateText];
			} else {
				[tabBarController.timer invalidate];
				tabBarController.timer = nil;
				[tabBarController.secondsTxt setText:@"00"];
				[tabBarController.minutesTxt setText:@"00"];
				[tabBarController.hoursTxt setText:@"00"];
				if (timerRang == FALSE) {
					[tabBarController playRing];
				}
			}
		}
		[now release];
		[tabBarController.backgroundTime release];
	}
}


- (void)applicationWillTerminate:(UIApplication *)application {
	//NSLog(@"Terminating");
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	[tabBarController saveSettings];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
	NSLog(@"UH OH");
}


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

