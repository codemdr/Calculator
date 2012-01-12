//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Mary Romagnoli on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

- (void)setOperand:(double)anOperand
{
	operand = anOperand;

}

- (void) performWaitingOperation 
{
	if ([@"+" isEqual:waitingOperation]) {
		operand = waitingOperand + operand;
	} else if ([@"-" isEqual:waitingOperation]) {
		operand = waitingOperand - operand;
	} else if ([@"*" isEqual:waitingOperation]) {
		operand = waitingOperand * operand;
	} else if ([@"/" isEqual:waitingOperation]) {
		// make sure we don't divide by zero; if so fail
		// silently for now which isn't great
		if (operand) { 
			operand = waitingOperand / operand;
		}
	}
}

// only have setter not getter because our method returns the operand for ease of implementation
- (double)performOperation:(NSString *)operation
{
	// square root
	if ([operation isEqual:@"sqrt"]) {
		operand = sqrt(operand);
		
	// invert (1 divided by number)
	} else if ([operation isEqual:@"1/x"]) {
		if (operand) { // if 0 ignore but don't fail
			operand = 1 / operand;
		}
		
	// change sign from pos to neg or vice versa
	} else if ([operation isEqual:@"+/-"]) {
		operand =  operand * -1;
		
	// sine
	} else if ([operation isEqual:@"sin"]) {
		operand =  sin(operand);
	
	// cosine
	} else if ([operation isEqual:@"cos"]) {
		operand =  cos(operand);
	
	// store (memory)
	} else if ([operation isEqual:@"store"]) {
		memory = operand;
	
	// recall (memory)
	} else if ([operation isEqual:@"recall"]) {
		operand =  memory;
		
	// memory plus (add to memory)
	} else if ([operation isEqual:@"mem+"]) {
		memory = operand + memory;
		
	// clear all
	} else if ([operation isEqual:@"C"]) {
		memory = 0;
		operand = 0;
		waitingOperation = nil;
		waitingOperand = 0;
		
	// all other math functions
	} else {
		[self performWaitingOperation];
		waitingOperation = operation;
		waitingOperand = operand;
	}
	return operand;
}

@end
