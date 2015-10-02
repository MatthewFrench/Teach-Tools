//
//  MainWindow.m
//  Teacher Tools
//
//  Created by Matthew French on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainWindow.h"
#import "TabController.h"
#import "tab_testAppDelegate.h"

@implementation MainWindow
-(void)sendEvent:(UIEvent *)event {
	//Can detect what the touch is doing and what it's touching. Useful.
	
	//loop over touches for this event
	for(UITouch *touch in [event allTouches]) {
		BOOL touchEnded = (touch.phase == UITouchPhaseEnded);
		BOOL isSingleTap = (touch.tapCount == 1);
		BOOL isHittingCustomTextView = 
		(touch.view.class == [NotesTextView class]);
		if(touchEnded && isSingleTap && isHittingCustomTextView) {
			NotesTextView *tv = (NotesTextView*)touch.view;
			[tv tapOccurred:touch withEvent:event];
		}
		if (touchEnded) {
			tab_testAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
			[delegate.tabBarController repositionInterface];
		}
	}
	[super sendEvent:event];
}
@end
