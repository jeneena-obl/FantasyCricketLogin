//
//  FC_LiveScoreViewController.h
//  FantasyCricketLogin
//
//  Created by Pushparaj Zala on 2/18/14.
//  Copyright (c) 2014 Pushparaj Zala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FC_LiveScoreViewController : UITableViewController

@property (nonatomic,strong) NSData *scoreData;
@property (nonatomic,strong) NSDictionary *liveScore;

@end
