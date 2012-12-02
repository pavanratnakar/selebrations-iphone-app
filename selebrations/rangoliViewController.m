//
//  rangoliViewController.m
//  selebrations
//
//  Created by Pavan Ratnakar on 11/30/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "rangoliViewController.h"
#import "selebrationsWebViewController.h"

@interface rangoliViewController ()

@end

@implementation rangoliViewController

@synthesize label,imageView,id,stockDetails,price,description,buyButton;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch view] == imageView) {
        NSLog(@"TEST");
    }
}
    
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
    [self initStyling];
}

- (void) initStyling
{
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"xv"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"web"]) {
        selebrationsWebViewController *web = [segue destinationViewController];
        if (web.view) {
            [web.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat: @"http://selebrations.pavanratnakar.com/shop/%@/",id]]]];
        }
        
    }
}

@end
