#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "CardReader.h"
#import "Card.h"
#import <OCMock/OCMock.h>

@interface DeductingFareFromCard : XCTestCase

@end

@implementation DeductingFareFromCard

- (void)testExceptionIsThrownIfCardHasInsufficientFare {
    double fare = 1;
    double balance = .5;
    id cardService = OCMClassMock([CardService class]);
    CardReader *cardReader = [[CardReader alloc]initWithCardService:cardService];
    Card *card = [[Card alloc]init];
    OCMStub([cardService getBalanceFor:card]).andReturn(balance);
    
    XCTAssertThrowsSpecific([cardReader deductFare:fare fromCard:card], NSException);
}

- (void)testFareIsDeductedFromCard {
    double fare = 1;
    double balance = 2;
    id cardService = OCMClassMock([CardService class]);
    CardReader *cardReader = [[CardReader alloc]initWithCardService:cardService];
    Card *card = [[Card alloc]init];
    OCMStub([cardService getBalanceFor:card]).andReturn(balance);
    
    [cardReader deductFare:fare fromCard:card];
    
    OCMVerify([cardService deductFare:fare fromCard:card]);
}

@end
