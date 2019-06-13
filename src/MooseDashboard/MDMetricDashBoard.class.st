"
I show the metrics of the dashboard
"
Class {
	#name : #MDMetricDashBoard,
	#superclass : #DynamicComposablePresenter,
	#instVars : [
		'guiModel',
		'metricPresenters',
		'firstMetric',
		'secondMetric',
		'thirdMetric'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDMetricDashBoard class >> defaultSpec [
	^ SpecBoxLayout newHorizontal 
		add: #firstMetric;
		add: #secondMetric;
		add: #thirdMetric;
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
MDMetricDashBoard >> initializeWidgets [
	firstMetric := (self instantiate: MDMetricPresenter)
		id: 1;
		yourself.
	secondMetric := (self instantiate: MDMetricPresenter)
		id: 2;
		yourself.
	thirdMetric := (self instantiate: MDMetricPresenter)
		id: 3;
		yourself.
	metricPresenters := {firstMetric.
	secondMetric.
	thirdMetric}
]

{ #category : #accessing }
MDMetricDashBoard >> metricPresenter: id [
	^ metricPresenters at: id
]

{ #category : #update }
MDMetricDashBoard >> updateView [
	1 to: 3 do: [ :i | (self metricPresenter: i) update ]
]
