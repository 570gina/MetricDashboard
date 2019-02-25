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
		'metric3',
		'subMetric11',
		'subMetric12',
		'subMetric13',
		'subMetric21',
		'subMetric22',
		'subMetric23',
		'subMetric31',
		'subMetric32',
		'subMetric33'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDMetricDashBoard class >> defaultSpec [
	^ SpecTableLayout row
		cellInset: 10;
		maxCellSize: 150;
		minCellSize: 100;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		newColumn: [ :cl | 
			cl
				add: #subMetric11;
				newRow: [ :r | 
					r
						add: #subMetric12;
						add: #metric1 ];
				add: #subMetric13 ];
		newColumn: [ :cl | 
			cl
				add: #subMetric21;
				newRow: [ :r | 
					r
						add: #subMetric22;
						add: #metric2 ];
				add: #subMetric23 ];
		newColumn: [ :cl | 
			cl
				add: #subMetric31;
				newRow: [ :r | 
					r
						add: #subMetric32;
						add: #metric3 ];
				add: #subMetric33 ];
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
	metric1 := self newButton.
	metric3 := self newButton.
	metric2 := self newButton.
	cohesionTodo2 := self newButton icon: (self iconNamed: #add).
	subMetric11 := self newButton.
	subMetric12 := self newButton.
	subMetric13 := self newButton.
	subMetric21 := self newButton.
	subMetric22 := self newButton.
	subMetric23 := self newButton.
	subMetric31 := self newButton.
	subMetric32 := self newButton.
	subMetric33 := self newButton
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

{ #category : #accessing }
MDMetricDashBoard >> subMetric11 [
	^ subMetric11
]

{ #category : #accessing }
MDMetricDashBoard >> subMetric12 [
	^ subMetric12
]

{ #category : #accessing }
MDMetricDashBoard >> subMetric13 [
	^ subMetric13
]

{ #category : #accessing }
MDMetricDashBoard >> subMetric21 [
	^ subMetric21
]

{ #category : #accessing }
MDMetricDashBoard >> subMetric22 [
	^ subMetric22
]

{ #category : #accessing }
MDMetricDashBoard >> subMetric23 [
	^ subMetric23
]

{ #category : #accessing }
MDMetricDashBoard >> subMetric31 [
	^ subMetric31
]

{ #category : #accessing }
MDMetricDashBoard >> subMetric32 [
	^ subMetric32
]

{ #category : #accessing }
MDMetricDashBoard >> subMetric33 [
	^ subMetric33
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

{ #category : #accessing }
MDMetricDashBoard >> updateMetricLabelFor: aMetricButton with: aString value: aNumber [
	aMetricButton
		label: aString , String cr , (aNumber truncateTo: 0.001) asString
]

{ #category : #'view updating' }
MDMetricDashBoard >> updateViewFor: aGuiModel [
	| allMetrics focusedEntities |
	allMetrics := aGuiModel metrics.
	focusedEntities := aGuiModel focusedEntities.
	(1 to: allMetrics size)
		do: [ :i | 
			| metric |
			metric := allMetrics at: i.
			i = 1
				ifTrue: [ self
						updateMetric1Label: metric displayName
						value: (metric aggregateMetricFor: focusedEntities).
					self
						updateMetricLabelFor: subMetric11
						with: 'MAX' , metric displayName
						value: (metric maxMetricFor: focusedEntities).
					self
						updateMetricLabelFor: subMetric13
						with: 'MIN' , metric displayName
						value: (metric minMetricFor: focusedEntities) ].
			i = 2
				ifTrue: [ self
						updateMetric2Label: metric displayName
						value: (metric aggregateMetricFor: focusedEntities) ].
			i = 3
				ifTrue: [ self
						updateMetric3Label: metric displayName
						value: (metric aggregateMetricFor: focusedEntities) ] ]
]
