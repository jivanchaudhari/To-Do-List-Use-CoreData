//
//  ViewController.h
//  JCToDoListinCoreData
//
//  Created by Student P_05 on 10/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddViewController.h"
#import "CustomTableViewCell.h"


@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    UISegmentedControl *localSegment;
    NSMutableArray *tv;
    NSMutableArray *mobile;
    NSMutableArray *ac;
    
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)addButtonAction:(id)sender;
- (IBAction)segmentAction:(id)sender;

@end

