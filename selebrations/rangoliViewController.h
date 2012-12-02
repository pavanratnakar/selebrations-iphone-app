//
//  rangoliViewController.h
//  selebrations
//
//  Created by Pavan Ratnakar on 11/30/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rangoliViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) NSString *id;
@property (weak, nonatomic) IBOutlet UILabel *stockDetails;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UITextView *description;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;

@end