//
//  StateMachineChainTests.m
//  StateMachineChainTests
//
//  Created by Aliaksei Piatyha on 8/10/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StateMachine.h"

@interface StateMachineChainTests : XCTestCase

@property (nonatomic, strong) StateMachine *stateMachine;

@end

@implementation StateMachineChainTests

- (void)setUp {
    [super setUp];
    
    self.stateMachine = [[StateMachine alloc] initWithState:STATE_1];
    
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

// MARK: - Positive finite chains testing

- (void)test_handleEventsFromFirstChain_reachFiniteState {
    for (int i = 0; i < 9; i++) {
        [self.stateMachine handleEvent:EVENT_1];
    }
    XCTAssertEqual(self.stateMachine.currentState, STATE_10);
}

- (void)test_handleEventsFromSecondChain_reachFiniteState {
    [self.stateMachine handleEvent:EVENT_1];
    [self.stateMachine handleEvent:EVENT_2];
    for (int i = 0; i < 5; i++) {
        [self.stateMachine handleEvent:EVENT_1];
    }
    XCTAssertEqual(self.stateMachine.currentState, STATE_10);
}

- (void)test_handleEventsFromThirdChain_reachFiniteState {
    for (int i = 0; i < 5; i++) {
        [self.stateMachine handleEvent:EVENT_1];
    }
    [self.stateMachine handleEvent:EVENT_3];
    XCTAssertEqual(self.stateMachine.currentState, STATE_10);
}

- (void)test_handleEventsFromFourthChain_reachFiniteState {
    for (int i = 0; i < 6; i++) {
        [self.stateMachine handleEvent:EVENT_1];
    }
    [self.stateMachine handleEvent:EVENT_4];
    [self.stateMachine handleEvent:EVENT_1];
    XCTAssertEqual(self.stateMachine.currentState, STATE_10);
}

- (void)test_handleEventsFromFifthChain_reachFiniteState {
    [self.stateMachine handleEvent:EVENT_1];
    [self.stateMachine handleEvent:EVENT_2];
    [self.stateMachine handleEvent:EVENT_1];
    [self.stateMachine handleEvent:EVENT_3];
    XCTAssertEqual(self.stateMachine.currentState, STATE_10);
}

- (void)test_handleEventsFromSixthChain_reachFiniteState {
    [self.stateMachine handleEvent:EVENT_1];
    [self.stateMachine handleEvent:EVENT_2];
    for (int i = 0; i < 2; i++) {
        [self.stateMachine handleEvent:EVENT_1];
    }
    [self.stateMachine handleEvent:EVENT_4];
    [self.stateMachine handleEvent:EVENT_1];
    XCTAssertEqual(self.stateMachine.currentState, STATE_10);
}

@end
