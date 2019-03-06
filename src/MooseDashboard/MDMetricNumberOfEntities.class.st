Class {
	#name : #MDMetricNumberOfEntities,
	#superclass : #MDAbstractMetric,
	#category : #'MooseDashboard-Metrics'
}

{ #category : #accessing }
MDMetricNumberOfEntities class >> displayName [
	^ '# Entities'
]

{ #category : #compute }
MDMetricNumberOfEntities >> aggregateMetricFor: aCollection [
	^ self sumMetricFor: aCollection
]

{ #category : #compute }
MDMetricNumberOfEntities >> computeMetricFor: anEntity [
	^ 1
]
