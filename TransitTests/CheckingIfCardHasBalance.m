
#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Card.h"
#import "CardReader.h"
#import <OCMock/OCMock.h>

@interface CheckingIfCardHasBalance : XCTestCase

@end

@implementation CheckingIfCardHasBalance

- (void)testReturnsTrueIfCardHasBalance {
    
    // Arrange
    id cardService = OCMClassMock([CardService class]);
    CardReader *cardReader = [[CardReader alloc]initWithCardService:cardService];
    Card *card = [[Card alloc]init];
    OCMStub([cardService getBalanceFor:card]).andReturn(1.0);

    //Act
    BOOL result = [cardReader cardHasBalance:card];
    
    //Assert
    XCTAssertTrue(result);
}

- (void)testReturnsFalseIfCardDoesNotHaveBalance {
    
    id cardService = OCMClassMock([CardService class]);
    CardReader *cardReader = [[CardReader alloc]init];
    Card *card = [[Card alloc]init];
    OCMStub([cardService getBalanceFor:card]).andReturn(0);
    
    BOOL result = [cardReader cardHasBalance:card];

    XCTAssertFalse(result);
}

@end
