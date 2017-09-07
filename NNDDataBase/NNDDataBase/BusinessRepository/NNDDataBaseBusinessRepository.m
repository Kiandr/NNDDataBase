
/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
 Author: Kian D.Rad
 Date:   August 3rd 2017
 ReadMe:
 */

#import <UIKit/UIKit.h>
#include "NNDDataBaseBusinessRepository.h"
#include "Employee.h"
#include "NNDPatientDataModel.h"
#include "NNDDeviceUserDataModel.h"

@interface NNDDataBaseBusinessRepository()
@property (retain,nonatomic) NSMutableArray *
employeeCollection;


@end

@implementation NNDDataBaseBusinessRepository:NSObject

- (instancetype)init {
    self = [super init];
    if (self) {
        
        _managedObjectContext = [self managedObjectContext];
        _managedObjectModel = [self managedObjectModel];
        _persistentStoreCoordinator = [self persistentStoreCoordinator];


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

    NSURL *modelURL = [[NSBundle bundleForClass:[self class]] URLForResource:NSLocalizedString(@"NNDCheckInDataModel", nil) withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator {
    // Create the coordinator and
    //store

    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"NNDDataBase.sqlite"];

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


#pragma Test Database

- (void)AddPerson {

    NSObject* item = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:_managedObjectContext];
    //[item setValue:@"Kian" forKey:@"name"];

    [item setValue:@"6043581753" forKey:@"phone"];
    [item setValue:@"Kian" forKey:@"name"];

    [self saveContext];

}

-(void)fetch{
    NSFetchRequest *fetchRequest =
    [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    self.employeeCollection = [[[self managedObjectContext] executeFetchRequest:fetchRequest error:nil] mutableCopy];
    Employee *item = [_employeeCollection objectAtIndex:(unsigned long)self.employeeCollection.count-1];
    NSLog(@"count=%ld", (unsigned long)self.employeeCollection.count);
    NSLog(@"%@",item);
}


#pragma Manage Patient DataModel

- (NNDPatientDataModel*) PatiendModelDataInitWithUserId:(NNDDeviceUserDataModel*) deviceUserDataModel{

    NNDDeviceUserDataModel * t = [[NNDDeviceUserDataModel alloc]init];
    return nil;
}
- (NNDDeviceUserDataModel*) NNDDeviceUserDataModelWithGoogleGSuitTool:(NNDDeviceUserDataModel*) deviceUserDataModel{return nil;}

#pragma TestPatientData

// Test the code: Demo purpose:
/*
 Author: Kian D.Rad
 Date: Sept 6th 2017
 README: 
 1- Build a ptient 
 2- 
 

 */


-(void) addOnePatinetDataIntoTheUserFile{

    NSObject* item = [NSEntityDescription insertNewObjectForEntityForName:NSLocalizedString(@"NNDPatientDataModel", nil) inManagedObjectContext:_managedObjectContext];

    [item setValue:@"M." forKey:@"patientLastName"];
    [item setValue:@"Margaret" forKey:@"patientName"];

    [self saveContext];
}

-(void) addOneUserDataModelInDataBase{

    NSObject* item = [NSEntityDescription insertNewObjectForEntityForName:NSLocalizedString(@"NNDDeviceUserDataModel", nil) inManagedObjectContext:_managedObjectContext];

    [item setValue:@"M." forKey:@"patientLastName"];
    [item setValue:@"Margaret" forKey:@"patientName"];

    [self saveContext];

}


@end
