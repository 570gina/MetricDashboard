"
I representant abstract metric on a moose entity.
I can compute my value on the entity or aggregate my values over a collection of entities
"
Class {
	#name : #MDAbstractMetric,
	#superclass : #Object,
	#category : #MooseDashboard
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
	^ (aCollection collect: [ :each | self computeMetricFor: each ])
		average
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
MDAbstractMetric >> sumMetricFor: aCollection [
	^ (aCollection collect: [ :each | self computeMetricFor: each ])
		sum
]