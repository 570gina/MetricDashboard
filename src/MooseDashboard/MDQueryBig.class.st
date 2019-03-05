Class {
	#name : #MDQueryBig,
	#superclass : #MDQueryMetricThreshold,
	#category : #'MooseDashboard-Query'
}

{ #category : #accessing }
MDQueryBig >> displayName [
	^ 'BigClasses'
]

{ #category : #accessing }
MDQueryBig >> entities [
	^ self firstEntitiesFor: #numberOfLinesOfCode
]
