//
//  CategoriesTableViewCell.h
//  Selebrations
//
//  Created by Pavan Ratnakar on 11/30/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesTableViewCell : UITableViewCell {
    UIActivityIndicatorView *loader;
}

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;

- (void) stopLoaderAnimation;

@end
