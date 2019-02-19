Class {
	#name : #MDPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'model',
		'listView',
		'metricPresenter'
	],
	#category : #'MetricDashboard-Core'
}

{ #category : #specs }
MDPresenter class >> create [
	self new selfbuilding
]

{ #category : #specs }
MDPresenter class >> defaultSpec [
	^ SpecColumnLayout composed
		add: #listView;
		add: #metricPresenter;
		yourself
]

{ #category : #specs }
MDPresenter class >> runMe [
	<script>
	self new openWithSpec
]

{ #category : #initialization }
MDPresenter >> initListView [
	listView := self instantiate: FastTablePresenter.
	listView handlesDoubleClick: true
]

{ #category : #initialization }
MDPresenter >> initializeWidgets [
	self initListView.
	metricPresenter := self instantiate: MDMetricPresenter
]

{ #category : #accessing }
MDPresenter >> listView [
	^ listView
]

{ #category : #accessing }
MDPresenter >> loadStudyModel [
model loadProjectFromMSEFile
]

{ #category : #accessing }
MDPresenter >> metricPresenter [
	^ metricPresenter
]

{ #category : #accessing }
MDPresenter >> model [
	^ model
]

{ #category : #accessing }
MDPresenter >> populateListView [
	^listView items: model projectModelClasses
]

{ #category : #'as yet unclassified' }
MDPresenter >> selfbuilding [
self loadStudyModel.
self populateListView.
self openWorldWithSpec .

]

{ #category : #api }
MDPresenter >> title [
^'Metric DashBoard'
]
