//
//  TabController.h
//  Teacher Tools
//
//  Created by Matthew French on 7/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextViewFix.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "Selector View.h"
#import "NotesTextView.h"


@interface TabController : UITabBarController<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITableViewDelegate> {
	IBOutlet UITextViewFix *secondsTxt, *minutesTxt, *hoursTxt;
	IBOutlet UILabel *colonLbl1, *colonLbl2, *teachLbl,*toolsLbl; 
	IBOutlet UIButton *stopBtn,*startBtn,*fiveSecBtn,*tenSecBtn,*fifteenSecBtn
	,*thirtySecBtn,*oneMinBtn,*twoMinBtn,*fiveMinBtn,*infoBtn,*bgBtn;
	IBOutlet UISlider *redSlider,*greenSlider,*blueSlider;
	
	IBOutlet UILabel *chooseBGLbl,*chooseTxtColorLbl, *redLbl,*greenLbl,*blueLbl,*teach2Lbl,*tools2Lbl
	,*creditsLbl,*ganLbl;
	
	BOOL inLandscape;
	IBOutlet UIView *infoView;
	IBOutlet Selector_View *selectorView;
	
	IBOutlet UIImageView *infoBg,*timerBg,*selectorBg;
	
	NSTimer* timer, *interfaceTimer;
	UIImage* background;
	
	//Selector
	IBOutlet UILabel *numOfStudLbl,*numOfGroupsLbl,*dontRepeatLbl;
	IBOutlet UIButton *chooseStudBtn,*chooseGroupBtn,*resetListBtn,*chooseStudInGroupBtn;
	IBOutlet UISwitch *DontRepeatSwitch;
	IBOutlet UITextField *numOfStudTxt,*numOfGroupsTxt;
	IBOutlet UITableView *chosenTblView;
	
	NSMutableArray* chosen,*chosenStudents,*chosenGroups;
	
	IBOutlet NotesTextView* notesView;
	
	NSDate* backgroundTime;
}
@property(nonatomic,assign) UITextViewFix *secondsTxt, *minutesTxt, *hoursTxt;
@property(nonatomic,assign) NSTimer* timer;
@property(nonatomic,assign) NSDate* backgroundTime;
- (IBAction)closeKeyboard:(id)sender;
- (void)playRing;
- (void)timerTick;
- (void)repositionInterface;
- (void)calibrateText;
- (IBAction)toggleInfoView:(id)sender; //Action for toggle view
- (IBAction)returnInfoView:(id)sender;
- (IBAction)startPress:(id)sender;
- (IBAction)stopPress:(id)sender;
- (IBAction)fiveSecPress:(id)sender;
- (IBAction)tenSecPress:(id)sender;
- (IBAction)fifteenSecPress:(id)sender;
- (IBAction)thirtySecPress:(id)sender;
- (IBAction)oneMinPress:(id)sender;
- (IBAction)twoMinPress:(id)sender;
- (IBAction)fiveMinPress:(id)sender;
- (IBAction)chooseBackgroundPress:(id)sender;
- (IBAction)redSliderChange:(id)sender;
- (IBAction)greenSliderChange:(id)sender;
- (IBAction)blueSliderChange:(id)sender;
- (IBAction)chooseStudentPress:(id)sender;
- (IBAction)chooseStudentInGroupPress:(id)sender;
- (IBAction)chooseGroupPress:(id)sender;
- (IBAction)resetList:(id)sender;
- (IBAction)resetSettings:(id)sender;
- (void)saveSettings;
- (void)loadSettings;
- (NSMutableArray*) openFileInDocs:(NSString*)name;
- (BOOL) saveFileInDocs:(NSString*)name object:(NSMutableArray*)object;
@end
