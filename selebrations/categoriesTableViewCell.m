//
//  categoriesTableViewCell.m
//  selebrations
//
//  Created by Pavan Ratnakar on 11/30/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "categoriesTableViewCell.h"

@implementation categoriesTableViewCell

@synthesize thumbnail,label;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [loader startAnimating];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void) stopLoaderAnimation {
    [loader stopAnimating];
}

@end
