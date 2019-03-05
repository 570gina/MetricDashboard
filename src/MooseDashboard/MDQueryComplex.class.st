Class {
	#name : #MDQueryComplex,
	#superclass : #MDQueryMetricThreshold,
	#category : #'MooseDashboard-Query'
}

{ #category : #accessing }
MDQueryComplex >> displayName [
	^ 'ComplexClasses'
]

{ #category : #accessing }
MDQueryComplex >> entities [
	^self firstEntitiesFor: #cyclomaticComplexity
]
