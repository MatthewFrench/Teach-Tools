//
//  Selector View.m
//  Teacher Tools
//
//  Created by Matthew French on 7/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Selector View.h"
#import "TabController.h"
#import "tab_testAppDelegate.h"

@implementation Selector_View


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}
- (void)awakeFromNib {
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	[studentsTxt resignFirstResponder];
	[groupTxt resignFirstResponder];
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

- (void)drawRect:(CGRect)rect {
    tab_testAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	[delegate.tabBarController repositionInterface];
}

- (void)dealloc {
    [super dealloc];
}


@end
