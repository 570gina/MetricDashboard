"
I query models
"
Class {
	#name : #MDQuery,
	#superclass : #Object,
	#category : #'MooseDashboard-Query'
}

{ #category : #queries }
MDQuery >> coreClasses: aModel [
	^ (aModel 
		select:
			[ :each | each container mooseName asLowercase matchesRegex: '.*core.*' ])
		asSet
]

{ #category : #queries }
MDQuery >> percentageOfBigClasses: aFloat in: aModel [
	| bigClassesSize |

	bigClassesSize := (aModel size * aFloat) asInteger.
	^ (aModel asOrderedCollection
		sort: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ])
		copyFrom: 1
		to: bigClassesSize
]

{ #category : #queries }
MDQuery >> percentageOfComplexeClasses: aFloat in: aModel [
	| classesSize |
	classesSize := (aModel size * aFloat) asInteger.
	^ (aModel asOrderedCollection
		sort: [ :a :b | a cyclomaticComplexity > b cyclomaticComplexity ])
		copyFrom: 1
		to: classesSize
]
