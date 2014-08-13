//
//  CharacterViewController.m
//  LostCharacterDatabase
//
//  Created by Efrén Reyes Torres on 8/12/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import "CharacterViewController.h"
#import "Character.h"

@interface CharacterViewController ()
@property (strong, nonatomic) IBOutlet UITextField *passengerTextField;
@property (strong, nonatomic) IBOutlet UITextField *actorTextField;
@property NSMutableDictionary *characterDict;

#define allTrim( object ) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]

@end

@implementation CharacterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"unwindSegue"]) {
        NSLog(@"Unwinding from new character");
        if (!([allTrim(self.passengerTextField.text) length] == 0 || [allTrim(self.actorTextField.text) length] == 0)) {
            self.characterDict = [NSMutableDictionary new];
            [self.characterDict setObject:self.actorTextField.text forKey:@"actor"];
            [self.characterDict setObject:self.passengerTextField.text forKey:@"passenger"];
            return YES;
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"All the fields are required"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    return NO;
}

- (NSMutableDictionary *)characterData {
    return self.characterDict;
}

@end
