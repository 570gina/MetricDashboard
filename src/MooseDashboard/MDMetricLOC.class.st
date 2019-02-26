"
I represent the LinesOfCode Metric 
"
Class {
	#name : #MDMetricLOC,
	#superclass : #MDAbstractMetric,
	#category : #'MooseDashboard-Metrics'
}

{ #category : #accessing }
MDMetricLOC class >> displayName [
	^ 'LOC'
]

{ #category : #compute }
MDMetricLOC >> aggregateMetricFor: aCollection [
	^ self sumMetricFor: aCollection
]

{ #category : #compute }
MDMetricLOC >> computeMetricFor: anEntity [
	^anEntity numberOfLinesOfCode 
]

{ #category : #compute }
MDMetricLOC >> twentyPercentOfBigClassesLOC: aCollection [
	| twentyPercentSize |
	twentyPercentSize := (aCollection size * 0.2)  asInteger  .
	^ (((aCollection asOrderedCollection
		collect: [ :each | self computeMetricFor: each ])
		sort: [ :a :b | a > b ])
		copyFrom: 1
		to: twentyPercentSize ) sum
]

{ #category : #updating }
MDMetricLOC >> update: aMetricPresenter with: anObject [
	| col |
	col := OrderedCollection new.
	col
		add: self displayName;
		add: (self aggregateMetricFor: anObject);
		add: '20%Big Classes ';
		add: (self twentyPercentOfBigClassesLOC: anObject);
		add: 'Core';
		add:
			(anObject coreClasses isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ self aggregateMetricFor: anObject coreClasses ]);
		add: 'MIN';
		add: (self minMetricFor: anObject).
	aMetricPresenter updateWith: col
]
