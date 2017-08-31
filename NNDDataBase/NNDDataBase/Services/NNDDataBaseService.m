
/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
 Author: Kian D.Rad
 Date:   August 3rd 2017
 ReadMe:
 */
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "NNDDataBaseService.h"

@interface NNDDataBaseService()

- (NSURL*)applicationDocumentsDirectory;

- (NSManagedObjectModel*)managedObjectModel ;

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator ;

- (NSManagedObjectContext*)managedObjectContext ;

- (void)saveContext ;


@end

@implementation NNDDataBaseService:NSObject

- (instancetype)init {
    self = [super init];
    if (self) {

        _businessRepository = [[NNDDataBaseBusinessRepository alloc] init];;
    }
    return self;
}


@end
