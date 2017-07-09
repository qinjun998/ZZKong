//
//  ETPopoverController.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol ETPopoverControllerDelegate;
@class ETPopoverTheme;

#ifndef ET_POPOVER_DEFAULT_ANIMATION_DURATION
#define ET_POPOVER_DEFAULT_ANIMATION_DURATION    .25f
#endif

#ifndef ET_POPOVER_MIN_SIZE
#define ET_POPOVER_MIN_SIZE                      CGSizeMake(240, 160)
#endif

typedef NS_OPTIONS(NSUInteger, ETPopoverArrowDirection) {
    ETPopoverArrowDirectionUp = 1UL << 0,
    ETPopoverArrowDirectionDown = 1UL << 1,
    ETPopoverArrowDirectionLeft = 1UL << 2,
    ETPopoverArrowDirectionRight = 1UL << 3,
    ETPopoverArrowDirectionNone = 1UL << 4,
    ETPopoverArrowDirectionAny = ETPopoverArrowDirectionUp | ETPopoverArrowDirectionDown | ETPopoverArrowDirectionLeft | ETPopoverArrowDirectionRight,
    ETPopoverArrowDirectionUnknown = NSUIntegerMax
};

typedef NS_OPTIONS(NSUInteger, ETPopoverAnimationOptions) {
    ETPopoverAnimationOptionFade = 1UL << 0,            // default
    ETPopoverAnimationOptionScale = 1UL << 1,
    ETPopoverAnimationOptionFadeWithScale = ETPopoverAnimationOptionFade | ETPopoverAnimationOptionScale
};

////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface ETPopoverBackgroundView : UIView

@property (nonatomic, strong) UIColor *tintColor                UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *fillTopColor             UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *fillBottomColor          UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) UIColor *glossShadowColor         UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) CGSize   glossShadowOffset        UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) NSUInteger  glossShadowBlurRadius    UI_APPEARANCE_SELECTOR;

@property (nonatomic, assign) NSUInteger  borderWidth              UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) NSUInteger  arrowBase                UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) NSUInteger  arrowHeight              UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) UIColor *outerShadowColor         UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *outerStrokeColor         UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) NSUInteger  outerShadowBlurRadius    UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) CGSize   outerShadowOffset        UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) NSUInteger  outerCornerRadius        UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) NSUInteger  minOuterCornerRadius     UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) UIColor *innerShadowColor         UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *innerStrokeColor         UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) NSUInteger  innerShadowBlurRadius    UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) CGSize   innerShadowOffset        UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) NSUInteger  innerCornerRadius        UI_APPEARANCE_SELECTOR;

@property (nonatomic, assign) UIEdgeInsets viewContentInsets    UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) UIColor *overlayColor             UI_APPEARANCE_SELECTOR;

@end

@interface ETPopoverController : NSObject<UIAppearanceContainer>

@property (nonatomic, weak) id <ETPopoverControllerDelegate> delegate;

@property (nonatomic, copy) NSArray                            *passthroughViews;
@property (nonatomic, assign) BOOL                              wantsDefaultContentAppearance;
@property (nonatomic, assign) UIEdgeInsets                      popoverLayoutMargins;
@property (nonatomic, readonly, getter=isPopoverVisible) BOOL   popoverVisible;
@property (nonatomic, strong, readonly) UIViewController       *contentViewController;
@property (nonatomic, assign) CGSize                            popoverContentSize;
@property (nonatomic, assign) float                             animationDuration;

@property (nonatomic, strong) ETPopoverTheme                   *theme;

+ (void)setDefaultTheme:(ETPopoverTheme *)theme;
+ (ETPopoverTheme *)defaultTheme;

// initialization

- (id)initWithContentViewController:(UIViewController *)viewController;

// theme

- (void)beginThemeUpdates;
- (void)endThemeUpdates;

// Present popover from classic views methods

- (void)presentPopoverFromRect:(CGRect)rect
                        inView:(UIView *)view
      permittedArrowDirections:(ETPopoverArrowDirection)arrowDirections
                      animated:(BOOL)animated;

- (void)presentPopoverFromRect:(CGRect)rect
                        inView:(UIView *)view
      permittedArrowDirections:(ETPopoverArrowDirection)arrowDirections
                      animated:(BOOL)animated
                    completion:(void (^)(void))completion;

- (void)presentPopoverFromRect:(CGRect)rect
                        inView:(UIView *)view
      permittedArrowDirections:(ETPopoverArrowDirection)arrowDirections
                      animated:(BOOL)animated
                       options:(ETPopoverAnimationOptions)options;

- (void)presentPopoverFromRect:(CGRect)rect
                        inView:(UIView *)view
      permittedArrowDirections:(ETPopoverArrowDirection)arrowDirections
                      animated:(BOOL)animated
                       options:(ETPopoverAnimationOptions)options
                    completion:(void (^)(void))completion;

// Present popover from bar button items methods

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item
               permittedArrowDirections:(ETPopoverArrowDirection)arrowDirections
                               animated:(BOOL)animated;

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item
               permittedArrowDirections:(ETPopoverArrowDirection)arrowDirections
                               animated:(BOOL)animated
                             completion:(void (^)(void))completion;

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item
               permittedArrowDirections:(ETPopoverArrowDirection)arrowDirections
                               animated:(BOOL)animated
                                options:(ETPopoverAnimationOptions)options;

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item
               permittedArrowDirections:(ETPopoverArrowDirection)arrowDirections
                               animated:(BOOL)animated
                                options:(ETPopoverAnimationOptions)options
                             completion:(void (^)(void))completion;

// Present popover as dialog methods

- (void)presentPopoverAsDialogAnimated:(BOOL)animated;

- (void)presentPopoverAsDialogAnimated:(BOOL)animated
                            completion:(void (^)(void))completion;

- (void)presentPopoverAsDialogAnimated:(BOOL)animated
                               options:(ETPopoverAnimationOptions)options;

- (void)presentPopoverAsDialogAnimated:(BOOL)animated
                               options:(ETPopoverAnimationOptions)options
                            completion:(void (^)(void))completion;

// Dismiss popover methods

- (void)dismissPopoverAnimated:(BOOL)animated;

- (void)dismissPopoverAnimated:(BOOL)animated
                    completion:(void (^)(void))completion;

- (void)dismissPopoverAnimated:(BOOL)animated
                       options:(ETPopoverAnimationOptions)aOptions;

- (void)dismissPopoverAnimated:(BOOL)animated
                       options:(ETPopoverAnimationOptions)aOptions
                    completion:(void (^)(void))completion;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@protocol ETPopoverControllerDelegate <NSObject>
@optional

- (BOOL)popoverControllerShouldDismissPopover:(ETPopoverController *)popoverController;

- (void)popoverControllerDidPresentPopover:(ETPopoverController *)popoverController;

- (void)popoverControllerDidDismissPopover:(ETPopoverController *)popoverController;

- (void)popoverController:(ETPopoverController *)popoverController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView **)view;

- (BOOL)popoverControllerShouldIgnoreKeyboardBounds:(ETPopoverController *)popoverController;

- (void)popoverController:(ETPopoverController *)popoverController willTranslatePopoverWithYOffset:(float *)value;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface ETPopoverTheme : NSObject

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *fillTopColor;
@property (nonatomic, strong) UIColor *fillBottomColor;

@property (nonatomic, strong) UIColor *glossShadowColor;
@property (nonatomic, assign) CGSize   glossShadowOffset;
@property (nonatomic, assign) NSUInteger  glossShadowBlurRadius;

@property (nonatomic, assign) NSUInteger  borderWidth;
@property (nonatomic, assign) NSUInteger  arrowBase;
@property (nonatomic, assign) NSUInteger  arrowHeight;

@property (nonatomic, strong) UIColor *outerShadowColor;
@property (nonatomic, strong) UIColor *outerStrokeColor;
@property (nonatomic, assign) NSUInteger  outerShadowBlurRadius;
@property (nonatomic, assign) CGSize   outerShadowOffset;
@property (nonatomic, assign) NSUInteger  outerCornerRadius;
@property (nonatomic, assign) NSUInteger  minOuterCornerRadius;

@property (nonatomic, strong) UIColor *innerShadowColor;
@property (nonatomic, strong) UIColor *innerStrokeColor;
@property (nonatomic, assign) NSUInteger  innerShadowBlurRadius;
@property (nonatomic, assign) CGSize   innerShadowOffset;
@property (nonatomic, assign) NSUInteger  innerCornerRadius;

@property (nonatomic, assign) UIEdgeInsets viewContentInsets;

@property (nonatomic, strong) UIColor *overlayColor;

+ (instancetype)theme;
+ (instancetype)themeForIOS6;
+ (instancetype)themeForIOS7;

@end

