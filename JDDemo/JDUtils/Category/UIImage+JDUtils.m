//
//  UIImage+JDUtils.m
//  JDUtils
//
//  Created by 蔡少武 on 15/9/22.
//  Copyright (c) 2015年 jiandan. All rights reserved.
//

#import "UIImage+JDUtils.h"

@implementation UIImage (JDUtils)

- (BOOL)jd_isLightColor {
    //获得主要颜色
    UIColor *color = [self jd_mostColor];
    //获得主要颜色的RGB值
    NSArray *components = [self jd_RGBComponentsWithColor:color];
    //RGB值分别相加，大于382的，定义为亮色
    CGFloat num = [components[0] floatValue] + [components[1] floatValue] + [components[2] floatValue];
    return num  > 382;
}

//来源网络:(链接遗失)
- (UIColor *)jd_mostColor {
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(50, 50);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, self.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL)
    {
        CGContextRelease(context);
        return nil;
    }
    
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            
            int offset = 4*(x*y);
            
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
            
        }
    }
    CGContextRelease(context);
    
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        
        if ( tmpCount < MaxCount ) continue;
        
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f)
                           green:([MaxColor[1] intValue]/255.0f)
                            blue:([MaxColor[2] intValue]/255.0f)
                           alpha:([MaxColor[3] intValue]/255.0f)];
}


//获取RGB值
- (NSArray *)jd_RGBComponentsWithColor:(UIColor *)color {
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 bitmapInfo);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);

    NSMutableArray *componets = [[NSMutableArray alloc]init];
    for (int i = 0; i < 3; i++) {
        [componets addObject:@(resultingPixel[i])];
    }
    return [componets mutableCopy];
}

- (UIImage *)jd_scaleToSize:(CGSize)size {
    //创建一个大小为size的image context，并将其设置为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    //根据原图，绘制大小为size的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //从当前的image context获得图片，此时图片为大小改变后的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //当前image context出栈
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)jd_imageWithColor:(UIColor *)color {
    CGRect frame = CGRectMake(0, 0, 1, 1);
    //创建一个image context，并将其设置为当前正在使用的context
    UIGraphicsBeginImageContext(frame.size);
    //获得当前正在使用的context
    CGContextRef context = UIGraphicsGetCurrentContext();
    //填充颜色
    CGContextSetFillColorWithColor(context, [color CGColor]);
    //设置填充区域
    CGContextFillRect(context, frame);
    //从当前的image context获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //当前image context出栈
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)jd_trimWithRect:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    //创建一个image context，并将其设置为当前正在使用的context
    UIGraphicsBeginImageContext(smallRect.size);
    //获得当前正在使用的context
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制图片
    CGContextDrawImage(context, smallRect, imageRef);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    //当前image context出栈
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)jd_rotateImageWithImageName:(NSString *)imageName orientation:(UIImageOrientation)orientation {
    CIImage *srcImage = [[CIImage alloc]initWithImage:[UIImage imageNamed:imageName]];
    return [UIImage imageWithCIImage:srcImage scale:1.0 orientation:orientation];
}

@end
