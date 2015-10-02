//
//  Timer View.h
//  Teacher Tools
//
//  Created by Matthew French on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextViewFix.h"

@interface Timer_View : UIView {
	IBOutlet UITextViewFix *secondsTxt, *minutesTxt, *hoursTxt;
	IBOutlet UILabel *colonLbl1, *colonLbl2; 
	IBOutlet UIButton *stopBtn,*startBtn,*fiveSecBtn,*tenSecBtn,*fifteenSecBtn
	,*thirtySecBtn,*oneMinBtn,*twoMinBtn,*fiveMinBtn,*infoBtn;
	
	UIImageView* splashScreen;
}

@end
