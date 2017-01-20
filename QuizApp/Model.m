//
//  Model.m
//  QuizApp
//
//  Created by Wilhelm Fors on 17/01/17.
//  Copyright © 2017 Wilhelm Fors. All rights reserved.
//

#import "Model.h"

@interface Model()
@property NSArray *q1;
@property NSArray *q2;
@property NSArray *q3;
@property NSArray *q4;
@property NSArray *q5;
@property NSArray *q6;
@property NSArray *q7;
@property NSArray *q8;
@property NSArray *q9;
@property NSArray *q10;
@property NSMutableArray *usedQuestions;
@property NSMutableArray *currentQuestion;
@end

@implementation Model
-(void) setUpQuestions {
    self.q1 = [NSArray arrayWithObjects: @"Hur lång är Fredrik?", @"1.83", @"1.90", @"1.86", @"1.77", nil];
    self.q2 = [NSArray arrayWithObjects: @"Hur låter Chewbacca?", @"Rawr", @"Pip", @"Mjau", @"Mu", nil];
    self.q3 = [NSArray arrayWithObjects: @"Hur många ben har en spindel?", @"8", @"6", @"10", @"4", nil];
    self.q4 = [NSArray arrayWithObjects: @"Vad kom först?", @"Hjulet", @"Hönan", @"Ägget", @"Skyskrapan", nil];
    self.q5 = [NSArray arrayWithObjects: @"Korv med ...?", @"Bröd", @"Fisk", @"Öl", @"Korv", nil];
    self.q6 = [NSArray arrayWithObjects: @"Vilken färg är finast?", @"Orange", @"Grön", @"Blå", @"Gul", nil];
    self.q7 = [NSArray arrayWithObjects: @"Vem överlever utan syre?", @"Alien", @"Polis", @"Räv", @"Solros", nil];
    self.q8 = [NSArray arrayWithObjects: @"Var är gräset grönare?", @"Nangijala", @"Andra sidan", @"Gröna Lund", @"Sahara", nil];
    self.q9 = [NSArray arrayWithObjects: @"Hur gammal var Albert Einstein när han dog?", @"76", @"54", @"94", @"69", nil];
    self.q10 = [NSArray arrayWithObjects: @"Vad är huvudingrediensen i rosor?", @"Blomma", @"Kärlek", @"Parfymdoft", @"Taggar", nil];
    self.usedQuestions = [[NSMutableArray alloc] init];
    self.currentQuestion  = [NSMutableArray arrayWithObjects: @"-", @"-", @"-", @"-", @"-", nil];

}
-(NSArray *) getQuestion {
    self.questionsAsked++;
    int number;
    do {
        number = arc4random() % 10;
    } while (([self.usedQuestions containsObject: [NSNumber numberWithInt: number]]));
    
    
    switch(number) {
        case 0:
            self.usedQuestions[self.usedQuestions.count] = @0;
            [self updateCurrentQuestion: [self q1]];
            return [self q1];
            break;
            
        case 1:
            self.usedQuestions[self.usedQuestions.count] = @1;
            [self updateCurrentQuestion: [self q2]];
            return [self q2];
            break;
    
        case 2:
            self.usedQuestions[self.usedQuestions.count] = @2;
            [self updateCurrentQuestion: [self q3]];
            return [self q3];
            break;
            
        case 3:
            self.usedQuestions[self.usedQuestions.count] = @3;
            [self updateCurrentQuestion: [self q4]];
            return [self q4];
            break;
            
        case 4:
            self.usedQuestions[self.usedQuestions.count] = @4;
            [self updateCurrentQuestion: [self q5]];
            return [self q5];
            break;
            
        case 5:
            self.usedQuestions[self.usedQuestions.count] = @5;
            [self updateCurrentQuestion: [self q6]];
            return [self q6];
            break;

        case 6:
            self.usedQuestions[self.usedQuestions.count] = @6;
            [self updateCurrentQuestion: [self q7]];
            return [self q7];
            break;

        case 7:
            self.usedQuestions[self.usedQuestions.count] = @7;
            [self updateCurrentQuestion: [self q8]];
            return [self q8];
            break;

        case 8:
            self.usedQuestions[self.usedQuestions.count] = @8;
            [self updateCurrentQuestion: [self q9]];
            return [self q9];
            break;

        case 9:
            self.usedQuestions[self.usedQuestions.count] = @9;
            [self updateCurrentQuestion: [self q10]];
            return [self q10];
            break;

            
        default:
            return nil;
            break;
    };
}

-(BOOL) finished {
    if(self.questionsAsked == 5) {
        return YES;
    }
    else {
        return NO;
    }
}
-(void) restartGame {
    [self.usedQuestions removeAllObjects];
    self.questionsAsked = 0;
    self.score = 0;
}

-(BOOL) isCorrectAnswer :(NSString*) answer {
    
    if ([answer isEqualToString: self.currentQuestion[1]]){
        self.score++;
        return YES;
    } else {
        return NO;
    }
    
}

-(void) updateCurrentQuestion: (NSArray *) question {
    self.currentQuestion[0] = question[0];
        self.currentQuestion[1] = question[1];
        self.currentQuestion[2] = question[2];
        self.currentQuestion[3] = question[3];
        self.currentQuestion[4] = question[4];
}

-(NSArray*) scrambleArray: (NSArray *) array {
    int a;
    int b;
    int c;
    int d;
    NSArray *scrambledArray;
    
    a = (arc4random() % 4) + 1;
    do {
        b = (arc4random() % 4) + 1;
    } while (a == b);
    
    do {
        c = (arc4random() % 4) + 1;
    } while (c == a || c == b);

    do {
        d = (arc4random() % 4) + 1;
    } while (d == a || d == b || d == c);
    
    scrambledArray = [NSArray arrayWithObjects:array[0], array[a], array[b], array[c], array[d],nil];
    return scrambledArray;

}

/*-(int) getAge {
    int ofTheJedi = self.age;
    return ofTheJedi;
}*/

@end
