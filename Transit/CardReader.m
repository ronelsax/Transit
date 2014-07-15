

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
    if (balance == 0) {
        return NO;
    }
    return YES;
}

-(BOOL)card:(Card*) card hasSufficientBalanceForFare:(double) fare {
    double balance = [cardService getBalanceFor:card];
    if (balance < fare) {
        return NO;
    }
    return YES;
}

@end