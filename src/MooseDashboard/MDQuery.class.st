Class {
	#name : #MDQuery,
	#superclass : #Object,
	#category : #'MooseDashboard-Query'
}

{ #category : #queries }
MDQuery >> percentageOfBigClasses: aFloat in: aModel [
	| bigClassesSize |

	bigClassesSize := (aModel size * aFloat) asInteger.
	^ (aModel asOrderedCollection
		sort: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ])
		copyFrom: 1
		to: bigClassesSize
]
