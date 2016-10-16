//
//  AddViewController.h
//  JCToDoListinCoreData
//
//  Created by Student P_05 on 10/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController<UITextFieldDelegate>

{
    UISegmentedControl *localSegment;
    
}
@property (strong, nonatomic) IBOutlet UITextField *textOne;
@property (strong, nonatomic) IBOutlet UITextField *textTwo;
@property (strong, nonatomic) IBOutlet UITextField *textThree;

- (IBAction)segmentAction:(id)sender;


- (IBAction)saveAction:(id)sender;

- (IBAction)cancelAction:(id)sender;

@end
