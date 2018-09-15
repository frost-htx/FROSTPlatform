//
//  TTMGLMapView.m
//  FROSTPlatform
//
//  Created by frost on 2018/8/27.
//  Copyright © 2018年 frost. All rights reserved.
//

#define TT_MAPBOX_STYLEURL  @"http://127.0.0.1:8102/style/"

#import "TTMGLMapView.h"
#import "MBMapObject.h"
//#import "NSDictionary+Helper.h"

@implementation TTMGLMapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame styleURL:[NSURL URLWithString:TT_MAPBOX_STYLEURL]];
    if (self)
    {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //设置地图默认显示的地点和缩放等级
        [self setCenterCoordinate:CLLocationCoordinate2DMake(23.14278,113.31544) zoomLevel:18 animated:YES];
        //显示用户位置
        self.showsUserLocation  = NO;
        //定位模式
        self.userTrackingMode   = MGLUserTrackingModeNone;
        //是否倾斜地图
        self.pitchEnabled       = YES;
        //是否旋转地图
        self.rotateEnabled      = YES;
        
        self.showsUserHeadingIndicator = NO;
        
        // 设置Mapbox最小，大缩放级别
        self.minimumZoomLevel = 1;
        self.maximumZoomLevel = 18;
        
        // Mapview onTap需要手动注册时间 MGLPointFeature
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleMapviewOnTap:)];
        [self addGestureRecognizer:singleTap];
    }
    
    return self;
}

#pragma mark Private

- (void)handleMapviewOnTap:(UITapGestureRecognizer *)tap {
    CGPoint tapPoint = [tap locationInView:self];
    id<MGLFeature> mglFeature = [self visibleFeaturesAtPoint:tapPoint].lastObject;
    
    NSLog(@"---------------------: %@", mglFeature);
    
    if (!mglFeature)
        return;
    
//    if (self.mbMapboxDelegate && [self.mbMapboxDelegate respondsToSelector:@selector(onTapMBMapView:)]) {
//
//        MBMapObject *mapObject = [self getMBMapObject:mglFeature];
//
//        // MGLPointFeature MGLPointCollectionFeature
//        if ([mglFeature isKindOfClass:[MGLPointFeature class]] ||
//            [mglFeature isKindOfClass:[MGLPointCollectionFeature class]] ) {
//            mapObject.feature_type = MBPoint;
//        }
//        else if ([mglFeature isKindOfClass:[MGLPolylineFeature class]] ||
//                 [mglFeature isKindOfClass:[MGLMultiPolylineFeature class]] ) {
//            mapObject.feature_type = MBLine;
//        }
//        else if ([mglFeature isKindOfClass:[MGLPolygonFeature class]] ||
//                 [mglFeature isKindOfClass:[MGLMultiPolygonFeature class]] ) {
//            mapObject.feature_type = MBArea;
//        }
//        else
//        {
//            mapObject.feature_type = MBUnknow;
//        }
//
//        // FIXME
//        // MGLShapeCollectionFeature??
//
////        [self.mbMapboxDelegate onTapMBMapView:mapObject];
//    }
}

//- (MBMapObject *)getMBMapObject:(id<MGLFeature>) mglFeature
//{
//    MBMapObject *mapObject = [[MBMapObject alloc] init];
//    mapObject.feature_points = mglFeature.coordinate;
//    mapObject.name = [mglFeature.attributes getStringValueForKey:@"name"];
//    mapObject.name_cn = [mglFeature.attributes getStringValueForKey:@"name_cn"];
//    mapObject.name_en = [mglFeature.attributes getStringValueForKey:@"name_en"];
//    mapObject.address = [mglFeature.attributes getStringValueForKey:@"address"];
//    mapObject.category_type = [mglFeature.attributes getStringValueForKey:@"category_type"];
//    mapObject.poi_id = [mglFeature.attributes getIntValueForKey:@"poi_id"];
//    mapObject.poi_tbl = [mglFeature.attributes getStringValueForKey:@"poi_tbl"];
//    return mapObject;
//}

@end
