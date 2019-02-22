"
I represent the LinesOfCode Metric 
"
Class {
	#name : #MDMetricLOC,
	#superclass : #MDAbstractMetric,
	#category : #MooseDashboard
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
