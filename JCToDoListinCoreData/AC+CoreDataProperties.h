//
//  AC+CoreDataProperties.h
//  JCToDoListinCoreData
//
//  Created by Student P_04 on 12/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AC.h"

NS_ASSUME_NONNULL_BEGIN

@interface AC (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *modal;
@property (nullable, nonatomic, retain) NSString *price;

@end

NS_ASSUME_NONNULL_END
