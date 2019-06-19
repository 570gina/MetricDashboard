"
I'm the metrics value of the model subset presenter 
Example : metric value of the bigest class, tiny class and the medium
"
Class {
	#name : #MDMetricPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'guiModel',
		'subMetrics',
		'mainMetricValue',
		'mainMetricName',
		'id',
		'firstSubMetric',
		'secondSubMetric',
		'thirdSubMetric'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDMetricPresenter class >> defaultSpec [
	^ SpecBoxLayout newVertical
		add: (SpecBoxLayout newVertical add:#mainMetricName
			withConstraints: [ :c | c height: self defaultFont height ];
		add: #mainMetricValue);
		add:
			(SpecBoxLayout newHorizontal
				add: #firstSubMetric;
				add: #secondSubMetric;
				add: #thirdSubMetric);
		yourself
]

{ #category : #specs }
MDMetricPresenter class >> runMe [ 
<script>
self new openWithSpec 

]

{ #category : #accessing }
MDMetricPresenter >> guiModel: aGuiModel [
	guiModel := aGuiModel.
	mainMetricName label: self myMetric displayName
]

{ #category : #accessing }
MDMetricPresenter >> id: aNumber [
	id := aNumber
]

{ #category : #initialization }
MDMetricPresenter >> initializeWidgets [
	mainMetricName := self newLabel emphasis: #bold.
	mainMetricValue := self newButton.
	firstSubMetric := self newButton
.
	secondSubMetric := self newButton
.
	thirdSubMetric := self newButton
.
	subMetrics := {firstSubMetric.
	secondSubMetric.
	thirdSubMetric}
]

{ #category : #accessing }
MDMetricPresenter >> mainMetricValue [
^mainMetricValue
]

{ #category : #accessing }
MDMetricPresenter >> myMetric [
	^ guiModel metric: id
]

{ #category : #accessing }
MDMetricPresenter >> subMetric: index [
	^ subMetrics at: index
]

{ #category : #update }
MDMetricPresenter >> update [
	self updateMainMetric.
	self updateSubMetrics
]

{ #category : #update }
MDMetricPresenter >> updateMainMetric [
	| value |
	value := self myMetric aggregateMetricFor: guiModel focusedEntities.
	mainMetricValue label: (value truncateTo: 0.001) asString
]

{ #category : #update }
MDMetricPresenter >> updateSubMetrics [
	1 to: 3 do: [ :iSub | 
		| sub value |
		sub := guiModel subQuery: iSub.
		value := self myMetric aggregateMetricFor: sub entities.
		 (subMetrics at: iSub)
			label: sub displayName , String cr , (value truncateTo: 0.001) asString ]
]
