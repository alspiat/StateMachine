//
//  StateMachineTests.m
//  StateMachineTests
//
//  Created by Aliaksei Piatyha on 8/9/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StateMachine.h"

@interface StateMachineTests : XCTestCase

@property (nonatomic, strong) StateMachine *stateMachine;

@end

@implementation StateMachineTests

- (void)setUp {
    [super setUp];
    
    self.stateMachine = [[StateMachine alloc] init];
    
    [self.stateMachine addTransitionFromState:STATE_1 toState:STATE_2 withEvent:EVENT_1];
    [self.stateMachine addTransitionFromState:STATE_2 toState:STATE_3 withEvent:EVENT_1];
    [self.stateMachine addTransitionFromState:STATE_3 toState:STATE_4 withEvent:EVENT_1];
    [self.stateMachine addTransitionFromState:STATE_4 toState:STATE_5 withEvent:EVENT_1];
    [self.stateMachine addTransitionFromState:STATE_5 toState:STATE_6 withEvent:EVENT_1];
    [self.stateMachine addTransitionFromState:STATE_6 toState:STATE_7 withEvent:EVENT_1];
    [self.stateMachine addTransitionFromState:STATE_7 toState:STATE_8 withEvent:EVENT_1];
    [self.stateMachine addTransitionFromState:STATE_8 toState:STATE_9 withEvent:EVENT_1];
    [self.stateMachine addTransitionFromState:STATE_9 toState:STATE_10 withEvent:EVENT_1];
    
    [self.stateMachine addTransitionFromState:STATE_2 toState:STATE_5 withEvent:EVENT_2];
    [self.stateMachine addTransitionFromState:STATE_6 toState:STATE_10 withEvent:EVENT_3];
    [self.stateMachine addTransitionFromState:STATE_7 toState:STATE_9 withEvent:EVENT_4];
}

- (void)tearDown {
    [super tearDown];
    self.stateMachine = nil;
}

// MARK: - Positive separate transitions testing

- (void)test_state1_handleEvent1_state2 {
    [self.stateMachine setCurrentState:STATE_1];
    [self.stateMachine handleEvent:EVENT_1];
    XCTAssertEqual(self.stateMachine.currentState, STATE_2);
}

- (void)test_state2_handleEvent2_state5 {
    [self.stateMachine setCurrentState:STATE_2];
    [self.stateMachine handleEvent:EVENT_2];
    XCTAssertEqual(self.stateMachine.currentState, STATE_5);
}

- (void)test_state6_handleEvent3_state10 {
    [self.stateMachine setCurrentState:STATE_6];
    [self.stateMachine handleEvent:EVENT_3];
    XCTAssertEqual(self.stateMachine.currentState, STATE_10);
}

- (void)test_state7_handleEvent4_state9 {
    [self.stateMachine setCurrentState:STATE_7];
    [self.stateMachine handleEvent:EVENT_4];
    XCTAssertEqual(self.stateMachine.currentState, STATE_9);
}

// MARK: - Negative separate transitions testing

- (void)test_sendEventToFiniteState_stateNotChanged {
    [self.stateMachine setCurrentState:STATE_10];
    [self.stateMachine handleEvent:EVENT_1];
    XCTAssertEqual(self.stateMachine.currentState, STATE_10);
}

- (void)test_sendEventToInappropriateState_stateNotChanged {
    [self.stateMachine setCurrentState:STATE_1];
    [self.stateMachine handleEvent:EVENT_3];
    XCTAssertEqual(self.stateMachine.currentState, STATE_1);
}

@end
