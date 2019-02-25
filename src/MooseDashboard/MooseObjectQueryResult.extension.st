Extension { #name : #MooseObjectQueryResult }

{ #category : #'*MooseDashboard' }
MooseObjectQueryResult >> withinClass: aFAMIXClass [
	^ self
		newObjectResultWith:
			(storage
				select: [ :obj | 
					obj isNil
						ifTrue: [ false ]
						ifFalse: [ aFAMIXClass == obj typeScope ] ])
]
