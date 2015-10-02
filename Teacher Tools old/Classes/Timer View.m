//
//  Timer View.m
//  Teacher Tools
//
//  Created by Matthew French on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Timer View.h"
#import "TabController.h"
#import "tab_testAppDelegate.h"


@implementation Timer_View


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}
- (void)awakeFromNib {
	splashScreen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
	splashScreen.frame = CGRectMake(0, -20, 320, 480);
	[self addSubview:splashScreen];
	[self bringSubviewToFront:splashScreen];
	[splashScreen setAlpha:1.0];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[splashScreen setAlpha:0];
	[UIView commitAnimations];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    tab_testAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	[delegate.tabBarController repositionInterface];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	/**
	NSArray* allTouches = [touches allObjects];
	
	for (int i = 0; i < [allTouches count]; i +=1) {
		if (touch1 == nil) {
			touch1 = [allTouches objectAtIndex:i];
			//CGPoint touch = CGPointMake([[allTouches objectAtIndex:i] locationInView:self].y, 320+320/2-[[allTouches objectAtIndex:i] locationInView:self].x);
			CGPoint touch = CGPointMake([[allTouches objectAtIndex:i] locationInView:self].x, [[allTouches objectAtIndex:i] locationInView:self].y);
			touchedScreenBegan1 = touch;
		} else if (touch2 == nil) {
			touch2 = [allTouches objectAtIndex:i];
			CGPoint touch = CGPointMake([[allTouches objectAtIndex:i] locationInView:self].x, [[allTouches objectAtIndex:i] locationInView:self].y);
			touchedScreenBegan2 = touch;
		}
	}
	**/
	[secondsTxt resignFirstResponder];
	[minutesTxt resignFirstResponder];
	[hoursTxt resignFirstResponder];
}
- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event{
	/**
	NSArray* allTouches = [touches allObjects];
	
	for (int i = 0; i < [allTouches count]; i +=1) {
		if ([allTouches objectAtIndex:i] == touch1) {
			CGPoint touch = CGPointMake([[allTouches objectAtIndex:i] locationInView:self].x, [[allTouches objectAtIndex:i] locationInView:self].y);
			touchedScreenMoved1 = touch;
		} else if ([allTouches objectAtIndex:i] == touch2) {
			CGPoint touch = CGPointMake([[allTouches objectAtIndex:i] locationInView:self].x, [[allTouches objectAtIndex:i] locationInView:self].y);
			touchedScreenMoved2 = touch;
		}
	}
	**/
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	/**
	NSArray* allTouches = [touches allObjects];
	
	for (int i = 0; i < [allTouches count]; i +=1) {
		if ([allTouches objectAtIndex:i] == touch1) {
			CGPoint touch = CGPointMake([[allTouches objectAtIndex:i] locationInView:self].x, [[allTouches objectAtIndex:i] locationInView:self].y);
			touchedScreenEnded1 = touch;
			touch1 = nil;
		} else if ([allTouches objectAtIndex:i] == touch2) {
			CGPoint touch = CGPointMake([[allTouches objectAtIndex:i] locationInView:self].x, [[allTouches objectAtIndex:i] locationInView:self].y);
			touchedScreenEnded2 = touch;
			touch2 = nil;
		}
		
	}
	**/
}
- (BOOL)acceptsFirstResponder {
	return YES;
}

- (void)dealloc {
	[splashScreen release];
    [super dealloc];
}


@end
