"
I'm the actual dashbord
"
Class {
	#name : #MDMetricPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'classCohesionItem',
		'systemCohesionItem',
		'packageCohesionItem'
	],
	#category : #'MetricDashboard-Core'
}

{ #category : #specs }
MDMetricPresenter class >> defaultSpec [
	^ SpecLayout composed
		add: #systemCohesionItem origin: 0 @ 0 corner: 0.4 @ 0.25;
		add: #packageCohesionItem origin: 0.5 @ 0 corner: 0.9 @ 0.25;
		add: #classCohesionItem origin: 0 @ 0.35 corner: 0.4 @ 0.60;
		add: #classCohesionItem origin: 0.5 @ 0.35 corner: 0.9 @ 0.60;
		add: #classCohesionItem origin: 0 @ 0.75 corner: 0.4 @ 1;
		yourself
]

{ #category : #accessing }
MDMetricPresenter >> classCohesionItem [
	^ classCohesionItem
]

{ #category : #initialization }
MDMetricPresenter >> initializeWidgets [
	classCohesionItem := self newButton label: 'classCohesionItem'.
	systemCohesionItem := self newButton label: 'systemCohesionItem'.
	packageCohesionItem := self newButton label: 'packageCohesionItem'.
	
]

{ #category : #accessing }
MDMetricPresenter >> packageCohesionItem [
	^ packageCohesionItem
]

{ #category : #accessing }
MDMetricPresenter >> systemCohesionItem [
	^ systemCohesionItem
]

{ #category : #accessing }
MDMetricPresenter >> updateClassCohesionItemLabel:aLabel [
	 ^classCohesionItem label: aLabel 
]

{ #category : #accessing }
MDMetricPresenter >> updatePackageCohesionItemLabel:aLabel [
	^ packageCohesionItem label: aLabel
]

{ #category : #accessing }
MDMetricPresenter >> updateSystemCohesionItemLabel:aLabel [
	^ systemCohesionItem label:aLabel
]
