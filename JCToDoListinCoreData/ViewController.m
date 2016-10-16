//
//  ViewController.m
//  JCToDoListinCoreData
//
//  Created by Student P_05 on 10/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    // Do any additional setup after loading the view, typically from a nib.
//    tv = [[NSMutableArray alloc]init];
//    mobile= [[NSMutableArray alloc]init];
//    ac = [[NSMutableArray alloc]init];
//    
//    [self.myTableView reloadData];
//    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated {
    [self fetchDeviceFromCoreData];
}

-(void)fetchDeviceFromCoreData {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (localSegment.selectedSegmentIndex == 0) {
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"TV"];
        
        NSError *error;
        
        tv = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
            
        }
        else {
            [self.myTableView reloadData];
        }
    
    }
    else  if (localSegment.selectedSegmentIndex == 1) {
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Mobile"];
        
        NSError *error;
        
        mobile = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
            
        }
        else {
            [self.myTableView reloadData];
        }
        
    }
    else  if (localSegment.selectedSegmentIndex == 2) {
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"AC"];
        
        NSError *error;
        
        ac = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
            
        }
        else {
            [self.myTableView reloadData];
        }
        
    }

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (localSegment.selectedSegmentIndex == 0) {
        
        return tv.count;
    }
    else if (localSegment.selectedSegmentIndex == 1) {
        return mobile.count;
        
    }
    else if (localSegment.selectedSegmentIndex == 2) {
        return  ac.count;
        
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"device_cell"];
    
    if (localSegment.selectedSegmentIndex == 0) {
        
        NSManagedObject *device = [tv objectAtIndex:indexPath.row];
        
        cell.labelOne.text = [device valueForKey:@"modal"];
        cell.labelTwo.text = [device valueForKey:@"price"];
        cell.labelThree.text = [device valueForKey:@"year"];
        
    }
    else if (localSegment.selectedSegmentIndex == 1) {
        
        NSManagedObject *device = [mobile objectAtIndex:indexPath.row];
        
        cell.labelOne.text = [device valueForKey:@"compnay"];
        cell.labelTwo.text = [device valueForKey:@"name"];
        cell.labelThree.text = [device valueForKey:@"price"];
        
    }
    else if (localSegment.selectedSegmentIndex == 2) {
        
        NSManagedObject *device = [ac objectAtIndex:indexPath.row];
        
        cell.labelOne.text = [device valueForKey:@"modal"];
        cell.labelTwo.text = [device valueForKey:@"price"];
        
    }
        return  cell;
    
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
    
}
-(void)deleteEntry : (NSIndexPath *)indexPath {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    [context deleteObject:[tv objectAtIndex:indexPath.row]];
    
    NSError *error;
    
    if ([context save:&error]) {
        
        NSLog(@"Deleted");
        [self fetchDeviceFromCoreData];
        
    }
    else {
        //
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self deleteEntry:indexPath];
        
    }
    else {
        NSLog(@"Can not Deleted Entry");
        
    }
}
- (IBAction)addButtonAction:(id)sender {
    
    AddViewController *addView = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
    
    [self.navigationController pushViewController:addView animated:YES];
    
}

- (IBAction)segmentAction:(id)sender {
    localSegment = sender;
    
    NSInteger i;
    switch (localSegment.selectedSegmentIndex == i) {
        case 0:
            i=0;
            [self.myTableView reloadData];
            
            break;
        case 1:
            i=1;
            [self.myTableView reloadData];
            break;
        case 2:
            i=2;
            [self.myTableView reloadData];
            break;
        default:
            break;
    }
}
@end
