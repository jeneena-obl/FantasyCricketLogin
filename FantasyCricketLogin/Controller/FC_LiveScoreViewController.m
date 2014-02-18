//
//  FC_LiveScoreViewController.m
//  FantasyCricketLogin
//
//  Created by Pushparaj Zala on 2/18/14.
//  Copyright (c) 2014 Pushparaj Zala. All rights reserved.
//

#import "FC_LiveScoreViewController.h"

@interface FC_LiveScoreViewController ()

@end

@implementation FC_LiveScoreViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSDictionary *)liveScore
{
    if (!_liveScore) {
        _liveScore = [[NSDictionary alloc] init];
    }
    return _liveScore;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSArray *arr = [[NSArray alloc] initWithObjects:@"ind vs nz - ind 550/6", @"aus vs sa - aus 333/7", nil];
    NSDictionary *dis = [NSDictionary dictionaryWithObjectsAndKeys:
                         arr, @"liveScore",
                         nil
                         ];
    NSError *error,*readError;
    if ([NSJSONSerialization isValidJSONObject:dis])
    {
        self.scoreData = [NSJSONSerialization dataWithJSONObject:dis options:NSJSONWritingPrettyPrinted error:&error];
        self.liveScore = [NSJSONSerialization JSONObjectWithData:self.scoreData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&readError];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.

    /*
    NSArray *arr = [[NSArray alloc] initWithObjects:@"ind vs nz - ind 550/6", @"aus vs sa - aus 333/7", nil];
    NSDictionary *dis = [NSDictionary dictionaryWithObjectsAndKeys:
                            arr, @"liveScore",
                            nil
                            ];
     */
    NSArray *results = [self.liveScore objectForKey:@"liveScore"];
    NSLog(@"1 %@",[results firstObject]);
    NSLog(@"2 %@",[results lastObject]);
    NSLog(@" %d",[results count]);

    return [results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Live Score Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    /*
    NSArray *arr = [[NSArray alloc] initWithObjects:@"ind vs nz - ind 550/6", @"aus vs sa - aus 333/7", nil];
    NSDictionary *dis = [NSDictionary dictionaryWithObjectsAndKeys:
                         arr, @"liveScore",
                         nil
                         ];
    */
    NSArray *results = [self.liveScore objectForKey:@"liveScore"];

    cell.textLabel.text = [NSString stringWithFormat:@"%@",results[indexPath.row]];

    
    return cell;
}

@end
