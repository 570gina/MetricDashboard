"
main presenter
"
Class {
	#name : #MDPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'model',
		'listView',
		'metricPresenter',
		'metricList'
	],
	#category : #'MetricDashboard-Core'
}

{ #category : #specs }
MDPresenter class >> create [
	self new selfbuilding;
	openWithSpec
	
]

{ #category : #specs }
MDPresenter class >> defaultSpec [
	^ SpecTableLayout column
		cellInset: 50;
		add: #metricList;
		add: #metricPresenter;
		add: #listView;
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
	listView
		handlesDoubleClick: true;
		displayBlock: [ :item | 
			item class = MooseModel
				ifTrue: [ item name ]
				ifFalse: [ item asString copyReplaceAll: 'famixt' with: 'famix' ] ];
		icons: [ :item | item mooseIcon ];
		sortingBlock: [ :a :b | a asString < b asString ]
]

{ #category : #initialization }
MDPresenter >> initializePresenter [
	listView
		doubleClickAction: [ :item | 
			| selected |
			selected := listView selectedItem.
			model studyModel: selected.
			model updatePresenter: self ]
]

{ #category : #initialization }
MDPresenter >> initializeWidgets [
	self initListView.
	metricPresenter := self instantiate: MDMetricDashBoard.
	model := MDModel new.
	metricList := self newDropList . 
	
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
MDPresenter >> metricList [
	^ metricList
]

{ #category : #accessing }
MDPresenter >> metricList: anObject [
	metricList := anObject
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
	^listView items: model projectModelPragmas 
]

{ #category : #'initialization-release' }
MDPresenter >> selfbuilding [
self loadModelToStudy.
self populateListView.


]

{ #category : #accessing }
MDPresenter >> simulateDoubleClick [
	^listView doubleClick: listView doubleClickAction
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
