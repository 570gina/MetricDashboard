"
I show the metrics of the dashboard
"
Class {
	#name : #MDMetricDashBoard,
	#superclass : #ComposablePresenter,
	#instVars : [
		'guiModel',
		'cohesionTodo2',
		'metric1',
		'metric2',
		'metric3'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDMetricDashBoard class >> defaultSpec [
	^ SpecTableLayout row
		cellInset: 10;
	
		minCellSize: 100;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		add: #metric1;
		add: #metric2;
		add: #metric3;
		add: #cohesionTodo2;
		yourself
]

{ #category : #specs }
MDMetricDashBoard class >> runMe [
	<script>
	^ self new openWithSpec
]

{ #category : #accessing }
MDMetricDashBoard >> cohesionTodo2 [
	^ cohesionTodo2
]

{ #category : #accessing }
MDMetricDashBoard >> cohesionTodo2: anObject [
	cohesionTodo2 := anObject
]

{ #category : #accessing }
MDMetricDashBoard >> guiModel [
	^ guiModel
]

{ #category : #accessing }
MDMetricDashBoard >> guiModel: anObject [
	guiModel := anObject
]

{ #category : #initialization }
MDMetricDashBoard >> initializeWidgets [
	metric1 := (self instantiate: MDMetricPresenter)
	.
	metric3 := self instantiate: MDMetricPresenter.
	metric2 := self instantiate: MDMetricPresenter.
	cohesionTodo2 := self newButton icon: (self iconNamed: #add)
]

{ #category : #accessing }
MDMetricDashBoard >> metric1 [
	^ metric1
]

{ #category : #accessing }
MDMetricDashBoard >> metric1: anObject [
	metric1 := anObject
]

{ #category : #accessing }
MDMetricDashBoard >> metric2 [
	^ metric2
]

{ #category : #accessing }
MDMetricDashBoard >> metric2: anObject [
	metric2 := anObject
]

{ #category : #accessing }
MDMetricDashBoard >> metric3 [
	^ metric3
]

{ #category : #accessing }
MDMetricDashBoard >> metric3: anObject [
	metric3 := anObject
]

{ #category : #'view updating' }
MDMetricDashBoard >> updateViewFor: aGuiModel [
	| allMetrics focusedEntities |
	allMetrics := aGuiModel metrics.
	focusedEntities := aGuiModel focusedEntities.
	(allMetrics at: 1) update: metric1 with: focusedEntities.
	(allMetrics at: 2) update: metric2 with: focusedEntities.
	(allMetrics at: 3) update: metric3 with: focusedEntities
]
