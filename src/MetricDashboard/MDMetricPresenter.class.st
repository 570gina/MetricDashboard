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
		'cohesionTodo2'
	],
	#category : #'MetricDashboard-Core'
}

{ #category : #specs }
MDMetricPresenter class >> defaultSpec [
	^ SpecTableLayout row
		cellInset: 10;
		maxCellSize: 150; 
		vResizing:#shrinkWrap ;
		hResizing: #shrinkWrap;
		add: #systemCohesionItem;
		add: #packageCohesionItem;
		add: #classCohesionItem;
		add: #cohesionTodo2;
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
	cohesionTodo2 := self newButton icon:(self iconNamed: #add).

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
