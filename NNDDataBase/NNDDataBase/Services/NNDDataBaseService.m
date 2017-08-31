
/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
 Author: Kian D.Rad
 Date:   August 3rd 2017
 ReadMe:
 */
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "NNDDataBaseService.h"

@interface NNDDataBaseService()

@property (strong , nonatomic) NNDDataBaseBusinessRepository *businessRepository;

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

        _businessRepository = [[NNDDataBaseBusinessRepository alloc] init];
    }
    return self;
}


- (NSURL*)applicationDocumentsDirectory{return [_businessRepository applicationDocumentsDirectory];}

- (NSManagedObjectModel*)managedObjectModel {return [_businessRepository managedObjectModel];}

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator {return [_businessRepository persistentStoreCoordinator];}

- (NSManagedObjectContext*)managedObjectContext {return [_businessRepository managedObjectContext];}

- (void)saveContext {return [_businessRepository saveContext];}

- (void)AddPerson{[_businessRepository AddPerson];}

- (void)fetch { [_businessRepository fetch];}

@end
