"
I show the metrics of the dashboard
"
Class {
	#name : #MDMetricDashBoard,
	#superclass : #DynamicComposablePresenter,
	#instVars : [
		'guiModel',
		'metricPresenters'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDMetricDashBoard class >> runMe [
	<script>
	^ self new openWithSpec
]

{ #category : #accessing }
MDMetricDashBoard >> guiModel: anObject [
	guiModel := anObject.
	1 to: 3 do: [ :i |
		(self metricPresenter: i) guiModel: anObject]
]

{ #category : #initialization }
MDMetricDashBoard >> initialize [
	metricPresenters := #(nil nil nil) asOrderedCollection.	"must be before self initializeWidgets"
	super initialize.
]

{ #category : #initialization }
MDMetricDashBoard >> initializeWidgets [
	| model |
	1 to: 3 do: [ :i | 
		model := (self instantiate: MDMetricPresenter)
			id: i;
			yourself.
		metricPresenters at: i put: model.
		self assign: model to: ('metricPresenter' , i asString) asSymbol ]
]

{ #category : #accessing }
MDMetricDashBoard >> layout [
	^ SpecTableLayout row
		cellInset: 10;
		minCellSize: 100;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		add: #metricPresenter1;
		add: #metricPresenter2;
		add: #metricPresenter3;
		yourself
]

{ #category : #accessing }
MDMetricDashBoard >> metricPresenter: id [
	^ metricPresenters at: id
]

{ #category : #update }
MDMetricDashBoard >> updateView [
	1 to: 3 do: [ :i | (self metricPresenter: i) update ]
]
