//
//  MasterViewController.m
//  LostCharacterDatabase
//
//  Created by Efrén Reyes Torres on 8/12/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MasterViewController.h"
#import "CharacterViewController.h"
#import "CustomTableViewCell.h"
#import "Character.h"

#import "DetailViewController.h"

@interface MasterViewController ()
@property (strong, nonatomic) NSArray *characters;
@property (retain) IBOutlet UITableView *tableView;
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
        NSLog(@"Character: %@", c);
    }
}

- (void)loadDataFromPropertyList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lost" ofType:@"plist"];
    NSArray *items = [NSArray arrayWithContentsOfFile:path];

    for (NSDictionary *characterInfo in items) {
        Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.managedObjectContext];
        character.actor = characterInfo[@"actor"];
        character.passenger = characterInfo[@"passenger"];
        character.age = characterInfo[@"age"];
        character.nationality = characterInfo[@"nationality"];
        character.gender = characterInfo[@"gender"];
        if ([self.managedObjectContext save:nil]) {
            NSLog(@"Object Saved");
        }
    }
    [self.tableView reloadData];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characters.count;
}

-(CustomTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    Character *character = [self.characters objectAtIndex:indexPath.row];
    cell.passenger.text = character.passenger;
    cell.actor.text = character.actor;
    cell.age.text = [NSString stringWithFormat:@"%@", character.age];
    cell.nationality.text = character.nationality;
    cell.gender.text = character.gender;

    return cell;
}

- (IBAction)unwindFromCharacterViewController:(UIStoryboardSegue *)segue {
    NSLog(@"Unwinded");
    CharacterViewController *cvc = segue.sourceViewController;
    NSDictionary *characterData = [cvc characterData];
    Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.managedObjectContext];
    character.actor = characterData[@"actor"];
    character.passenger = characterData[@"passenger"];
    if ([self.managedObjectContext save:nil]) {
        NSLog(@"Object Saved");
//        [self.characters addObject:character];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.characters.count-1 inSection:0];
//        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
