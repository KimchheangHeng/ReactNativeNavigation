#import "RNNStackPresenter.h"
#import "UINavigationController+RNNCommands.h"
#import "UINavigationController+RNNOptions.h"
#import "UIViewController+LayoutProtocol.h"
#import <UIKit/UIKit.h>

@interface RNNStackController : UINavigationController <RNNLayoutProtocol, UINavigationBarDelegate>

@property(nonatomic, retain) RNNStackPresenter *presenter;

- (instancetype)initWithLayoutInfo:(RNNLayoutInfo *)layoutInfo
                           creator:(id<RNNComponentViewCreator>)creator
                           options:(RNNNavigationOptions *)options
                    defaultOptions:(RNNNavigationOptions *)defaultOptions
                         presenter:(RNNBasePresenter *)presenter
                      eventEmitter:(RNNEventEmitter *)eventEmitter
              childViewControllers:(NSArray *)childViewControllers;

@end
