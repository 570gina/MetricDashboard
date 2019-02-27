"
I'm the metrics value of the model subset presenter 
Example : metric value of the bigest class, tiny class and the medium
"
Class {
	#name : #MDMetricPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'metricName',
		'metric',
		'subMetric1',
		'subMetric2',
		'subMetric3'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDMetricPresenter class >> defaultSpec [
	^ SpecTableLayout column
		add: #metricName;
		add: #metric;
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

{ #category : #initialization }
MDMetricPresenter >> initializeWidgets [
	metricName := self newLabel
		label: 'metricName';
		emphasis: #bold.
	metric := self newButton
		label: 'metric';
		color: Color white;
		yourself.
	subMetric1 := self newButton
		label: 'subMetric1';
		color: Color white;
		yourself.
	subMetric2 := self newButton
		label: 'subMetric2';
		color: Color white;
		yourself.
	subMetric3 := self newButton
		label: 'subMetric1';
		color: Color white;
		yourself
]

{ #category : #accessing }
MDMetricPresenter >> metric [
	^ metric
]

{ #category : #accessing }
MDMetricPresenter >> metricName [
	^ metricName
]

{ #category : #accessing }
MDMetricPresenter >> subMetric1 [
	^ subMetric1
]

{ #category : #accessing }
MDMetricPresenter >> subMetric2 [
	^ subMetric2
]

{ #category : #accessing }
MDMetricPresenter >> subMetric3 [
	^ subMetric3
]

{ #category : #'as yet unclassified' }
MDMetricPresenter >> updateDbLabel: aString [
	metricName label: aString
]

{ #category : #'as yet unclassified' }
MDMetricPresenter >> updateMainMetric: aNumber [
	metric label: (aNumber truncateTo: 0.001) asString
]

{ #category : #'as yet unclassified' }
MDMetricPresenter >> updateSubMetric1WithName: aString value: aNumber [
	subMetric1
		label: aString , String cr , (aNumber truncateTo: 0.001) asString
]

{ #category : #'as yet unclassified' }
MDMetricPresenter >> updateSubMetric2WithName: aString value: aNumber [
	subMetric2
		label: aString , String cr , (aNumber truncateTo: 0.001) asString
]

{ #category : #'as yet unclassified' }
MDMetricPresenter >> updateSubMetric3WithName: aString value: aNumber [
	subMetric3
		label: aString , String cr , (aNumber truncateTo: 0.001) asString
]
