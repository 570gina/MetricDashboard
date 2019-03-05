"
I show the metrics of the dashboard
"
Class {
	#name : #MDMetricDashBoard,
	#superclass : #ComposablePresenter,
	#instVars : [
		'guiModel',
		'metricPresenters'
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
		add: #metricPresenter1;
		add: #metricPresenter2;
		add: #metricPresenter3;
		yourself
]

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
	1 to: 3 do: [ :i | 
		metricPresenters
			at: i
			put:
				((self instantiate: MDMetricPresenter)
					id: i;
					yourself) ]
]

{ #category : #private }
MDMetricDashBoard >> metricPresenter1 [
	"exists only for the MDMetricDashBoard class>>defaultSpec"
	^ self metricPresenter: 1
]

{ #category : #private }
MDMetricDashBoard >> metricPresenter2 [
	"exists only for the MDMetricDashBoard class>>defaultSpec"
	^ self metricPresenter: 2
]

{ #category : #private }
MDMetricDashBoard >> metricPresenter3 [
	"exists only for the MDMetricDashBoard class>>defaultSpec"
	^ self metricPresenter: 3
]

{ #category : #accessing }
MDMetricDashBoard >> metricPresenter: id [
	^ metricPresenters at: id
]

{ #category : #update }
MDMetricDashBoard >> updateView [
	1 to: 3 do: [ :i | (self metricPresenter: i) update ]
]
