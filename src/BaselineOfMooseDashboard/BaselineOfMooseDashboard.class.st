Class {
	#name : #BaselineOfMooseDashboard,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseDashboard
}

{ #category : #baselines }
BaselineOfMooseDashboard >> baseline:spec [
"baselines"
<baseline>
spec
	for: #common
	do:[
		"Packages"
		spec
		package: 'MooseDashboard';
		package: 'MooseDashboard-tests'.
		
		"Groups"
		spec
		group: 'default' with:#('MooseDashboard');
		group: 'withTests' with: #('MooseDashboard' 'MooseDashboard-tests') 
		]
]
