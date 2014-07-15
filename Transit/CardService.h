#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardService : NSObject
-(double)getBalanceFor:(Card *) card;
@end
