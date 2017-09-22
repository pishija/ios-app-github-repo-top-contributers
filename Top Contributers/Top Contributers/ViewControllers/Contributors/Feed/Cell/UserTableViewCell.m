//
//  FoodTableViewCell.m
//  CaloriesPreview
//
//  Created by Mihail Stevcev on 3/31/16.
//  Copyright © 2016 Mihail Stevcev. All rights reserved.
//

#import "UserTableViewCell.h"

@interface UserTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *initialsLabel;


@end

@implementation UserTableViewCell

#pragma mark - Overrides

- (void)prepareForReuse
{
    self.initialsLabel.text = @"";
}

#pragma mark - Public methods

- (void)setTitle:(NSString *)title;{
    self.titleLabel.text = title;
}


- (void)setImageFromURL:(NSURL *)url{
}

- (void)setInitials:(NSString *)initials{
    if(initials.length <= 2){
        self.initialsLabel.text = initials;
    }
}

@end
