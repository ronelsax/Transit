#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardService : NSObject
-(double)getBalanceFor:(Card *) card;
-(void)deductFare:(double)fare fromCard:(Card *)card;
@end
