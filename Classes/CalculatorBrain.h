//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Mary Romagnoli on 5/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
	
	double operand;
	double memory; // for storing values
	NSString *waitingOperation;
	double waitingOperand;

}
- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;

@end
