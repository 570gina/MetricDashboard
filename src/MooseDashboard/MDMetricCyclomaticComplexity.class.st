"
I represent the cyclomatic complexity Metric 
"
Class {
	#name : #MDMetricCyclomaticComplexity,
	#superclass : #MDAbstractMetric,
	#category : #MooseDashboard
}

{ #category : #accessing }
MDMetricCyclomaticComplexity class >> displayName [
	^'Cyclomatic Complexity' 
]

{ #category : #compute }
MDMetricCyclomaticComplexity >> aggregateMetricFor: aCollection [
	^ self averageMetricFor: aCollection
]

{ #category : #compute }
MDMetricCyclomaticComplexity >> computeMetricFor: anEntity [
	^anEntity cyclomaticComplexity 
]
