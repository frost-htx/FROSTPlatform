//
//  MapBoxViewController.m
//  FROSTPlatform
//
//  Created by frost on 2018/8/27.
//  Copyright © 2018年 frost. All rights reserved.
//

#import "MapBoxViewController.h"
#import "MYTestObject.h"
#import "MYTestObject+Category.h"

@interface MapBoxViewController ()

//第一题
@property (nonatomic,copy) NSString *test1;
@property (nonatomic,strong) NSString *test2;


//第二题
@property (copy) NSMutableArray *mutableArray;


@end

@implementation MapBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self interviewQuestions5];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - 第一题：怎么用 copy 关键字:

/**
 1,NSString、NSArray、NSDictionary 等等经常使用copy关键字，
 是因为他们有对应的可变类型：NSMutableString、NSMutableArray、
 NSMutableDictionary
 
 2,block 也经常使用 copy 关键字,
 block 使用 copy 是从 MRC 遗留下来的“传统”,在 MRC 中,
 方法内部的 block 是在栈区的,使用 copy 可以把它放到堆区。
 在ARC中编译器自动对 block 进行了 copy 操作
 */
-(void)interviewQuestions1
{
    NSMutableString *a = [NSMutableString stringWithFormat:@"999"];
    self.test1 = a; //使用copy关键字，会将原值拷贝一份，不会随着a改变
    self.test2 = a; //使用strong关键字，会随着a改变
    
    [a appendFormat:@"++++"];
    
    NSLog(@"test1 = %@,test2 = %@",self.test1,self.test2);

}


#pragma mark - 第二题：这个写法会出什么问题： @property (copy) NSMutableArray *array;

/**
 两个问题：
 1、添加,删除,修改数组内的元素的时候,程序会因为找不到对应的方法而崩溃.
 因为 copy 就是复制一个不可变 NSArray 的对象；
 
 2、使用了 atomic 属性会严重影响性能 ；atomicity在创建时会生成一些额外的代码用于帮助编写多线程程序
 */
-(void)interviewQuestions2
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1,@2,nil];
    self.mutableArray = array;
    [self.mutableArray removeObjectAtIndex:0]; //程序直接crash，因为使用copy关键字，copy 就是复制一个不可变的对象
}

#pragma mark - 第三题：如何让自己的类用 copy 修饰符？如何重写带 copy 关键字的 setter

-(void)interviewQuestions3
{
    /**
     1,需声明该类遵从 NSCopying 协议,实现 NSCopying 协议。- (id)copyWithZone:(NSZone *)zone;
     
     - (void)setName:(NSString *)name {
            _name = [name copy];
     }
     
     */
}

#pragma mark -  第四题 @property 的本质是什么？ivar、getter、setter 是如何生成并添加到这个类中的

-(void)interviewQuestions4
{
    /**
     1,@property 的本质是什么？
     @property 的本质是:@property = ivar（实例变量） + (存取方法)(getter + setter);
     存取方法有着严格的命名规范, 正因为有了这种严格的命名规范，所以 Objective-C
     这门语言才能根据名称自动创建出存取方法。比如：
     
     @interface Person : NSObject
     @property NSString *firstName;
     @end
     
     等价于：
     @interface Person : NSObject
     - (NSString *)firstName;
     - (void)setFirstName:(NSString *)firstName;
     @end
     
     property在runtime中是objc_property_t定义如下:
     typedef struct objc_property *objc_property_t;
     
     objc_property是一个结构体，包括name和attributes，定义如下：
     struct property_t {
        const char *name;
        const char *attributes;
     };
     
     而attributes的具体内容包括：类型，原子性，内存语义和对应的实例变量、
     定义一个：@property (nonatomic, copy) NSString *string
     获取到attributes并打印出来之后的结果为T@"NSString",C,N,V_string
     其中T就代表类型，C就代表Copy，N代表nonatomic，V就代表对于的实例变量。
     
     
     2，ivar、getter、setter 是如何生成并添加到这个类中的?
     完成属性定义后，编译器会自动编写访问这些属性所需的方法，此过程叫做“自动合成”(autosynthesis)。
     这个过程由编译 器在编译期执行，除了生成方法代码 getter、setter 之外，
     编译器还要自动向类中添加适当类型的实例变量，并且在属性名前面加下划线，以此作为实例变量的名字。
     也可以在类的实现代码里通过 @synthesize 语法来指定
     比如：
     @implementation Person
     @synthesize firstName = _myFirstName;
     @end
     
     实现属性大致生成了五个东西
     
     1，偏移量“硬编码” (hardcode)，表示该变量距离存放对象的内存区域的起始地址有多远
     2，setter 与 getter 方法对应的实现函数
     3，ivar_list ：成员变量列表
     4，method_list ：方法列表
     5，prop_list ：属性列表
     
     每次在增加一个属性,系统都会在 ivar_list 中添加一个成员变量的描述,在 method_list
     中增加 setter 与 getter 方法的描述,在属性列表中增加一个属性的描述,然后计算该属性在对象中的偏移量,
     然后给出 setter 与 getter 方法对应的实现,在 setter 方法中从偏移量的位置开始赋值,
     在 getter 方法中从偏移量开始取值
     
     */
}

#pragma mark -  第五题 @protocol 和 category 中如何使用 @property

-(void)interviewQuestions5
{
    
    /*
     1,在 protocol 中使用 property 只会生成 setter 和 getter 方法声明,我们使用属性的目的,
     是希望遵守我协议的对象能实现该属性,需要手动调用@synthesize生成成员变量
     
     2，category 使用 @property 也是只会生成 setter 和 getter 方法的声明,
     如果需要给 category 增加属性的实现,需要借助于运行时的两个函数：
     objc_getAssociatedObject
     objc_setAssociatedObject
     */
    
    MYTestObject *tmp = [[MYTestObject alloc] init];
    tmp.name = @"123123";
    tmp.testName = @"1234";
    NSLog(@"123123 : %@",tmp.testName);
    
    
}

#pragma mark -  第六题 @property中有哪些属性关键字？/ @property 后面可以有哪些修饰符？

-(void)interviewQuestions6
{
    /*
     1，原子性--- nonatomic 在默认情况下，由编译器合成的方法会通过锁定机制确保其原子性(atomicity)。如果属性具备 nonatomic 特质，则不使用自旋锁
     2，读/写权限---readwrite(读写)、readonly (只读)
     3，内存管理语义---assign、strong、 weak、unsafe_unretained、copy
     4，方法名---getter=<name> 、setter=<name>
     
     在数据反序列化、转模型的过程中，服务器返回的字段如果以 init 开头，所以你需要定义一个 init 开头的属性，但默认生成的 setter 与 getter 方法也会以 init 开头，而编译器会把所有以 init 开头的方法当成初始化方法，而初始化方法只能返回 self 类型，因此编译器会报错
     比如：
     @property(nonatomic, strong, getter=p_initBy, setter=setP_initBy:)NSString *initBy;

     5，不常用的：nonnull,null_resettable,nullable
     
     */
}

#pragma mark -  第七题 weak属性需要在dealloc中置nil么？

-(void)interviewQuestions7
{
    /*
     不需要。
     
     在ARC环境无论是强指针还是弱指针都无需在 dealloc 设置为 nil ， ARC 会自动帮我们处理
     即便是编译器不帮我们做这些，weak也不需要在 dealloc 中置nil：
     
     weak 此特质表明该属性定义了一种“非拥有关系” (nonowning relationship)。为这种属性设置新值时，设置方法既不保留新值，也不释放旧值。此特质同 assign 类似， 然而在属性所指的对象遭到摧毁时，属性值也会清空(nil out)
     */
}

#pragma mark -  第八题 weak属性需要在dealloc中置nil么？

-(void)interviewQuestions8
{
    /*
     1，@property有两个对应的词，一个是 @synthesize，一个是 @dynamic。如果 @synthesize和 @dynamic都没写，那么默认的就是@syntheszie var = _var;
     2，@synthesize 的语义是如果你没有手动实现 setter 方法和 getter 方法，那么编译器会自动为你加上这两个方法。
     3，@dynamic 告诉编译器：属性的 setter 与 getter 方法由用户自己实现，不自动生成。（当然对于 readonly 的属性只需提供 getter 即可）。假如一个属性被声明为 @dynamic var，然后你没有提供 @setter方法和 @getter 方法，编译的时候没问题，但是当程序运行到 instance.var = someVar，由于缺 setter 方法会导致程序崩溃；或者当运行到 someVar = var 时，由于缺 getter 方法同样会导致崩溃。编译时没问题，运行时才执行相应的方法，这就是所谓的动态绑定。
    */
}

#pragma mark -  第九题 ARC下，不显式指定任何属性关键字时，默认的关键字都有哪些？

-(void)interviewQuestions9
{
    /*
     1,对应基本数据类型默认关键字是:atomic,readwrite,assign
     2,对于普通的 Objective-C 对象 atomic,readwrite,strong
     */
}

#pragma mark -  第九题 iOS 的深复制与浅复制

-(void)interviewQuestions10
{
    /*
     1. 对非集合类对象的copy操作：
     
     [immutableObject copy] // 浅复制
     [immutableObject mutableCopy] //深复制
     [mutableObject copy] //深复制
     [mutableObject mutableCopy] //深复制
     
     2、集合类对象的copy与mutableCopy
     [immutableObject copy] // 浅复制
     [immutableObject mutableCopy] //单层深复制
     [mutableObject copy] //单层深复制
     [mutableObject mutableCopy] //单层深复制
     
     参考链接:https://www.zybuluo.com/MicroCai/note/50592
     */
}































@end
