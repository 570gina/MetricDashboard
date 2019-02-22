"
I represent the LCOM3 cohesion Metric 
"
Class {
	#name : #MDMetricLCOM3,
	#superclass : #MDAbstractMetric,
	#category : #MooseDashboard
}

{ #category : #accessing }
MDMetricLCOM3 class >> displayName [
	^ 'LCOM3'
]

{ #category : #compute }
MDMetricLCOM3 >> aggregateMetricFor: aCollection [
	^self averageMetricFor: aCollection 
]

{ #category : #compute }
MDMetricLCOM3 >> computeMetricFor: anEntity [
	^anEntity lcom3 
]
