//
//  AddViewController.m
//  JCToDoListinCoreData
//
//  Created by Student P_05 on 10/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "AddViewController.h"
#import "AppDelegate.h"


@interface AddViewController ()

@end

@implementation AddViewController

-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
    }
    return context;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if (textField == self.textOne) {
        
        [self.textTwo becomeFirstResponder];
        
    }
    else if (textField == self.textTwo) {
        [self.textThree  becomeFirstResponder];
    }
    return YES;
    
}


- (IBAction)segmentAction:(id)sender {
    
    localSegment = sender;
    
    int i;
    switch (localSegment.selectedSegmentIndex == i) {
        case 0:
            i=0;
            [self saveAction:sender];
            
           // [self.textThree setHidden:NO];
            break;
        case 1:
            i=1;
            [self saveAction:sender];
            
            //[self.textThree setHidden:NO];

            break;
            
        case 2:
            i=2;
            [self saveAction:sender];
            
           // [self.textThree setHidden:YES];

            break;
            
        default:
            break;
    }
    
}

- (IBAction)saveAction:(id)sender {
    

    NSString *textFirst = self.textOne.text;
    
    NSString *textSecond = self.textTwo.text;
    
    NSString *textThird = self.textThree.text;
    
    
    if (localSegment.selectedSegmentIndex == 0) {
  
        if (textFirst.length > 0) {
            if (textSecond.length > 0) {
                if (textThird.length > 0) {
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"TV" inManagedObjectContext:context];
                    
                    [newDevice setValue:textFirst forKey:@"modal"];
                    [newDevice setValue:textSecond forKey:@"price"];
                    [newDevice setValue:textThird forKey:@"year"];
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        
                        NSLog(@"Data Saved");
                        
                        [self.navigationController popViewControllerAnimated:YES];
                        
                    }
                    else {
                        NSLog(@"Unable To Save : %@",error.localizedDescription);
                    }
                    
                }
                
                else {
                    NSLog(@"Third text Not Saved");
                }
            }
            else {
                NSLog(@"Second Text Not Saved");
            }
            
            
        }
        else {
            NSLog(@"First Text Not Saved");
        }
    }

    
    else if (localSegment.selectedSegmentIndex == 1) {
      
        if (textFirst.length > 0) {
            if (textSecond.length > 0) {
                if (textThird.length > 0) {
                    
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Mobile" inManagedObjectContext:context];
                    
                   // [newDevice setValue:textFirst forKey:@"compnay"];
                    [newDevice setValue:textFirst forKey:@"compnay"];
                    
                    [newDevice setValue:textSecond forKey:@"name"];
                    [newDevice setValue:textThird forKey:@"price"];
                    
                    NSError *error;
                    
                    if ([context save:&error]) {
                        
                        NSLog(@"Data Saved");
                        
                        [self.navigationController popViewControllerAnimated:YES];
                        
                    }
                    else {
                        NSLog(@"Unable To Save : %@",error.localizedDescription);
                    }
                    
                }
                
                else {
                    NSLog(@"Third text Not Saved");
                }
            }
            else {
                NSLog(@"Second Text Not Saved");
            }
            
            
        }
        else {
            NSLog(@"First Text Not Saved");
        }
    }
    else if (localSegment.selectedSegmentIndex == 2) {
        
        
        
        if (textFirst.length > 0) {
            if (textSecond.length > 0) {
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"AC" inManagedObjectContext:context];
                    
                    [newDevice setValue:textFirst forKey:@"modal"];
                    [newDevice setValue:textSecond forKey:@"price"];
                
                    NSError *error;
                    
                    if ([context save:&error]) {
                        
                        NSLog(@"Data Saved");
                        
                        [self.navigationController popViewControllerAnimated:YES];
                        
                    }
                    else {
                        NSLog(@"Unable To Save : %@",error.localizedDescription);
                    }
                    
                }
            
            else {
                NSLog(@"Second Text Not Saved");
            }
            
            
        }
        else {
            NSLog(@"First Text Not Saved");
        }
    }

}

- (IBAction)cancelAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}
@end
