"
main presenter
"
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
		newColumn: [ :cl | cl add: #metricPresenter ];
		newColumn: [ :cl | cl add: #listView ];
		yourself
]

{ #category : #specs }
MDPresenter class >> runMe [
	<script>
	self create
]

{ #category : #update }
MDPresenter >> extent [
^600@400
]

{ #category : #initialization }
MDPresenter >> initListView [
	listView := self instantiate: FastTablePresenter.
	listView handlesDoubleClick: true
]

{ #category : #initialization }
MDPresenter >> initializePresenter [
	listView
		doubleClickAction: [ :item | 
			| selected |
			selected := listView selectedItem.
			model currentClass: selected.
			model updatePresenter: self ]
]

{ #category : #initialization }
MDPresenter >> initializeWidgets [
	self initListView.
	metricPresenter := self instantiate: MDMetricPresenter.
	model := MDModel new
]

{ #category : #accessing }
MDPresenter >> listView [
	^ listView
]

{ #category : #accessing }
MDPresenter >> loadModelToStudy [
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

{ #category : #'initialization-release' }
MDPresenter >> selfbuilding [
self loadModelToStudy.
self populateListView.
self openWithSpec .

]

{ #category : #api }
MDPresenter >> title [
^'Metric DashBoard'
]

{ #category : #update }
MDPresenter >> updateMetricPresenterWith: anUpdater [
	metricPresenter
		updateClassCohesionItemLabel: anUpdater currentClassCohesion;
		updatePackageCohesionItemLabel: anUpdater averageclassePackageTightCohesion;
		updateSystemCohesionItemLabel: anUpdater averageSystemClassesTightCohesion
]
