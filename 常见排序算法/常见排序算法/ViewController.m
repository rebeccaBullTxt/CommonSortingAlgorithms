//
//  ViewController.m
//  常见排序算法
//
//  Created by 刘渊 on 2019/8/19.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *marray = [NSMutableArray arrayWithArray:@[@4,@8,@3,@20,@10,@1,@5]];
//    [self bubbleSort:marray];
    [self quickSort:marray withLeftIndex:0 andRightIndex:(int)marray.count-1];
//    [self insertSort:marray];
//    [self selectionSort:marray];
//    [self orderMethod];
}

- (void)orderMethod{
    NSNumber *a = @(20);
    NSNumber *b = @(30);
    int result = [a compare:b];
    int result1 = [b compare:a];
    NSLog(@"result = %d, result1 = %d",result,result1);
    /*
     NSOrderedAscending = -1L,
     NSOrderedSame,
     NSOrderedDescending
     */
}

/**
 冒泡排序
 算法步骤：
 1.比较相邻的元素。如果第一个比第二个大，就交换他们两个
 2.对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数
 3.针对所有的元素重复以上的步骤，除了最后一个
 4.持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较
 */
- (void)bubbleSort:(NSMutableArray *)mtArr{
    if (mtArr.count == 0 || mtArr == nil) {
        return;
    }
    for (int i = 0; i < mtArr.count; i ++) {
        for (int j = 0; j < mtArr.count; j ++) {
            if ([mtArr[i] compare:mtArr[j]] == NSOrderedAscending){
                [mtArr exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    NSLog(@"mtArr = %@",mtArr);
}

//快速排序
/**
 快速排序
 算法步骤：
 1.从数列中挑出一个元素，称为“基准”（pivot）。
 2.重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作。
 3.递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。
 4.递归的最底部情形，是数列的大小是零或一，也就是永远都已经被排序好了。虽然一直递归下去，但是这个算法总会退出，因为在每次的迭代（iteration）中，它至少会把一个元素摆到它最后的位置去。
 */
-(void)quickSort:(NSMutableArray *)mtArr withLeftIndex:(int)leftIndex andRightIndex:(int)rightIndex{
    if (leftIndex >= rightIndex ) {
        return;
    }
    int i = leftIndex;
    int j = rightIndex;
    //@[@4,@8,@1,@10,@5]
    int number = [mtArr[i] intValue];
    while (i < j) {
        while (i < j && ([mtArr[j] intValue] >= number)){
            j --;
        }
        //比基数小 交换到左侧； 否则一直找
        [mtArr replaceObjectAtIndex:i withObject:mtArr[j]];
        while (i < j && ([mtArr[i] intValue] <= number)) {
            i ++;
        }
        [mtArr replaceObjectAtIndex:j withObject:mtArr[i]];
    }
    mtArr[i] = @(number);
    [self quickSort:mtArr withLeftIndex:leftIndex andRightIndex:i -1];
    [self quickSort:mtArr withLeftIndex:i + 1 andRightIndex:rightIndex];
}


/**
 插入排序
 算法步骤：
 1.将第一待排序序列第一个元素看做一个有序序列，把第二个元素到最后一个元素当成是未排序序列
 2.从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置（如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面）
 */
- (void)insertSort:(NSMutableArray *)mtArr{
    if (mtArr == nil || mtArr.count == 0) {
        return;
    }//@4,@8,@1,@10,@5
    for (int i = 0; i < mtArr.count; i ++) {
        NSNumber  * number = mtArr[i];
        int j = i - 1;
        while (j >= 0 && [mtArr[j] compare:number] == NSOrderedDescending) {
            [mtArr replaceObjectAtIndex:j + 1 withObject:mtArr[j]];
            j --;
        }
        [mtArr replaceObjectAtIndex:j + 1 withObject:number];
    }
}


/**
 选择排序
 算法步骤：
 1.首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
 2.再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾
 3.重复第二步，直到所有元素均排序完毕

 */
- (void)selectionSort:(NSMutableArray *)mtArr{
    if (mtArr == nil || mtArr.count == 0) {
        return;
    }
    for (int i = 0; i < mtArr.count; i ++) {
        for (int j = i + 1; j < mtArr.count; j ++) {//4,8,1,10,5
            if ([mtArr[i] compare:mtArr[j]] == NSOrderedDescending) {
                [mtArr exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    NSLog(@"mtArr = %@",mtArr);
}


@end
