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
		maxCellSize: 150; 
		minCellSize: 100;
		vResizing:#shrinkWrap ;
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
MDMetricDashBoard >> guiModel [
	^ guiModel
]

{ #category : #accessing }
MDMetricDashBoard >> guiModel: anObject [
	guiModel := anObject
]

{ #category : #initialization }
MDMetricDashBoard >> initializeWidgets [
	metric1 := self newButton.
	metric3 := self newButton.
	metric2 := self newButton.
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
MDMetricDashBoard >> metric3 [
	^ metric3
]

{ #category : #accessing }
MDMetricDashBoard >> updateMetric1Label: aString value: aNumber [
	metric1 label: aString , String cr , (aNumber truncateTo: 0.001) asString
]

{ #category : #accessing }
MDMetricDashBoard >> updateMetric2Label: aString value: aNumber [
	metric2 label: aString , String cr , (aNumber truncateTo: 0.001) asString
]

{ #category : #accessing }
MDMetricDashBoard >> updateMetric3Label: aString value: aNumber [
	metric3 label: aString , String cr , (aNumber truncateTo: 0.001) asString
]

{ #category : #'view updating' }
MDMetricDashBoard >> updateViewFor: aGuiModel [
	| allMetrics |
	allMetrics := aGuiModel metrics.
	(1 to: allMetrics size)
		do: [ :i | |metric|
			metric := allMetrics at: i.
			i = 1
				ifTrue: [self
						updateMetric1Label: metric displayName value: (metric aggregateMetricFor: aGuiModel focusedEntities) ].
			i = 2
				ifTrue: [ self
						updateMetric2Label: metric displayName value: (metric aggregateMetricFor: aGuiModel focusedEntities) ].
			i = 3
				ifTrue: [ self
						updateMetric3Label: metric displayName value: (metric aggregateMetricFor: aGuiModel focusedEntities) ] ]
]
