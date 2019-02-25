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
	^ SpecTableLayout row
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
	metric := self newButton label: 'metric'.
	subMetric1 := self newButton label: 'subMetric1'.
	subMetric2 := self newButton label: 'subMetric2'.
	subMetric3 := self newButton label: 'subMetric1'
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

{ #category : #initialization }
MDMetricPresenter >> updateWith: aCollection [
	| metricName |
	metricName := aCollection at: 1.
	metric
		label:
			metricName , String cr
				, ((aCollection at: 2) truncateTo: 0.001) asString.
	aCollection size = 2
		ifTrue: [ ^ self ].
	subMetric1
		label:
			(aCollection at: 3) , metricName , String cr
				, (aCollection at: 4) asString.
	subMetric2
		label:
			(aCollection at: 5) , metricName , String cr
				, (aCollection at: 6) asString.
	subMetric3
		label:
			(aCollection at: 7) , metricName , String cr
				, (aCollection at: 8) asString
]
