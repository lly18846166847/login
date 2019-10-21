//
//  main.m
//  OOP
//
//  Created by bjhl on 2019/10/15.
//  Copyright © 2019 lly. All rights reserved.
//

/*#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
 
 */


/*

#import "Foundation/Foundation.h"

typedef struct
{
    int x,y,wid,high;
} ShapeRect;
typedef enum{
    kRedColor,
    kBlueColor,
}ShapeColor;
typedef enum {
    kCircle,
    kRectangle,
    kOblateSpheroid,
    kTriangle
}ShapeType;
NSString *showColor (ShapeColor col)
{
    switch (col) {
        case kBlueColor:
            return @"BlueColor";
            break;
        case kRedColor:
            return @"RedColor";
            break;
        default:
            break;
    }
}
@interface Shape : NSObject
{
    ShapeColor col;
    ShapeRect rect;
};
- (void) setFillColor : (ShapeColor) col;
- (void) setRectSize : (ShapeRect) rect;
- (void) drawShape;
@end

@implementation Shape

- (void) setFillColor:(ShapeColor) c
{
    col = c;
}
- (void) setRectSize:(ShapeRect)r
{
    rect = r;
}
- (void) drawShape
{
    //NSLog(@"drawRect x = %d y = %d high = %d wid = %d color = %@",
     //     rect.x,rect.y,rect.high,rect.wid,showColor(col));
}
@end


@interface Rectangle : Shape;

@end

@implementation Rectangle

- (void) drawShape
{
    NSLog(@"drawRect x = %d y = %d high = %d wid = %d color = %@",
         rect.x,rect.y,rect.high,rect.wid,showColor(col));
}
@end

@interface Circle : Shape

@end
@implementation Circle

-(void) setFillColor:(ShapeColor)col
{
    if(col == kRedColor)
        col = kBlueColor;
    else
        [super setFillColor:<#col#>];
}
-(void) drawShape
{
    NSLog(@"drawCir x = %d y = %d high = %d wid = %d color = %@",
        rect.x,rect.y,rect.high,rect.wid,showColor(col));
}
@end
@interface Add : NSObject;
+ (int) funAdd : (int) a : (int) b;
@end
@implementation Add
    + (int) funAdd : (int) a : (int) b
    {
        return a+b;
    }
@end

@interface Sub : NSObject
{
    int a;
    int b;
};
- (int) funSub : (int) a : (int) b;

@end
@implementation Sub
- (int) funSub :(int) a : (int) b
{
    return a-b;
}

@end
int main()
{
    Sub *sub = [Sub new];
    Sub *ssub = [[Sub alloc]init];
                  
    int c = [ssub funSub:4 :1];
    NSLog(@"c = %d",c);
    int b = [sub funSub : 5:1];
    NSLog(@"Sub is %d",b);
    int a = [Add funAdd: 2:3];
    NSLog(@"funadd is %d",a);

    ShapeRect rect = {1,2,3,4};
    Shape * r = [Circle new];
    [r setFillColor:kBlueColor];
    [r setRectSize:rect];
    [r drawShape];
    
    
    NSString *str = @"hello";
    NSLog(@"str = %@",str);
    char * s = "xcode";
    NSLog(@"%s = word",s);
    return 0;
}

*/

#import "Foundation/Foundation.h"

@interface Engine : NSObject

@end
@implementation Engine
- (void) describe
{
    NSLog(@"I am a Engine");
}
@end
@interface Tire : NSObject
@end
@implementation Tire
- (void) describe
{
    NSLog(@"I am a Tire");
}
@end
@interface Car : NSObject
{
    Engine * engine;
    Tire * tire[4];
};
@end
@implementation Car
- (id) init
{
    if(self = [super init])
    {
        engine = [Engine new];
        tire[0] = [Tire new];
        tire[1] = [Tire new];
        tire[2] = [Tire new];
        tire[3] = [Tire new];
    }
    return self;
}
- (void) showCar
{
    NSLog(@"%@" , engine);
    NSLog(@"%@" , tire[0]);
    [tire[0] describe];
}
@end
int main()
{
    //Car *c = [Car new];
    //[c showCar];
    
    NSString *str;
    str = [NSString stringWithFormat:@"qweerrtyuuu"];
    NSLog(@"%@",str);
    
    NSString * str1;
    NSString * str2;
    str1 = [NSString stringWithFormat:@"asdfg"];
    str2 = @"asdfg";
    if([str1 isEqualToString:str2])
    {
        NSLog(@"same");
    }
    if(str1 == str2)
    {
        NSLog(@"Same");
    }
    
    if([str1 compare:str2] == NSOrderedSame)
    {
        NSLog(@"NSOrderedSame");
    }
    
    if([@"Asdfg" compare: @"asdfg"
        options:NSCaseInsensitiveSearch | NSNumericSearch] == NSOrderedSame)
    {
        NSLog(@"NSCaseInsensitiveSearch same");
    }
    NSString * filename = @"word.txt";
    if([filename hasPrefix: @"word"])
    {
        NSLog(@"filename hasPrefix");
    }
    if([filename hasSuffix:@"txt"])
    {
        NSLog(@"filename hasSuffix");
    }
    
    NSRange range;
    range = [filename rangeOfString:@"or"];
    if(range.location  != NSNotFound)
    {
        NSLog(@" range.location = %d range.length = %d",(int)range.location,(int)range.length);
    }
    
    NSString * string;
    string = [NSString stringWithFormat:@"qwertyuiioop"];
    NSRange ran = NSMakeRange(0, 4);
    NSLog(@"subStringWithRange from NSRange = %@",[string substringWithRange:ran]);
    NSLog(@"substringFromIndex from num to end = %@",[string substringFromIndex:4]);
    NSLog(@"substringToIndex from begin to num = %@",[string substringToIndex:4]);

    
    NSMutableString * mstr;
    mstr = [NSMutableString stringWithCapacity:42];
    [mstr appendString:@"quicker"];
    [mstr appendFormat:@"flower"];
    [mstr appendString:@"hh"];
    NSLog(@"mstr = %@",mstr);
    [mstr deleteCharactersInRange:ran];
    NSLog(@"mstr = %@",mstr);
    
    NSRange deleteRange;
    deleteRange = [mstr rangeOfString:@"ker"];
    [mstr deleteCharactersInRange:deleteRange];
    NSLog(@"mstr = %@",mstr);
    
    NSArray * narray;
    narray = [NSArray arrayWithObjects:@"quick",@"fast",@"thing",nil];
    NSLog(@"narray = %@",narray);
    unsigned long count = [narray count];
    NSLog(@"narray count = %lu",count);
    NSLog(@"index = %@",[narray objectAtIndex:2]);
    
    NSMutableArray * nmarray;
    nmarray = [NSMutableArray arrayWithObjects:@"adjetive",@"slow",@"verb",nil];
    [nmarray addObject:@"adverb"];
    NSLog(@"nmarray = %@",nmarray);
    unsigned long mcount = [nmarray count];
    NSLog(@"nmarray count = %lu",mcount);
    NSRange rangeArr;
    rangeArr = NSMakeRange(0, 3);
    //[nmarray removeObject: inRange:rangeArr];
    [nmarray removeObject:@"slow" inRange:rangeArr];
    [nmarray removeObjectAtIndex:2];
    NSLog(@"%@",nmarray);
    
    NSString * mustring;
    NSArray * muarray;
    mustring = [NSString stringWithFormat:@"2019:10:16:9.30"];
    muarray = [mustring componentsSeparatedByString:@":"];
    NSLog(@"%@",muarray);
    
    
    
    
    return 0;
}
