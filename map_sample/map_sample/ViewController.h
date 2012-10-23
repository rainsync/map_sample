//
//  ViewController.h
//  map_sample
//
//  Created by 승원 김 on 12. 10. 24..
//  Copyright (c) 2012년 승원 김. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *mapView;
    UIToolbar *toolBar;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@end
