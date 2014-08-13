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
@property BOOL toogle;
@end

@implementation MasterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    if (self.characters.count == 0) {
        [self loadDataFromPropertyList];
    }
}

- (void)loadData {
    NSSortDescriptor *sortCharacter = [[NSSortDescriptor alloc] initWithKey:@"passenger" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortCharacter];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Character"];
    request.sortDescriptors = sortDescriptors;
    //Filter the characters by gender
    if (self.toogle) {
        request.predicate = [NSPredicate predicateWithFormat:@"age > %d", 20];
    } else {
        request.predicate = [NSPredicate predicateWithFormat:@"age <= %d", 20];
    }
    self.characters  = [self.managedObjectContext executeFetchRequest:request error:nil];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationBottom];
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

- (IBAction)onFilterPressed:(id)sender {
    self.toogle = !self.toogle;
    [self loadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characters.count;
}

// Activates the swipe to delete functionality
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

}

// Changes the title of the delete button
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"SMOKE MONSTER";
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
