
/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
    Author: Kian D.Rad
    Date:   August 3rd 2017
    ReadMe:
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NNDDataBaseBusinessRepository : NSObject

@property (strong, nonatomic) NSManagedObjectContext       *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel         *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

@end
