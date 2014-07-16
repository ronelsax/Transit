

#import <Foundation/Foundation.h>
#import "CardReader.h"
#import "CardService.h"

@implementation CardReader : NSObject

-initWithCardService:(CardService *)service {
    if (self = [super init]) {
        cardService = service;
    }
    return self;
}

-(BOOL)cardHasBalance:(Card *) card {
    double balance = [cardService getBalanceFor:card];
    return (balance != 0);
}

-(BOOL)card:(Card*)card hasSufficientBalanceForFare:(double) fare {
    double balance = [cardService getBalanceFor:card];
    if (balance < fare) {
        return NO;
    }
    return YES;
}

-(void)deductFare:(double)fare fromCard:(Card *)card {
    if (![self card:card hasSufficientBalanceForFare:fare]) {
        [NSException raise:@"InsufficientFare" format:@"Insufficient fare."];
    }
    [cardService deductFare:fare fromCard:card];
}

@end