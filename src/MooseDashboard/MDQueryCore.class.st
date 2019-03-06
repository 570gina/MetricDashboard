Class {
	#name : #MDQueryCore,
	#superclass : #MDQuery,
	#category : #'MooseDashboard-Query'
}

{ #category : #accessing }
MDQueryCore >> displayName [
	^ 'Core'
]

{ #category : #accessing }
MDQueryCore >> entities [
	^ (masterModel focusedEntities
		select:
			[ :each | each container mooseName asLowercase matchesRegex: '.*core.*' ])
		asCollection
]
