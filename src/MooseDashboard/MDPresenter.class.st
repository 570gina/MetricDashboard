"
main presenter
"
Class {
	#name : #MDPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'metricPresenter',
		'metricList',
		'guiModel',
		'mooseView'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDPresenter class >> create [
	self new 
		initMooseModel ;
		openWithSpec
]

{ #category : #specs }
MDPresenter class >> defaultSpec [
	^ SpecTableLayout column
		cellInset: 50;
		
		add: #metricPresenter;
		add: #mooseView;
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
MDPresenter >> initMooseModel [
self loadModelToStudy.
self populateListView.


]

{ #category : #initialization }
MDPresenter >> initMooseModelView [
	mooseView := self instantiate: FastTablePresenter.
	mooseView
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
	mooseView
		doubleClickAction: [ :item | 
			guiModel focusedEntities: mooseView selectedItem.
			metricPresenter updateViewFor: guiModel ]
]

{ #category : #initialization }
MDPresenter >> initializeWidgets [
	guiModel := MDGUIModel new.
	guiModel addMetric: MDMetricLOC new.
	guiModel addMetric: MDMetricLCOM3 new.
	guiModel addMetric: MDMetricCyclomaticComplexity new.
	metricList := self newDropList.
	metricPresenter := self instantiate: MDMetricDashBoard.
	metricPresenter guiModel: guiModel.
	self initMooseModelView
]

{ #category : #accessing }
MDPresenter >> loadModelToStudy [
guiModel loadProjectFromMSEFile
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
	^ guiModel
]

{ #category : #accessing }
MDPresenter >> mooseView [
	^ mooseView
]

{ #category : #accessing }
MDPresenter >> populateListView [
	^ mooseView items: guiModel mooseModelSummary
]

{ #category : #accessing }
MDPresenter >> simulateDoubleClick [
	^mooseView doubleClick: mooseView doubleClickAction
]

{ #category : #api }
MDPresenter >> title [
^'Metric DashBoard'
]
