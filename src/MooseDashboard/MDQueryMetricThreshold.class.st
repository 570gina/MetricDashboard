Class {
	#name : #MDQueryMetricThreshold,
	#superclass : #MDQuery,
	#instVars : [
		'threshold'
	],
	#category : #'MooseDashboard-Query'
}

{ #category : #accessing }
MDQueryMetricThreshold >> firstEntitiesFor: aSelector [
	| allEntities nbEntitesToSelect |
	allEntities := masterModel focusedEntities.
	nbEntitesToSelect := (allEntities size * threshold) asInteger.
	^ (allEntities
		sort: [ :a :b | (a perform: aSelector) > (b perform: aSelector) ])
		copyFrom: 1
		to: nbEntitesToSelect
]

{ #category : #accessing }
MDQueryMetricThreshold >> threshold [
	^ threshold
]

{ #category : #accessing }
MDQueryMetricThreshold >> threshold: anObject [
	threshold := anObject
]
