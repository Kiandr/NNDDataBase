
/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
 Author: Kian D.Rad
 Date:   August 3rd 2017
 ReadMe:
 */

#import <UIKit/UIKit.h>
#include "NNDDataBaseBusinessRepository.h"

@interface NNDDataBaseBusinessRepository()

- (NSURL*)applicationDocumentsDirectory;

- (NSManagedObjectModel*)managedObjectModel ;

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator ;

- (NSManagedObjectContext*)managedObjectContext ;

- (void)saveContext ;

@end

@implementation NNDDataBaseBusinessRepository:NSObject

- (instancetype)init {
    self = [super init];
    if (self) {


    }
    return self;
}


#pragma mark - Core Data stack
/*
 Author: Kian D.Rad
 Date: August 26th 2017
 README: Building the core data STACK, in app delegate.


 */

#pragma mark -Core Data stack

@synthesize managedObjectContext =          _managedObjectContext;
@synthesize managedObjectModel =            _managedObjectModel;
@synthesize persistentStoreCoordinator =    _persistentStoreCoordinator;

- (NSURL*)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel*)managedObjectModel {

    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataHelloWorld" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator {
    // Create the coordinator and
    //store

    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataHelloWorld.sqlite"];

    NSError *error = nil;

    NSString *failureReason = @"There was an error creating or loading the application's saved data.";

    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any
        //error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this
        //with code to handle the error appropriately.
        // abort()
        //causes the application to generate a crash log and terminate. You should not
        //use this function in a shipping application, although it may be useful during
        //development.
        NSLog(@"Unresolveerror %@, %@", error, [error userInfo]);
        abort();
    }

    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext*)managedObjectContext {
    // Returns the managed object
    //context for the application (which is already bound to the persistent store
    //                           coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = _managedObjectContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}


@end
