Extension { #name : #FamixStClass }

{ #category : #'*MooseDashboard' }
FamixStClass >> cyclomaticComplexity [
	^ (methods collect: #cyclomaticComplexity)
		ifEmpty: [ 0 ]
		ifNotEmpty: [ :values | values average asFloat ]
]
