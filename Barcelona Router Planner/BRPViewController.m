//
//  BRPViewController.m
//  Barcelona Router Planner
//
//  Created by Joseph Boston on 04/10/2013.
//  Copyright (c) 2013 Jaboston. All rights reserved.
//

#import "BRPViewController.h"
#import "BRPBoardingCards.h"

@interface BRPViewController (){
    NSArray *boardingCardsArray;
}

@end

@implementation BRPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    BRPBoardingCards *boardingCards = [[BRPBoardingCards alloc] init];
    boardingCardsArray = [boardingCards getBoardingCards];
    
    NSLog(@"boarding cards array: %@", boardingCardsArray);
    
    

            
    self.view.backgroundColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.5];
             
    
    [self startAnimation];
    
    [_tableView reloadData];
    
    // just doing this so I can restart the animations.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(enteredForegroundNotification:)
                                                 name:@"EnteredForegroundNotification"
                                               object:nil];
    
}

- (void) enteredForegroundNotification:(NSNotification *) notification
{
    [self startAnimation];
}

- (void)startAnimation{
    [UIView animateWithDuration:3.0 delay:0.0 options:(UIViewAnimationOptionCurveEaseIn |
                                             UIViewAnimationOptionAutoreverse |
                                             UIViewAnimationOptionRepeat |
                                             UIViewAnimationOptionAllowUserInteraction) animations: ^{
        self.view.backgroundColor = [UIColor colorWithRed:0 green:255 blue:0 alpha:0.5];

        
    }  completion:^(BOOL finished) {

    }];
    
    CGRect theFrame = _button.frame;
    _button.frame = CGRectMake(_button.frame.origin.x, -1000, _button.frame.size.width, _button.frame.size.height);
    [UIView animateWithDuration:1.0
                          delay:0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _button.frame = theFrame;
                     }
                     completion:^(BOOL finished){
                     }];
    
    CGRect theFrame2 = _tableView.frame;
    _tableView.frame = CGRectMake(_tableView.frame.origin.x, 1000, _tableView.frame.size.width, _tableView.frame.size.height);
    [UIView animateWithDuration:1.0
                          delay:0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _tableView.frame = theFrame2;
                     }
                     completion:^(BOOL finished){
                     }];

}

- (void)viewDidAppear:(BOOL)animated{
    [self startAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findButtonPressed:(id)sender {
    //array for removing extra boarding cards
    NSMutableArray *removedBoardingCardsArray = [boardingCardsArray mutableCopy];
    //array for final route.
    NSMutableArray *routeArray = [[NSMutableArray alloc] init];
    //add an object to the array to start us. This may usually be something the user types in, but for examples case we will use object at index 0.
    //We know that object at index 0 starts at the airport.
    [routeArray addObject:[removedBoardingCardsArray objectAtIndex:0]];
    
    [_tableView reloadData];
    
    for(int i = 0; i < [removedBoardingCardsArray count]; i++){
        if([[[routeArray objectAtIndex:[routeArray count]-1] objectForKey:@"endLocation"]
                       isEqualToString:[[removedBoardingCardsArray objectAtIndex:i] objectForKey:@"startLocation"]]){
            [routeArray addObject:[removedBoardingCardsArray objectAtIndex:i]];
            i=0;
        }
    }
    
    
    NSLog(@"routeArray: %@", routeArray);
    boardingCardsArray = routeArray;
    
    [_tableView reloadData];
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // This won't go anywhere for this code exercise, but this at least gets rid of the highlight (which has no purpose right now!).
    
    [self.tableView deselectRowAtIndexPath:indexPath
                                  animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [boardingCardsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    cell = [_tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    NSDictionary *dict = [boardingCardsArray objectAtIndex:[indexPath row]];
    NSString *title = [dict objectForKey:@"startLocation"];
    title = [title stringByAppendingString:@" - "];
    title = [title stringByAppendingString:[dict objectForKey:@"endLocation"]];
    title = [title stringByAppendingString:@" ("];
    title = [title stringByAppendingString:[dict objectForKey:@"type"]];
    title = [title stringByAppendingString:@")"];
    
    NSString* details = @"";
    details = [details stringByAppendingString:[dict objectForKey:@"info"]];
    details = [details stringByAppendingString:@" - seatNo: "];
    details = [details stringByAppendingString:[dict objectForKey:@"seat"]];
    
    cell.textLabel.text = title;
    cell.detailTextLabel.text = details;
    return cell;
}


@end
