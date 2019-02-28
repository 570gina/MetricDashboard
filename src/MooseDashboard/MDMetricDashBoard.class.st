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
MDMetricDashBoard >> updateSubView: aComposablePresenter withMetric: aMetric [
	| percent |
	percent := (guiModel percentage * 100) asString.
	aComposablePresenter
		updateMainMetric: (aMetric aggregateMetricFor: guiModel focusedEntities);
		updateDbLabel: aMetric displayName;
		updateSubMetric1WithName: 'Core'
			value: (aMetric aggregateMetricFor: guiModel focusedEntitiesCore);
		updateSubMetric2WithName: 'Big classes'
			value: (aMetric aggregateMetricFor: guiModel percentBigClasses);
		updateSubMetric3WithName: 'Complex classes'
			value: (aMetric aggregateMetricFor: guiModel percentOfComplexeClasses)
]

{ #category : #'view updating' }
MDMetricDashBoard >> updateViewFor: aGuiModel [
	| allMetrics |
	allMetrics := aGuiModel metrics.
	self updateSubView: metric1 withMetric: (allMetrics at: 1).
	self updateSubView: metric2 withMetric: (allMetrics at: 2).
	self updateSubView: metric3 withMetric: (allMetrics at: 3)
]
