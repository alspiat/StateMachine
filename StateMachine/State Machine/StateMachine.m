//
//  StateMachine.m
//  StateMachine
//
//  Created by Aliaksei Piatyha on 8/9/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "StateMachine.h"

@interface StateMachine()

@property (nonatomic, strong) NSMutableDictionary *transitions;

@end

@implementation StateMachine

- (instancetype)init {
    self = [super init];
    if (self) {
        _transitions = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (instancetype)initWithState:(APState)state {
    self = [super init];
    if (self) {
        _transitions = [[NSMutableDictionary alloc] init];
        _currentState = state;
    }
    return self;
}

- (void)handleEvent:(APEvent)event {
    NSNumber *transitionState = self.transitions[@(event)][@(self.currentState)];

    if (transitionState != nil) {
        [self setCurrentState:transitionState.integerValue];
    }
}

- (void)addTransitionFromState:(APState)fromState toState:(APState)toState withEvent:(APEvent)event {
    if (self.transitions[@(event)]) {
        [self.transitions[@(event)] setObject:@(toState) forKey:@(fromState)];
    } else {
        self.transitions[@(event)] = [NSMutableDictionary dictionaryWithObject:@(toState) forKey:@(fromState)];
    }
}

@end
