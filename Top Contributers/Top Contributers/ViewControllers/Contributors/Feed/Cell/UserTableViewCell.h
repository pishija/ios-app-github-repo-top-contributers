//
//  FoodTableViewCell.h
//  CaloriesPreview
//
//  Created by Mihail Stevcev on 3/31/16.
//  Copyright © 2016 Mihail Stevcev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell

- (void)setTitle:(NSString *)title;
- (void)setImageFromURL:(NSURL *)url;
- (void)setInitials:(NSString *)initials;
- (void)setDetailsText:(NSString *)text;

@end
