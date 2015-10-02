#import "TabController.h"


@implementation TabController

@synthesize secondsTxt,minutesTxt,hoursTxt, timer,backgroundTime;

//Flips to back when toggle button is pressed
- (IBAction)toggleInfoView:(id)sender {
	[secondsTxt resignFirstResponder];
	[minutesTxt resignFirstResponder];
	[hoursTxt resignFirstResponder];
	self.tabBar.hidden = TRUE;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
						   forView:[self view]
							 cache:YES];
	[[self view] addSubview:infoView];
	[UIView commitAnimations];
}

//Flips to front when "Done" is pressed
- (IBAction)returnInfoView:(id)sender {
	self.tabBar.hidden = FALSE;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
						   forView:[self view]
							 cache:YES];
	[infoView removeFromSuperview];
	[UIView commitAnimations];
}

- (IBAction)startPress:(id)sender{
	if (!timer && !([[secondsTxt text] intValue] == 0 && [[minutesTxt text] intValue] == 0 && [[hoursTxt text] intValue] == 0)) {
		[secondsTxt resignFirstResponder];
		[minutesTxt resignFirstResponder];
		[hoursTxt resignFirstResponder];
		timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTick) userInfo:nil repeats:YES];
	}
}
- (IBAction)stopPress:(id)sender{
	if (!timer) {
		//Reset
		[secondsTxt setText:@"00"];
		[minutesTxt setText:@"00"];
		[hoursTxt setText:@"00"];
	} else
	if (timer) {
		[timer invalidate];
		timer = nil;
	}
}
- (IBAction)fiveSecPress:(id)sender{
	int time = [[secondsTxt text] intValue];
	time += 5;
	if (time > 9) {
		[secondsTxt setText:[NSString stringWithFormat:@"%d",time]];
	} else {
		[secondsTxt setText:[NSString stringWithFormat:@"0%d",time]];
	}
	[self calibrateText];
}
- (IBAction)tenSecPress:(id)sender{
	int time = [[secondsTxt text] intValue];
	time += 10;
	if (time > 9) {
		[secondsTxt setText:[NSString stringWithFormat:@"%d",time]];
	} else {
		[secondsTxt setText:[NSString stringWithFormat:@"0%d",time]];
	}
	[self calibrateText];
}
- (IBAction)fifteenSecPress:(id)sender{
	int time = [[secondsTxt text] intValue];
	time += 15;
	if (time > 9) {
		[secondsTxt setText:[NSString stringWithFormat:@"%d",time]];
	} else {
		[secondsTxt setText:[NSString stringWithFormat:@"0%d",time]];
	}
	[self calibrateText];
}
- (IBAction)thirtySecPress:(id)sender{
	int time = [[secondsTxt text] intValue];
	time += 30;
	if (time > 9) {
		[secondsTxt setText:[NSString stringWithFormat:@"%d",time]];
	} else {
		[secondsTxt setText:[NSString stringWithFormat:@"0%d",time]];
	}
	[self calibrateText];
}
- (IBAction)oneMinPress:(id)sender{
	int time = [[minutesTxt text] intValue];
	time += 1;
	if (time > 9) {
		[minutesTxt setText:[NSString stringWithFormat:@"%d",time]];
	} else {
		[minutesTxt setText:[NSString stringWithFormat:@"0%d",time]];
	}
	[self calibrateText];
}
- (IBAction)twoMinPress:(id)sender{
	int time = [[minutesTxt text] intValue];
	time += 2;
	if (time > 9) {
		[minutesTxt setText:[NSString stringWithFormat:@"%d",time]];
	} else {
		[minutesTxt setText:[NSString stringWithFormat:@"0%d",time]];
	}
	[self calibrateText];
}
- (IBAction)fiveMinPress:(id)sender{
	int time = [[minutesTxt text] intValue];
	time += 5;
	if (time > 9) {
		[minutesTxt setText:[NSString stringWithFormat:@"%d",time]];
	} else {
		[minutesTxt setText:[NSString stringWithFormat:@"0%d",time]];
	}
	[self calibrateText];
}
- (IBAction)chooseBackgroundPress:(id)sender{
	UIImagePickerController *backgroundPicker;
	backgroundPicker = [[UIImagePickerController alloc]init];
		backgroundPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		
		backgroundPicker.delegate = self;
		
		//picker.allowsImageEditing = NO;
		
    [self presentViewController:backgroundPicker animated:YES completion:^(){}];
		//[self presentModalViewController: backgroundPicker animated: YES];
}
- (void)imagePickerController: (UIImagePickerController *)picker didFinishPickingImage: 
(UIImage *)image editingInfo: (NSDictionary *)editingInfo {
	[self dismissModalViewControllerAnimated:YES];
	background = image;
	[infoBg setImage:background];
	[timerBg setImage:background];
	[selectorBg setImage:background];
	[bgBtn setImage:background forState:0];

	NSData *theImageData = UIImageJPEGRepresentation(background, 1.0);
	[theImageData writeToFile:[NSString stringWithFormat:@"%@%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],@"/Background.png"] atomically:YES];
}
- (IBAction)redSliderChange:(id)sender{
	[secondsTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[minutesTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[hoursTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl1 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl2 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teachLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[toolsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[chooseBGLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[chooseTxtColorLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[redLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[greenLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[blueLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teach2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[tools2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[creditsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[ganLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[numOfStudLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[numOfGroupsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[dontRepeatLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
}
- (IBAction)greenSliderChange:(id)sender{
	[secondsTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[minutesTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[hoursTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl1 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl2 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teachLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[toolsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[chooseBGLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[chooseTxtColorLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[redLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[greenLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[blueLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teach2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[tools2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[creditsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[ganLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[numOfStudLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[numOfGroupsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[dontRepeatLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
}
- (IBAction)blueSliderChange:(id)sender{
	[secondsTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[minutesTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[hoursTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl1 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl2 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teachLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[toolsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[chooseBGLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[chooseTxtColorLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[redLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[greenLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[blueLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teach2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[tools2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[creditsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[ganLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[numOfStudLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[numOfGroupsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[dontRepeatLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
}

- (IBAction)chooseStudentPress:(id)sender{
	[numOfGroupsTxt resignFirstResponder];
	[numOfStudTxt resignFirstResponder];
	if ([[numOfGroupsTxt text] intValue] == 0) {[numOfGroupsTxt setText:@"1"];}
	if ([[numOfStudTxt text] intValue] == 0) {[numOfStudTxt setText:@"1"];}
	int student;
	int group;
	BOOL alreadyChosen = TRUE;
	int loopAmount;
	while (alreadyChosen) {
		alreadyChosen = FALSE;
		student = (int)(rand()%[[numOfStudTxt text] intValue])+1;
		group = (int)(rand()%[[numOfGroupsTxt text] intValue])+1;
		if ([DontRepeatSwitch isOn]) {
			for (int i = 0; i < [chosenStudents count]; i ++) {
				if ([[chosenStudents objectAtIndex:i] intValue] == student && [[chosenGroups objectAtIndex:i] intValue] == group) {
					alreadyChosen = TRUE;
				}
			}
		}
		loopAmount += 1;
		if (alreadyChosen && [[numOfStudTxt text] intValue]*[[numOfGroupsTxt text] intValue] < loopAmount) {
			[chosenGroups removeAllObjects];
			[chosenStudents removeAllObjects];
		}
	}
	[chosenStudents addObject:[NSNumber numberWithInt:student]];
	[chosenGroups addObject:[NSNumber numberWithInt:group]];
	[chosen insertObject:[NSString stringWithFormat:@"Group %d student %d",group,student] atIndex:0];
	[chosenTblView reloadData];
	//[chosenTblView selectRowAtIndexPath:1 animated:NO scrollPosition:UITableViewScrollPositionMiddle];
	[chosenTblView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
}
- (IBAction)chooseStudentInGroupPress:(id)sender {
	
}
- (IBAction)chooseGroupPress:(id)sender{
	[numOfGroupsTxt resignFirstResponder];
	[numOfStudTxt resignFirstResponder];
	if ([[numOfGroupsTxt text] intValue] == 0) {[numOfGroupsTxt setText:@"1"];}
	if ([[numOfStudTxt text] intValue] == 0) {[numOfStudTxt setText:@"1"];}
	int group;
	BOOL alreadyChosen = TRUE;
	int loopAmount = 0;
	while (alreadyChosen) {
		alreadyChosen = FALSE;
		group = (int)(rand()%[[numOfGroupsTxt text] intValue])+1;
		if ([DontRepeatSwitch isOn]) {
			for (int i = 0; i < [chosenStudents count]; i ++) {
				if ([[chosenGroups objectAtIndex:i] intValue] == group) {
					alreadyChosen = TRUE;
				}
			}
		}
		loopAmount += 1;
		if (alreadyChosen && [[numOfGroupsTxt text] intValue] < loopAmount) {
			[chosenGroups removeAllObjects];
			[chosenStudents removeAllObjects];
		}
	}
	[chosenStudents addObject:[NSNumber numberWithInt:0]];
	[chosenGroups addObject:[NSNumber numberWithInt:group]];
	[chosen insertObject:[NSString stringWithFormat:@"Group %d",group] atIndex:0];
	[chosenTblView reloadData];
	//[chosenTblView selectRowAtIndexPath:1 animated:NO scrollPosition:UITableViewScrollPositionMiddle];
	[chosenTblView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
}
- (IBAction)resetList:(id)sender {
	[numOfGroupsTxt resignFirstResponder];
	[numOfStudTxt resignFirstResponder];
	[chosenStudents removeAllObjects];
	[chosenGroups removeAllObjects];
	[chosen removeAllObjects];
	[chosenTblView reloadData];
}

- (IBAction)closeKeyboard:(id)sender {
	[numOfGroupsTxt resignFirstResponder];
	[numOfStudTxt resignFirstResponder];
}

- (void)timerTick {
	int seconds = [[secondsTxt text] intValue];
	int minutes = [[minutesTxt text] intValue];
	int hours = [[hoursTxt text] intValue];
	seconds -= 1;
	if (seconds < 0) {seconds = 59; minutes -= 1;}
	if (minutes < 0) {minutes = 59; hours -= 1;}
	if (seconds > 9) {
		[secondsTxt setText:[NSString stringWithFormat:@"%d",seconds]];
	} else {
		[secondsTxt setText:[NSString stringWithFormat:@"0%d",seconds]];
	}
	if (minutes > 9) {
		[minutesTxt setText:[NSString stringWithFormat:@"%d",minutes]];
	} else {
		[minutesTxt setText:[NSString stringWithFormat:@"0%d",minutes]];
	}
	if (hours > 9) {
		[hoursTxt setText:[NSString stringWithFormat:@"%d",hours]];
	} else {
		[hoursTxt setText:[NSString stringWithFormat:@"0%d",hours]];
	}
	if (seconds == 0 && minutes == 0 && hours == 0) {
		[timer invalidate];
		timer = nil;
		[self playRing];
	}
}
- (void)playRing {
	SystemSoundID soundID;
	NSString *path = [[NSBundle mainBundle]
					  pathForResource:@"Timer Ting" ofType:@"aiff"];    
	
	AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path],&soundID);
	AudioServicesPlaySystemSound (soundID);
	AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
	if (timer) {
		return NO;
	}
	return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if ([[textView text] length]==2) {
		NSString* text = [textView text];
		[textView setText:[text substringFromIndex:1]];
	}
	return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView {
	[self calibrateText];
}
- (void)calibrateText {
	int seconds = [[secondsTxt text] intValue];
	int minutes = [[minutesTxt text] intValue];
	int hours = [[hoursTxt text] intValue];
	while (seconds > 59) {
		seconds -= 60;
		minutes += 1;
	}
	while (minutes > 59) {
		minutes -= 60;
		hours += 1;
	}
	if (seconds > 9) {
		[secondsTxt setText:[NSString stringWithFormat:@"%d",seconds]];
	} else {
		[secondsTxt setText:[NSString stringWithFormat:@"0%d",seconds]];
	}
	if (minutes > 9) {
		[minutesTxt setText:[NSString stringWithFormat:@"%d",minutes]];
	} else {
		[minutesTxt setText:[NSString stringWithFormat:@"0%d",minutes]];
	}
	if (hours > 9) {
		[hoursTxt setText:[NSString stringWithFormat:@"%d",hours]];
	} else {
		[hoursTxt setText:[NSString stringWithFormat:@"0%d",hours]];
	}
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
	[self repositionInterface];
}
 
- (void)repositionInterface {
	if(inLandscape){
		hoursTxt.center = CGPointMake(128,69);
		minutesTxt.center = CGPointMake(240,69);
		secondsTxt.center = CGPointMake(352,69);
		colonLbl1.center = CGPointMake(181,72);
		colonLbl2.center = CGPointMake(295,72);
		teachLbl.center = CGPointMake(198, 29);
		toolsLbl.center = CGPointMake(277, 29);
		
		stopBtn.center = CGPointMake(184,154);
		startBtn.center = CGPointMake(296,154);
		infoBtn.center = CGPointMake(451,28);
		fiveSecBtn.center = CGPointMake(84,212);
		tenSecBtn.center = CGPointMake(161,212);
		fifteenSecBtn.center = CGPointMake(238,212);
		thirtySecBtn.center = CGPointMake(315,212);
		oneMinBtn.center = CGPointMake(392,212);
		twoMinBtn.center = CGPointMake(198,275);
		fiveMinBtn.center = CGPointMake(266,275);
		//firstButton.frame = CGRectMake(20, 20, 210, 260);
		//secondButton.frame = CGRectMake(250, 20, 210, 260);
		infoView.frame = CGRectMake(0, 20, 480, 320);
		
		infoBg.frame = CGRectMake(0, 0, 480, 320);
		timerBg.frame = CGRectMake(0, 0, 480, 320);
		selectorBg.frame = CGRectMake(0, 0, 480, 320);
		
		//Selector
		numOfStudLbl.center = CGPointMake(108,35);
		numOfGroupsLbl.center = CGPointMake(108,74);
		dontRepeatLbl.center = CGPointMake(142,115);
		chooseStudBtn.center = CGPointMake(390,35);
		chooseGroupBtn.center = CGPointMake(389,74);
		resetListBtn.center = CGPointMake(345,115);
		DontRepeatSwitch.center = CGPointMake(242,115);
		numOfStudTxt.center = CGPointMake(246,35);
		numOfGroupsTxt.center = CGPointMake(246,74);
		chosenTblView.frame = CGRectMake(0, 137, 480, 114);
		
		
	}else{
		hoursTxt.center = CGPointMake(48,90);
		minutesTxt.center = CGPointMake(160,90);
		secondsTxt.center = CGPointMake(272,90);
		colonLbl1.center = CGPointMake(101,93);
		colonLbl2.center = CGPointMake(215,93);
		teachLbl.center = CGPointMake(118, 29);
		toolsLbl.center = CGPointMake(197, 29);
		
		stopBtn.center = CGPointMake(104,195);
		startBtn.center = CGPointMake(216,195);
		infoBtn.center = CGPointMake(291,28);
		fiveSecBtn.center = CGPointMake(40,293);
		tenSecBtn.center = CGPointMake(117,293);
		fifteenSecBtn.center = CGPointMake(194,293);
		thirtySecBtn.center = CGPointMake(271,293);
		oneMinBtn.center = CGPointMake(80,349);
		twoMinBtn.center = CGPointMake(156,349);
		fiveMinBtn.center = CGPointMake(233,349);
		infoView.frame = CGRectMake(0, 20, 320, 480);
		
		infoBg.frame = CGRectMake(0, 0, 320, 480);
		timerBg.frame = CGRectMake(0, 0, 320, 480);
		selectorBg.frame = CGRectMake(0, 0, 320, 480);
		
		//Selector
		numOfStudLbl.center = CGPointMake(108,35);
		numOfGroupsLbl.center = CGPointMake(108,74);
		dontRepeatLbl.center = CGPointMake(62,209);
		chooseStudBtn.center = CGPointMake(91,132);
		chooseGroupBtn.center = CGPointMake(233,132);
		resetListBtn.center = CGPointMake(265,209);
		DontRepeatSwitch.center = CGPointMake(162,209);
		numOfStudTxt.center = CGPointMake(246,35);
		numOfGroupsTxt.center = CGPointMake(246,74);
		chosenTblView.frame = CGRectMake(0, 231, 320, 180);
	}
}

/*
 // Optional UITabBarControllerDelegate method.
 - (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
 }
 */

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
/**
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
**/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	chosen = [NSMutableArray new];
	chosenStudents = [NSMutableArray new];
	chosenGroups = [NSMutableArray new];
	[chosenTblView setDelegate:self];
	interfaceTimer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(interfaceTimerTick) userInfo:nil repeats:YES];
	[self loadSettings];
	
	background = [UIImage imageWithContentsOfFile: [NSString stringWithFormat:@"%@%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],@"/Background.png"]];
	if (background != nil) {
		[infoBg setImage:background];
		[timerBg setImage:background];
		[selectorBg setImage:background];
		[bgBtn setImage:background forState:0];
	}
	
    [super viewDidLoad];
}
- (void)interfaceTimerTick {
	[self repositionInterface];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	[self repositionInterface];
		return YES; //(interfaceOrientation == UIInterfaceOrientationPortrait);
	return NO;
}
//This method gets called before rotation so you can move your controls into the right spots.
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
		toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
	{
		inLandscape = TRUE;
	}
	else
	{
		inLandscape = FALSE;
	}
	[self repositionInterface];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
	[self repositionInterface];
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)saveSettings {
	NSMutableArray* toSave = [NSMutableArray new];
	[toSave addObject:[NSNumber numberWithFloat:redSlider.value]];
	[toSave addObject:[NSNumber numberWithFloat:greenSlider.value]];
	[toSave addObject:[NSNumber numberWithFloat:blueSlider.value]];
	[toSave addObject:notesView.text];
	[self saveFileInDocs:@"settings" object:toSave];
	[toSave release];
	//if (background != nil) {
	//	NSData *theImageData = UIImageJPEGRepresentation(background, 1.0);
	//	[theImageData writeToFile:@"savedBackground" atomically:YES];
	//}
}
- (void)loadSettings {
	NSMutableArray* toLoad = [self openFileInDocs:@"settings"];
	redSlider.value = [[toLoad objectAtIndex:0] floatValue];
	greenSlider.value = [[toLoad objectAtIndex:1] floatValue];
	blueSlider.value = [[toLoad objectAtIndex:2] floatValue];
	NSString* notesText = [toLoad objectAtIndex:3];
	[notesText retain];
	[notesView setText: notesText];
	//background = [UIImage imageNamed:@"savedBackground"];
	//if (background != nil) {
	//	[background retain];
	//	[infoBg setImage:background];
	//	[timerBg setImage:background];
	//	[selectorBg setImage:background];
	//	[bgBtn setImage:background forState:0];
	//} else {
	//	background = [UIImage imageNamed:@"Background.png"];
	//	[background retain];
	//	NSData *theImageData = UIImageJPEGRepresentation(background, 1.0);
	//	[theImageData writeToFile:@"savedBackground" atomically:YES];
	//}
	
	[secondsTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[minutesTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[hoursTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl1 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl2 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teachLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[toolsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[chooseBGLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[chooseTxtColorLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[redLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[greenLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[blueLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teach2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[tools2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[creditsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[ganLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[numOfStudLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[numOfGroupsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[dontRepeatLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
}
- (IBAction)resetSettings:(id)sender {
	redSlider.value = 0.0;
	greenSlider.value = 0.0;
	blueSlider.value = 0.0;
	
	background = [UIImage imageNamed:@"Background.png"];
	NSData *theImageData = UIImageJPEGRepresentation(background, 1.0);
	[theImageData writeToFile:[NSString stringWithFormat:@"%@%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],@"/Background.png"] atomically:YES];
	[infoBg setImage:background];
	[timerBg setImage:background];
	[selectorBg setImage:background];
	[bgBtn setImage:background forState:0];
	
	[self saveSettings];
	
	[secondsTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[minutesTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[hoursTxt setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl1 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[colonLbl2 setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teachLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[toolsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[chooseBGLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[chooseTxtColorLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[redLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[greenLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[blueLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[teach2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[tools2Lbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[creditsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[ganLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	
	[numOfStudLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[numOfGroupsLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
	[dontRepeatLbl setTextColor:[UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0]];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @"Students or Groups Chosen:";
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [chosen count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	
	// Set up the cell...
	//NSDictionary *dictionary = [chosen objectAtIndex:indexPath.row];
	//cell.text = [dictionary objectForKey:@"Title"];
	cell.textLabel.text = [chosen objectAtIndex:indexPath.row];
	return cell;
}

- (NSMutableArray*) openFileInDocs:(NSString*)name {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectoryPath = [paths objectAtIndex:0];
	NSString *path=[documentsDirectoryPath stringByAppendingPathComponent:name];
	NSMutableArray* openedObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
	[openedObject retain];
	return openedObject;
}
- (BOOL) saveFileInDocs:(NSString*)name object:(NSMutableArray*)object {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectoryPath = [paths objectAtIndex:0];
	NSString *path=[documentsDirectoryPath stringByAppendingPathComponent:name];
	
	// save the people array
	BOOL saved=[NSKeyedArchiver archiveRootObject:object toFile:path];
	return saved;
}

- (void)dealloc {
	if (timer) {
		[timer invalidate];
		timer = nil;
	}
	if (interfaceTimer) {
		[interfaceTimer invalidate];
		interfaceTimer = nil;
	}
	[chosen release];
	[chosenStudents release];
	[chosenGroups release];
    [super dealloc];
}


@end
