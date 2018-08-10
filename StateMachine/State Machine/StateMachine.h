//
//  StateMachine.h
//  StateMachine
//
//  Created by Aliaksei Piatyha on 8/9/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APEvent.h"
#import "APState.h"

@interface StateMachine : NSObject

@property (nonatomic, assign) APState currentState;

- (instancetype)initWithState:(APState)state;

- (void)addTransitionFromState:(APState)fromState toState:(APState)toState withEvent:(APEvent)event;
- (void)handleEvent:(APEvent)event;

@end
