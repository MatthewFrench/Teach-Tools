//
//  NotesTextView.m
//  Teacher Tools
//
//  Created by Matthew French on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NotesTextView.h"

@implementation NotesTextView

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
}
-(void)tapOccurred:(UITouch *)touch withEvent:(UIEvent *)event {
	if ([self isFirstResponder]) {
		[self resignFirstResponder];
	}
}
@end