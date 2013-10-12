//
//  BRPBoardingCards.h
//  Barcelona Router Planner
//
//  Created by Joseph Boston on 04/10/2013.
//  Copyright (c) 2013 Jaboston. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRPBoardingCards : NSObject

- (NSArray*)getBoardingCards;
- (NSArray*)getBoardingCardsByType:(NSString*)cardType;

// As the boarding cards are pre-defined we do not need setters right now. However here is the
// definition to what the setters may be.

- (void)setNewBoardingCardWithCardType:(NSString*)cardType WithPrice:(NSString*)price AndStartLocation:(NSString*)startLocation  AndEndLocation:(NSString*)endLocation WithSeat:(NSString*)seatCode andExtraInformation:(NSString*)extraInfo;



@end
