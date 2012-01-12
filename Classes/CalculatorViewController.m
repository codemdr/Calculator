//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Mary Romagnoli on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

// lazily instantiate the model -- good to be judicious with memory on mobile devices
- (CalculatorBrain *)brain {
	if (!brain) // only do this if we dont have it already to save memory...
	{
		brain = [[CalculatorBrain alloc] init];
	}
	return brain;
}

// don't let them type 3.45.43 (multiple decimals)
- (BOOL)isADecimalAlreadyEntered:(NSString *) digit
{
	NSString *decimalpoint = @".";
	
	// if there is already a decimal typed in the current display then return true
	if ([digit isEqual:decimalpoint]) {
			NSRange textRange;
				textRange =[[display text] rangeOfString:decimalpoint];
		if(textRange.location != NSNotFound)
		{
			[errorpane setText:@"One decimal at a time please"];
			return YES; // already have a decimal point entered, ignore this
	    }
	}
	return NO;
}

// they pressed a digit on the screen
- (IBAction)digitPressed:(UIButton *)sender
{
	NSString *digit = [[sender titleLabel] text]; // get name of digit (0-9) from text of lable of the button sending message
	
	[errorpane setText: @""]; // clear out last error message
	
	// not a decimal point.  display in text window, appending if needed
	if (userIsInTheMiddleOfTypingANumber) {
		
		if ([self isADecimalAlreadyEntered:digit]) {
			return; // just ignore additional decimals
		}
		[display setText:[[display text] stringByAppendingString:digit]]; // append this digit to the display box 
	} else {
		[display setText:digit];
		userIsInTheMiddleOfTypingANumber = YES;
	}
	
}

// they pressed an operator button on the screen
- (IBAction)operationPressed:(UIButton *)sender
{
	[errorpane setText: @""]; // clear out last error message
	
	// if they are typing a number on keypad, show it in the display box
	if (userIsInTheMiddleOfTypingANumber) {
		[[ self brain] setOperand:[[display text] doubleValue]]; // the display's text converted to a double
		userIsInTheMiddleOfTypingANumber = NO;
	}
	
	// get the sender's titlelable then find out its text - that will be our "+" or "-" etc operation
		
	NSString *operation = [[sender titleLabel] text];			 // get the operation to be done
	double result = [[self brain] performOperation:operation];   // do the calculation
	[display setText:[NSString stringWithFormat:@"%g", result]];  // set result on display
	
}


 
@end
