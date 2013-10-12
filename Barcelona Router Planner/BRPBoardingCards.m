//
//  BRPBoardingCards.m
//  Barcelona Router Planner
//
//  Created by Joseph Boston on 04/10/2013.
//  Copyright (c) 2013 Jaboston. All rights reserved.
//

#import "BRPBoardingCards.h"
#import "Utils.h"

@implementation BRPBoardingCards


- (NSArray*)getBoardingCards
{
    NSMutableArray *storedArray = [[NSMutableArray alloc] init];
    Utils *utils = [[Utils alloc] init];
    NSUserDefaults *properties = [utils getUserDefaults];
    

    
    // check if its the first time we are running the app.
    if(![[properties objectForKey:@"first_run"] isEqualToString:@"no"]){
        //I decided it is for american tourists and every booking office allows payment in dollars because I dont have a euros key on my keyboard.
        //Car also has lots of seats. 1337 of them to be precise.
        [self setNewBoardingCardWithCardType:@"car" WithPrice:@"$1.50" AndStartLocation:@"airport" AndEndLocation:@"restaurant" WithSeat:@"3" andExtraInformation:@"Sitting on the back seat."];
        [self setNewBoardingCardWithCardType:@"helicopter" WithPrice:@"$500" AndStartLocation:@"restaurant" AndEndLocation:@"hospital" WithSeat:@"1" andExtraInformation:@"You are driving. Goodluck."];
        [self setNewBoardingCardWithCardType:@"train" WithPrice:@"$100" AndStartLocation:@"restaurant" AndEndLocation:@"ditch" WithSeat:@"STANDONHEAD" andExtraInformation:@"No Seats on this train. Gotta stand on your head. "];
        [self setNewBoardingCardWithCardType:@"Fire Engine" WithPrice:@"$10" AndStartLocation:@"restaurant" AndEndLocation:@"burning house" WithSeat:@"HOSE" andExtraInformation:@"Take the hose to put out this fire we are heading to. "];
        [self setNewBoardingCardWithCardType:@"Nimbus" WithPrice:@"$300" AndStartLocation:@"burning house" AndEndLocation:@"popo floating island" WithSeat:@"LEVITATION" andExtraInformation:@"Dont forget your flying nimbus. "];
        [self setNewBoardingCardWithCardType:@"Sky Dive" WithPrice:@"$1020" AndStartLocation:@"popo floating island" AndEndLocation:@"home" WithSeat:@"GRAVITY" andExtraInformation:@"Ohh! that Adrenalines pumping. "];
        
        [self setNewBoardingCardWithCardType:@"Legs" WithPrice:@"$50" AndStartLocation:@"ditch" AndEndLocation:@"park bench hotel" WithSeat:@"VODKA" andExtraInformation:@"Time to get a good nights rest and sobre up. "];
        [self setNewBoardingCardWithCardType:@"Bicycle" WithPrice:@"$5" AndStartLocation:@"park bench hotel" AndEndLocation:@"home" WithSeat:@"BIKESEAT1" andExtraInformation:@"What a terrible hangover. Time to head home. "];

        [self setNewBoardingCardWithCardType:@"ambulance" WithPrice:@"$40" AndStartLocation:@"hospital" AndEndLocation:@"home" WithSeat:@"WHEELCHAIR" andExtraInformation:@"Well that was a bad idea! "];
        
        [properties setObject:@"no" forKey:@"first_run"];
        [properties synchronize];
        
        NSLog(@"did set first run to no");
    }

    if([[properties objectForKey:@"cards"] mutableCopy] != nil){
        storedArray = [[properties objectForKey:@"cards"] mutableCopy];
    }
    
    
        NSLog(@"getBoardingCards storedArray: %@", storedArray);
    
    return storedArray;
}

- (NSArray*)getBoardingCardsByType:(NSString*)cardType
{
    // at this point i would create a for loop and iterate through the array checking if (type isEqualToString:cardType).
    // But this is just an idea for later. To go by only a certain type of route. 
    return nil;
}



- (void)setNewBoardingCardWithCardType:(NSString*)cardType WithPrice:(NSString*)price AndStartLocation:(NSString*)startLocation  AndEndLocation:(NSString*)endLocation WithSeat:(NSString*)seatCode andExtraInformation:(NSString*)extraInfo{
    
    // populate the dictionary with data.
    NSMutableDictionary *card = [[NSMutableDictionary alloc] init];
    [card setObject:cardType forKey:@"type"];
    [card setObject:price forKey:@"price"];
    [card setObject:startLocation forKey:@"startLocation"];
    [card setObject:endLocation forKey:@"endLocation"];
    [card setObject:seatCode forKey:@"seat"];
    [card setObject:extraInfo forKey:@"info"];
    
    // get our stored array.
    Utils *utils = [[Utils alloc] init];
    NSUserDefaults *properties = [utils getUserDefaults];
    NSMutableArray *storedArray = [[NSMutableArray alloc] init];
    if([[properties objectForKey:@"cards"] mutableCopy] != nil){
       storedArray = [[properties objectForKey:@"cards"] mutableCopy];
    }

    [storedArray addObject:card];
    // set the stored array.
    [properties setObject:storedArray forKey:@"cards"];
    [properties synchronize];
    
}


@end
