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
		'id'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDMetricPresenter class >> defaultSpec [
	^ SpecTableLayout column
		add: #mainMetricName;
		add: #mainMetricValue;
		newRow: [ :r | 
			r
				add: #subMetric1;
				add: #subMetric2;
				add: #subMetric3 ];
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
MDMetricPresenter >> initialize [
	subMetrics := #(nil nil nil) asOrderedCollection.	"must be before self initializeWidgets"
	super initialize
]

{ #category : #initialization }
MDMetricPresenter >> initializeWidgets [
	mainMetricName := self newLabel
		label: '';
		emphasis: #bold.
	mainMetricValue := self newButton
		label: '';
		color: Color white;
		yourself.
	subMetrics at: 1 put: (self newButton
		label: '';
		color: Color white;
		yourself).
	subMetrics at: 2 put: (self newButton
		label: '';
		color: Color white;
		yourself).
	subMetrics at: 3 put: (self newButton
		label: '';
		color: Color white;
		yourself)
]

{ #category : #accessing }
MDMetricPresenter >> mainMetricName [
	^ mainMetricName
]

{ #category : #accessing }
MDMetricPresenter >> mainMetricValue [
	^ mainMetricValue
]

{ #category : #accessing }
MDMetricPresenter >> myMetric [
	^ guiModel metric: id
]

{ #category : #private }
MDMetricPresenter >> subMetric1 [
	"exists only for the MDMetricPresenter class>>defaultSpec"
	^ self subMetric: 1
]

{ #category : #private }
MDMetricPresenter >> subMetric2 [
	"exists only for the MDMetricPresenter class>>defaultSpec"
	^ self subMetric: 2
]

{ #category : #private }
MDMetricPresenter >> subMetric3 [
	"exists only for the MDMetricPresenter class>>defaultSpec"
	^ self subMetric: 3
]

{ #category : #accessing }
MDMetricPresenter >> subMetric: id [
	^ subMetrics at: id
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
	1 halt.
	mainMetricValue label: (value truncateTo: 0.001) asString
]

{ #category : #update }
MDMetricPresenter >> updateSubMetrics [
	1 to: 3 do: [ :iSub | 
		| sub value |
		sub := guiModel subQuery: iSub.
		value := self myMetric aggregateMetricFor: sub entities.
		(self subMetric: iSub)
			label: sub displayName , String cr , (value truncateTo: 0.001) asString ]
]
