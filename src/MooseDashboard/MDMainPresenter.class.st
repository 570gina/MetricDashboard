"
main presenter
"
Class {
	#name : #MDMainPresenter,
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
MDMainPresenter class >> create [
	self new 
		initMooseModel ;
		openWithSpec
]

{ #category : #specs }
MDMainPresenter class >> defaultSpec [
	^ SpecTableLayout column
		cellInset: 50;
		
		add: #metricPresenter;
		add: #mooseView;
		yourself
]

{ #category : #specs }
MDMainPresenter class >> runMe [
	<script>
	self create
]

{ #category : #initialization }
MDMainPresenter >> initMooseModel [
self loadModelToStudy.
self populateListView.


]

{ #category : #initialization }
MDMainPresenter >> initMooseModelView [
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
MDMainPresenter >> initializePresenter [
	mooseView
		doubleClickAction: [ :item | 
			guiModel focusedEntities: mooseView selectedItem mdDoubleClick.
			metricPresenter updateViewFor: guiModel ]
]

{ #category : #initialization }
MDMainPresenter >> initializeWidgets [
	guiModel := MDGUIModel new .
	guiModel percentage: 0.2.
	guiModel addMetric: MDMetricLOC new.
	guiModel addMetric: MDMetricLCOM3 new.
	guiModel addMetric: MDMetricCyclomaticComplexity new.
	metricList := self newDropList.
	metricPresenter := self instantiate: MDMetricDashBoard.
	metricPresenter guiModel: guiModel.
	self initMooseModelView
]

{ #category : #accessing }
MDMainPresenter >> loadModelToStudy [
	^ guiModel loadProjectFromMSEFile
]

{ #category : #accessing }
MDMainPresenter >> metricPresenter [
	^ metricPresenter
]

{ #category : #accessing }
MDMainPresenter >> model [
	^ guiModel
]

{ #category : #accessing }
MDMainPresenter >> mooseView [
	^ mooseView
]

{ #category : #accessing }
MDMainPresenter >> populateListView [
	^ mooseView items: guiModel mooseModelSummary
]

{ #category : #accessing }
MDMainPresenter >> simulateDoubleClick [
	^mooseView doubleClick: mooseView doubleClickAction
]

{ #category : #api }
MDMainPresenter >> title [
^'Metric DashBoard'
]
