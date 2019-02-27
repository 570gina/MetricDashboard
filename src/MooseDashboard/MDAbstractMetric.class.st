"
I representant abstract metric on a moose entity.
I can compute my value on the entity or aggregate my values over a collection of entities
"
Class {
	#name : #MDAbstractMetric,
	#superclass : #Object,
	#category : #'MooseDashboard-Metrics'
}

{ #category : #accessing }
MDAbstractMetric class >> displayName [
	^'Unknown metric'
]

{ #category : #compute }
MDAbstractMetric >> aggregateMetricFor: aCollection [
	self subclassResponsibility
]

{ #category : #compute }
MDAbstractMetric >> averageMetricFor: aCollection [
	| col |
	col := aCollection collect: [ :each | self computeMetricFor: each ].
	col ifEmpty: [ ^ 0 ].
	^ col average
]

{ #category : #compute }
MDAbstractMetric >> computeMetricFor: anEntity [
	self subclassResponsibility
]

{ #category : #accessing }
MDAbstractMetric >> displayName [
	^self class displayName
]

{ #category : #compute }
MDAbstractMetric >> minMetricFor: aCollection [
	^ (aCollection collect: [ :each | self computeMetricFor: each ]) min
]

{ #category : #compute }
MDAbstractMetric >> sumMetricFor: aCollection [
	| col |
	col := (aCollection collect: [ :each | self computeMetricFor: each ])
		asOrderedCollection.
	col ifEmpty: [ ^ 0 ].
	^ col sum
]
