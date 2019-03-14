Extension { #name : #FAMIXClassGroup }

{ #category : #'*MooseDashboard' }
FAMIXClassGroup >> coreClasses [
^(self
		select:
			[ :each | each container mooseName asLowercase matchesRegex: '.*core.*' ])
		asSet
]

{ #category : #'*MooseDashboard' }
FAMIXClassGroup >> mdDoubleClick [
	^ self
]
