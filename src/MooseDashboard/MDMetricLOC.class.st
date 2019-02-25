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

{ #category : #updating }
MDMetricLOC >> update: aMetricPresenter with: anObject [
	| col |
	col := OrderedCollection new.
	col
		add: self displayName;
		add: (self aggregateMetricFor: anObject);
		add: 'MAX';
		add: (self maxMetricFor: anObject);
		add: 'Core';
		add:
			(anObject coreClasses isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ self aggregateMetricFor: anObject coreClasses ]);
		add: 'MIN';
		add: (self minMetricFor: anObject).
	aMetricPresenter updateWith: col
]
