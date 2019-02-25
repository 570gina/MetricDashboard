"
I'm the metrics value of the model subset presenter 
Example : metric value of the bigest class, tiny class and the medium
"
Class {
	#name : #MDMetricPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'metric',
		'subMetric1',
		'subMetric2',
		'subMetric3'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDMetricPresenter class >> defaultSpec [
	^ SpecRowLayout composed
		newColumn: [ :cl | 
			cl
				add: #subMetric1;
				newRow: [ :r | 
					r
						add: #subMetric2;
						add: #metric ];
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
metric := self newButton .
subMetric1  := self newButton .
subMetric2  := self newButton .
subMetric3  := self newButton .
]

{ #category : #accessing }
MDMetricPresenter >> metric [
	^ metric
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
MDMetricPresenter >> subscribeToMetric: aMetric [
aMetric addListener: self.

]
