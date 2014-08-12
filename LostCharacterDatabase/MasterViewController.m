//
//  MasterViewController.m
//  LostCharacterDatabase
//
//  Created by Efrén Reyes Torres on 8/12/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadDataFromPropertyList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lost" ofType:@"plist"];
    NSArray *items = [NSArray arrayWithContentsOfFile:path];

    NSManagedObjectContext *ctx = self.managedObjectContext;

    for (NSDictionary *dict in items) {
        NSManagedObject *m = [NSEntityDescription insertNewObjectForEntityForName:@"TheNameOfYourEntity" inManagedObjectContext:ctx];
        [m setValuesForKeysWithDictionary:dict];
    }

    NSError *err = nil;
    [ctx save:&err];

    if (err != nil) {
        NSLog(@"error saving managed object context: %@", err);
    }
}

@end
