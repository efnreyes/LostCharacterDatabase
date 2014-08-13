//
//  MasterViewController.m
//  LostCharacterDatabase
//
//  Created by Efrén Reyes Torres on 8/12/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MasterViewController.h"
#import "Character.h"

#import "DetailViewController.h"

@interface MasterViewController ()
@property NSArray *characters;
@end

@implementation MasterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSSortDescriptor *sortCharacter = [[NSSortDescriptor alloc] initWithKey:@"passenger" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortCharacter];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Character"];
    request.sortDescriptors = sortDescriptors;
    self.characters  = [self.managedObjectContext executeFetchRequest:request error:nil];
    if (self.characters.count == 0) {
        [self loadDataFromPropertyList];
    }
    for (Character *c in self.characters) {
        NSLog(@"actor: %@, passenger: %@", c.actor, c.passenger);
    }
//    [self loadDataFromPropertyList];
}

- (void)loadDataFromPropertyList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lost" ofType:@"plist"];
    NSArray *items = [NSArray arrayWithContentsOfFile:path];

    for (NSDictionary *characterInfo in items) {
        Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.managedObjectContext];
        character.actor = characterInfo[@"actor"];
        character.passenger = characterInfo[@"passenger"];
        if ([self.managedObjectContext save:nil]) {
            NSLog(@"Object Saved");
        }
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characters.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    Character *character = [self.characters objectAtIndex:indexPath.row];
    cell.textLabel.text = character.passenger;
    cell.detailTextLabel.text = character.actor;
    return cell;
}

- (IBAction)unwindFromCharacterViewController:(UIStoryboardSegue *)segue {
    NSLog(@"Unwinded");
}

@end
