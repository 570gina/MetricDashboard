"
I'm the actual dashbord
"
Class {
	#name : #MDMetricDashBoard,
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
MDMetricDashBoard class >> defaultSpec [
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
MDMetricDashBoard class >> runMe [
	<script>
	^ self new openWithSpec
]

{ #category : #accessing }
MDMetricDashBoard >> classCohesionItem [
	^ classCohesionItem
]

{ #category : #accessing }
MDMetricDashBoard >> classCohesionItem: anObject [
	classCohesionItem := anObject
]

{ #category : #accessing }
MDMetricDashBoard >> cohesionTodo1 [
	^ cohesionTodo1
]

{ #category : #accessing }
MDMetricDashBoard >> cohesionTodo2 [
	^ cohesionTodo2
]

{ #category : #initialization }
MDMetricDashBoard >> initializeWidgets [
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
MDMetricDashBoard >> packageCohesionItem [
	^ packageCohesionItem
]

{ #category : #accessing }
MDMetricDashBoard >> systemCohesionItem [
	^ systemCohesionItem
]

{ #category : #accessing }
MDMetricDashBoard >> updateClassCohesionItemLabel:aLabel [
	 ^classCohesionItem label: aLabel 
]

{ #category : #accessing }
MDMetricDashBoard >> updatePackageCohesionItemLabel:aLabel [
	^ packageCohesionItem label: aLabel
]

{ #category : #accessing }
MDMetricDashBoard >> updateSystemCohesionItemLabel:aLabel [
	^ systemCohesionItem label:aLabel
]
