//
//  BRPViewController.h
//  Barcelona Router Planner
//
//  Created by Joseph Boston on 04/10/2013.
//  Copyright (c) 2013 Jaboston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BRPViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *button;


@end
