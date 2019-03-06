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
	^ anEntity numberOfLinesOfCode
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
