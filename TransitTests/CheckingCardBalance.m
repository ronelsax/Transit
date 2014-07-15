#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "CardReader.h"
#import "Card.h"
#import <OCMock/OCMock.h>

@interface CheckingCardBalance : XCTestCase

@end

@implementation CheckingCardBalance

- (void)testReturnsFalseWhenFareIsGreaterThanBalance {

    double fare = 1;
    double balance = .5;
    id cardService = OCMClassMock([CardService class]);
    CardReader *cardReader = [[CardReader alloc]initWithCardService:cardService];
    Card *card = [[Card alloc]init];
    OCMStub([cardService getBalanceFor:card]).andReturn(balance);
    
    double result = [cardReader card:card hasSufficientBalanceForFare: fare];
    
    XCTAssertFalse(result);
}

- (void)testReturnsTrueWhenFareIsEqualToBalance {
    
    double fare = 1;
    double balance = 1;
    id cardService = OCMClassMock([CardService class]);
    CardReader *cardReader = [[CardReader alloc]initWithCardService:cardService];
    Card *card = [[Card alloc]init];
    OCMStub([cardService getBalanceFor:card]).andReturn(balance);
    
    double result = [cardReader card:card hasSufficientBalanceForFare: fare];
    
    XCTAssertTrue(result);
}

- (void)testReturnsTrueWhenBalanceIsGreaterThanFare {
    
    double fare = 1;
    double balance = 2;
    id cardService = OCMClassMock([CardService class]);
    CardReader *cardReader = [[CardReader alloc]initWithCardService:cardService];
    Card *card = [[Card alloc]init];
    OCMStub([cardService getBalanceFor:card]).andReturn(balance);
    
    double result = [cardReader card:card hasSufficientBalanceForFare: fare];
    
    XCTAssertTrue(result);
}

@end
