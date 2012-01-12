//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Mary Romagnoli on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

// I AM THE CONTROLLER -- MVC 
@interface CalculatorViewController : UIViewController {
	IBOutlet UILabel *display;	// VIEW
	IBOutlet UILabel *errorpane;	// VIEW
	CalculatorBrain *brain;     // MODEL
	BOOL userIsInTheMiddleOfTypingANumber;
}

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;

@end

