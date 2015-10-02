//
//  DetailViewController.h
//  Teacher Tools
//
//  Created by Matthew French on 10/2/15.
//  Copyright © 2015 Matthew French. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

