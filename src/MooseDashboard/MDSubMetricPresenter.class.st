"
I'm the metrics value of the model subset presenter 
Example : metric value of the bigest class, tiny class and the medium
"
Class {
	#name : #MDSubMetricPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'subMetric1',
		'subMetric2',
		'subMetric3'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDSubMetricPresenter class >> defaultSpec [
	^ SpecTableLayout row 
	add: #subMetric1;
	add: #subMetric2;
	add: #subMetric3;
	yourself 
]

{ #category : #specs }
MDSubMetricPresenter class >> runMe [ 
<script>
self new openWithSpec 

]

{ #category : #initialization }
MDSubMetricPresenter >> initializeWidgets [
	subMetric1 := self newLabel
		label: 'sub1'.
	subMetric2 := self newLabel label:'sub2'.
	subMetric3 := self newLabel label:'sub3'
]

{ #category : #accessing }
MDSubMetricPresenter >> subMetric1 [
	^ subMetric1
]

{ #category : #accessing }
MDSubMetricPresenter >> subMetric2 [
	^ subMetric2
]

{ #category : #accessing }
MDSubMetricPresenter >> subMetric3 [
	^ subMetric3
]
