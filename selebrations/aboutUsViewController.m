//
//  aboutUsViewController.m
//  selebrations
//
//  Created by Pavan Ratnakar on 12/2/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "aboutUsViewController.h"

@interface aboutUsViewController ()

@end

@implementation aboutUsViewController

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
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wild_oliva"]];
    self.view.backgroundColor = background;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
