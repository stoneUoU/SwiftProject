//
//  HiLoopView.h
//  SwiftProject
//
//  Created by stone on 2025/7/10.
//

#import <UIKit/UIKit.h>

@class HiLoopView;

typedef NS_ENUM(NSUInteger, HiLoopViewDirection) {
    HiLoopViewDirectionUpward,   // scroll from bottom to top
    HiLoopViewDirectionLeftward  // scroll from right to left
};

#pragma mark - HiLoopViewDelegate
@protocol HiLoopViewDelegate <NSObject>
- (NSUInteger)numberOfDataForLoopView:(HiLoopView*)loopView;
- (void)createItemView:(UIView*)itemView forLoopView:(HiLoopView*)loopView;
- (void)updateItemView:(UIView*)itemView atIndex:(NSUInteger)index forLoopView:(HiLoopView*)loopView;
@optional
- (NSUInteger)numberOfVisibleItemsForLoopView:(HiLoopView*)loopView;   // only for [HiLoopViewDirectionUpward]
- (CGFloat)itemViewWidthAtIndex:(NSUInteger)index forLoopView:(HiLoopView*)loopView;   // only for [HiLoopViewDirectionLeftward]
- (CGFloat)itemViewHeightAtIndex:(NSUInteger)index forLoopView:(HiLoopView*)loopView;   // only for [HiLoopViewDirectionUpward] and [useDynamicHeight = YES]
- (void)didTouchItemViewAtIndex:(NSUInteger)index forLoopView:(HiLoopView*)loopView;
@end

#pragma mark - HiLoopView
@interface HiLoopView : UIView
@property (nonatomic, weak) id<HiLoopViewDelegate> delegate;
@property (nonatomic, assign) NSTimeInterval timeIntervalPerScroll;
@property (nonatomic, assign) NSTimeInterval timeDurationPerScroll; // only for [HiLoopViewDirectionUpward] and [useDynamicHeight = NO]
@property (nonatomic, assign) BOOL useDynamicHeight;    // only for [HiLoopViewDirectionUpward]
@property (nonatomic, assign) float scrollSpeed;    // only for [HiLoopViewDirectionLeftward] or [HiLoopViewDirectionUpward] with [useDynamicHeight = YES]
@property (nonatomic, assign) float itemSpacing;    // only for [HiLoopViewDirectionLeftward]
@property (nonatomic, assign) BOOL stopWhenLessData;    // do not scroll when all data has been shown
@property (nonatomic, assign) BOOL clipsToBounds;
@property (nonatomic, assign, getter=isTouchEnabled) BOOL touchEnabled;
@property (nonatomic, assign) HiLoopViewDirection direction;
- (instancetype)initWithDirection:(HiLoopViewDirection)direction;
- (instancetype)initWithFrame:(CGRect)frame direction:(HiLoopViewDirection)direction;
- (void)reloadData;
- (void)start;
- (void)pause;
@end

#pragma mark - HiLoopViewTouchResponder(Private)
@protocol HiLoopViewTouchResponder <NSObject>
- (void)touchesBegan;
- (void)touchesEndedAtPoint:(CGPoint)point;
- (void)touchesCancelled;
@end

#pragma mark - HiLoopViewTouchReceiver(Private)
@interface HiLoopViewTouchReceiver : UIView
@property (nonatomic, weak) id<HiLoopViewTouchResponder> touchDelegate;
@end

#pragma mark - HiLoopListView(Private)
@interface HiLoopListView : UIView   // HiLoopListView's [tag] is the index of data source. if none data source then [tag] is -1
@property (nonatomic, assign) BOOL didFinishCreate;
@property (nonatomic, assign) CGFloat width;    // cache the item width, only for [HiLoopViewDirectionLeftward]
@property (nonatomic, assign) CGFloat height;   // cache the item height, only for [HiLoopViewDirectionUpward]
- (void)clear;
@end




