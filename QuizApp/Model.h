//
//  Model.h
//  QuizApp
//
//  Created by Wilhelm Fors on 17/01/17.
//  Copyright © 2017 Wilhelm Fors. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
-(NSArray *) getQuestion;
-(void) setUpQuestions;
-(BOOL) finished;
-(void) restartGame;
-(BOOL) isCorrectAnswer:(NSString*) answer;
-(NSArray*) scrambleArray: (NSArray *) array;
@property int score;
@property int questionsAsked;

@end

