//
//  ViewController.m
//  map_sample
//
//  Created by 승원 김 on 12. 10. 24..
//  Copyright (c) 2012년 승원 김. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView, toolBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // 툴바에 줌인, 지도 타입 변경 바버튼 아이템을 추가한다.
    UIBarButtonItem *zoomButton = [[UIBarButtonItem alloc] initWithTitle:@"Zoom" style:UIBarButtonItemStylePlain target:self action:@selector(zoomIn:)];
    
    UIBarButtonItem *zoomOutButton = [[UIBarButtonItem alloc] initWithTitle:@"ZoomOut" style:UIBarButtonItemStylePlain target:self action:@selector(zoomOut:)];
    
    UIBarButtonItem *typeButton = [[UIBarButtonItem alloc] initWithTitle:@"Type" style:UIBarButtonItemStylePlain target:self action:@selector(changeMapType:)];
    
    NSArray *buttons = [[NSArray alloc] initWithObjects:zoomButton, zoomOutButton, typeButton, nil];
    toolBar.items = buttons;
    
    
    // 사용자의 위치를 표시하도록 설정
    mapView.showsUserLocation = YES;
    
    
    
    // 마이크로소프트 사의 위치를 핀으로 등록하여 보여준다.
    CLLocationCoordinate2D annotationCoord;
    annotationCoord.latitude = 47.640071;
    annotationCoord.longitude = -122.129598;
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = @"Microsoft";
    annotationPoint.subtitle = @"Microsoft's headquarters";
    [mapView addAnnotation:annotationPoint];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)zoomIn:(id)sender
{
    MKUserLocation *userLocation = mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 5000, 5000);
    [mapView setRegion:region animated:NO];
    
    // 이 메서드는 mapView 오브젝트에 원하는 효과를 얻기 위하여 매우 간단한 작업을 수행한다. 먼저 맵 뷰 오브젝트의 userLocation 속성을 통해 사용자의 현재 위치를 알아본다. 이는 MKUserLocation 오브젝트 형태로 저장되어 있으며, 사용자의 현재 좌표 값을 가지고 있다. 다음으로 MKCoordinateRegionMakeWithDistance 함수를 호출하여 현재 사용자 위치의 좌표와 남과 북으로 50미터인 스팬(span)으로 구성된 MKCoordinateRegion 오브젝트를 생성한다. 마지막으로 이 오브젝트를 mapView 오브젝트의 setRegion 메서드를 통해 넘겨준다.
}

- (void)zoomOut:(id)sender
{
    MKUserLocation *userLocation = mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 50000, 50000);
    [mapView setRegion:region animated:NO];
}

- (void)changeMapType:(id)sender
{
    if (mapView.mapType == MKMapTypeStandard) {
        mapView.mapType = MKMapTypeSatellite;   // 위성 지도
    }
    else if (mapView.mapType == MKMapTypeSatellite){
        mapView.mapType = MKMapTypeHybrid;      // 일반 + 위성 지도
    }
    else {
        mapView.mapType = MKMapTypeStandard;    // 다시 일반지도
    }
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.mapView.centerCoordinate = userLocation.location.coordinate;
    
    // 사용자의 이동에 따라 맵이 자동으로 따라가도록 설정
}
@end
