//
//  CustomTableViewCell.m
//  LostCharacterDatabase
//
//  Created by Efrén Reyes Torres on 8/13/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize passenger, actor, age, nationality, gender;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
