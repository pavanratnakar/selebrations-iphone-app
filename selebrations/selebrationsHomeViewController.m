//
//  selebrationsHomeViewController.m
//  selebrations
//
//  Created by Pavan Ratnakar on 12/1/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "selebrationsHomeViewController.h"

@interface selebrationsHomeViewController ()

@end

@implementation selebrationsHomeViewController

@synthesize searchBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)shouldAutorotate {
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (orientation==UIInterfaceOrientationPortrait) {
    }
    return YES;
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
