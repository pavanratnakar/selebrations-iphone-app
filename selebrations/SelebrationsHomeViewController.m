//
//  SelebrationsHomeViewController.m
//  Selebrations
//
//  Created by Pavan Ratnakar on 12/1/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "SelebrationsHomeViewController.h"
#import "AFJSONRequestOperation.h"
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/CALayer.h>
#import "FXImageView.h"

@interface SelebrationsHomeViewController ()

@property (nonatomic, retain) NSMutableArray *rangolis;

@end

@implementation SelebrationsHomeViewController

@synthesize carousel;
@synthesize rangolis;
@synthesize searchBar;

- (void)awakeFromNib
{
    [self getRangolis];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        // Portrait frames
        //self.view.frame = CGRectMake(0,0,400,900);
    } else {
        // Landscape frames
        //self.view.frame = CGRectMake(0,0,400,700);
    }
}

- (void)getRangolis {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://selebrations.pavanratnakar.com/controller/rangoliController.php?type=rangolis"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        rangolis = [JSON valueForKeyPath:@"response"];
        [self.carousel reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        NSLog(@"Selebrations Rangolis: %@,%@,%@", response,error,JSON);
    }];
    [operation start];
}

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [rangolis count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    if (view == nil) {
        FXImageView *imageView = [[[FXImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)] autorelease];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.asynchronous = YES;
        imageView.reflectionScale = 0.5f;
        imageView.reflectionAlpha = 0.25f;
        imageView.reflectionGap = 10.0f;
        imageView.shadowOffset = CGSizeMake(0.0f, 2.0f);
        imageView.shadowBlur = 5.0f;
        view = imageView;
        
        /*label = [[[UILabel alloc] initWithFrame:view.bounds] autorelease];
        [label setBackgroundColor:[SelebrationsLib getRandomColor]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[UIColor whiteColor]];
        [label setNumberOfLines:3];
        [label.font fontWithSize:10];
        view.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:label];*/
    } else {
        label = (UILabel *)[view viewWithTag:1];
    }
    NSMutableDictionary *rangoliDetails = [rangolis objectAtIndex:index];
    [(FXImageView *)view setImageWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@-80x80.jpg",[rangoliDetails objectForKey:@"guid"]]]];
    //label.text =[NSString stringWithFormat:@"%@",[rangoliDetails objectForKey:@"title"]];
    return view;
}

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
    carousel.type = iCarouselTypeCoverFlow;
    carousel.backgroundColor = [UIColor clearColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    //free up memory by releasing subviews
    self.carousel = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    carousel.delegate = nil;
    carousel.dataSource = nil;
}

@end
