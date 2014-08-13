//
//  CustomTableViewCell.h
//  LostCharacterDatabase
//
//  Created by Efrén Reyes Torres on 8/13/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *passenger;
@property (strong, nonatomic) IBOutlet UILabel *actor;
@property (strong, nonatomic) IBOutlet UILabel *age;
@property (strong, nonatomic) IBOutlet UILabel *nationality;
@property (strong, nonatomic) IBOutlet UILabel *gender;

@end
