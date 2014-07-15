

#import <Foundation/Foundation.h>
#import "Card.h"
#import "CardService.h"

@interface CardReader : NSObject {
    CardService *cardService;
}

-initWithCardService:(CardService *)cardService;
-(BOOL)cardHasBalance:(Card *) card;
-(BOOL)card:(Card*) card hasSufficientBalanceForFare:(double) fare;

@end