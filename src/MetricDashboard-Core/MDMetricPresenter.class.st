"
I'm the actual dashbord
"
Class {
	#name : #MDMetricPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'classCohesionItem',
		'systemCohesionItem',
		'packageCohesionItem',
		'cohesionTodo1',
		'cohesionTodo2',
		'cohesionTodo3'
	],
	#category : #'MetricDashboard-Core'
}

{ #category : #specs }
MDMetricPresenter class >> defaultSpec [
	^ SpecLayout composed
		add: #systemCohesionItem origin: 0 @ 0 corner: 0.4 @ 0.25;
		add: #packageCohesionItem origin: 0.5 @ 0 corner: 0.9 @ 0.25;
		add: #classCohesionItem origin: 0 @ 0.35 corner: 0.4 @ 0.60;
		add: #cohesionTodo2 origin: 0.5 @ 0.35 corner: 0.9 @ 0.60;
		add: #cohesionTodo3 origin: 0 @ 0.75 corner: 0.4 @ 1;
		yourself
]

{ #category : #specs }
MDMetricPresenter class >> runMe [
	<script>
	^ self new openWithSpec
]

{ #category : #accessing }
MDMetricPresenter >> classCohesionItem [
	^ classCohesionItem
]

{ #category : #accessing }
MDMetricPresenter >> classCohesionItem: anObject [
	classCohesionItem := anObject
]

{ #category : #accessing }
MDMetricPresenter >> cohesionTodo1 [
	^ cohesionTodo1
]

{ #category : #accessing }
MDMetricPresenter >> cohesionTodo2 [
	^ cohesionTodo2
]

{ #category : #accessing }
MDMetricPresenter >> cohesionTodo3 [
	^ cohesionTodo3
]

{ #category : #initialization }
MDMetricPresenter >> initializeWidgets [
	classCohesionItem := self newButton
		label: 'classCohesionItem';
		icon: (self iconNamed: #class).
	systemCohesionItem := self newButton
		label: 'systemCohesionItem';
		icon: (self iconNamed: #workspace).
	packageCohesionItem := self newButton
		label: 'packageCohesionItem';
		icon: (self iconNamed: #packageColored).
	cohesionTodo2 := self newButton label: 'cohesionTodo2'.
	cohesionTodo3 := self newButton label: 'cohesionTodo3'
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
