//
//  SelebrationsHomeViewController.h
//  Selebrations
//
//  Created by Pavan Ratnakar on 12/1/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "SelebrationsLib.h"
#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface SelebrationsHomeViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate,iCarouselDataSource, iCarouselDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet iCarousel *carousel;

@end
