//
//  CharacterViewController.m
//  LostCharacterDatabase
//
//  Created by Efrén Reyes Torres on 8/12/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import "CharacterViewController.h"

@interface CharacterViewController ()
@property (strong, nonatomic) IBOutlet UITextField *passengerTextField;
@property (strong, nonatomic) IBOutlet UITextField *actorTextField;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"unwindSegue"]) {

        NSLog(@"Unwinding from new character");
    }
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
