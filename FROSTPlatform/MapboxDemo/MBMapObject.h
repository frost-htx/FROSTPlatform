//
//  MBMapObject.h
//  TantuMap
//
//  Created by simon on 2018/8/10.
//  Copyright © 2018 TantuMap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

// Mapbox返回应用层地图元素数据属性类型，包括：点，线，区域
typedef enum
{
  MBUnknow = 0,
  MBPoint,
  MBLine,
  MBArea
} MBMapObjectType;


//【wiki文档Link:http://wiki.tools.zuzuche.com/pages/viewpage.action?pageId=6331475】
@interface MBMapObject : NSObject

// 地图元素数据属性类型,，包括：点，线，区域
@property(nonatomic,assign) MBMapObjectType feature_type;

// 地图元素经纬度(CLLocationCoordinate2D)
@property(nonatomic,assign) CLLocationCoordinate2D feature_points;

// 地图元素默认名称（包括本地化名称）
@property(nonatomic,strong) NSString *name;

// 地图元素中文名
@property(nonatomic,strong) NSString *name_cn;

// 地图元素英文名
@property(nonatomic,strong) NSString *name_en;

// 地图元素地址
@property(nonatomic,strong) NSString *address;

//【需要国际化处理】地图元素类型，eg：amenity-attraction（景点）
@property(nonatomic,strong) NSString *category_type;

// 地图元素poiId（for探途打在地图上的数据）
@property(nonatomic,assign) int poi_id;

// 地图元素poiTbl（for探途打在地图上的数据）
@property(nonatomic,strong) NSString *poi_tbl;

@end
