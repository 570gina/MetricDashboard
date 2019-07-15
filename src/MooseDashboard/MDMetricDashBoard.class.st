"
I show the metrics of the dashboard
"
Class {
	#name : #MDMetricDashBoard,
	#superclass : #DynamicComposablePresenter,
	#instVars : [
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
MDMetricDashBoard >> firstMetric [
^firstMetric
]

{ #category : #accessing }
MDMetricDashBoard >> guiModel: aGuiModel [
	firstMetric guiModel: aGuiModel.
	secondMetric guiModel: aGuiModel.
	thirdMetric guiModel: aGuiModel.

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

]

{ #category : #accessing }
MDMetricDashBoard >> metrics [
	^{firstMetric .secondMetric .thirdMetric}
]

{ #category : #accessing }
MDMetricDashBoard >> secondMetric [ ^secondMetric 
]

{ #category : #accessing }
MDMetricDashBoard >> thirdMetric [
	^ thirdMetric
]

{ #category : #update }
MDMetricDashBoard >> updateView [
		firstMetric update.
	secondMetric update.
	thirdMetric update
]

{ #category : #event }
MDMetricDashBoard >> whenMainMetricIsClick: aBlock [
self metrics do:[:each|each whenMainMetricValueIsClick: aBlock.]

]

{ #category : #event }
MDMetricDashBoard >> whenSubMetricsIsClick: aBlock [
	self metrics do: [ :each | each  whenFirstSubMetricIsClick: aBlock.
	each whenSecondSubMetricIsClick: aBlock.
	each whenThirdSubMetricIsClick: aBlock ]
	
]
