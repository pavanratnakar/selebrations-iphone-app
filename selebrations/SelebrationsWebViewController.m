//
//  SelebrationsWebViewController.m
//  Selebrations
//
//  Created by Pavan Ratnakar on 12/1/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "SelebrationsWebViewController.h"

@interface SelebrationsWebViewController ()

@end

@implementation SelebrationsWebViewController

@synthesize webView;

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

@end
