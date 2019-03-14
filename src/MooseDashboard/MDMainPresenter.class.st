"
main presenter
"
Class {
	#name : #MDMainPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'metricList',
		'guiModel',
		'mooseView',
		'metricsDashboard'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #specs }
MDMainPresenter class >> create [
	self new openDefault 
]

{ #category : #specs }
MDMainPresenter class >> defaultSpec [
	^ SpecTableLayout column
		cellInset: 50;
		
		add: #metricsDashboard;
		add: #mooseView;
		yourself
]

{ #category : #specs }
MDMainPresenter class >> runMe [
	<script>
	self create
]

{ #category : #accessing }
MDMainPresenter >> guiModel: aModel [
	guiModel := aModel.
	metricsDashboard guiModel: aModel
]

{ #category : #initialization }
MDMainPresenter >> initMooseModel [
self loadModelToStudy.
self populateListView.


]

{ #category : #initialization }
MDMainPresenter >> initialize [
	super initialize.
	self guiModel: MDGUIModel new
]

{ #category : #initialization }
MDMainPresenter >> initializePresenter [
	mooseView
		handlesDoubleClick: true;
		doubleClickAction: [ :item |
			guiModel focusedEntities: mooseView selectedItem mdDoubleClick.
			metricsDashboard updateView ]
]

{ #category : #initialization }
MDMainPresenter >> initializeWidgets [
	metricsDashboard := self instantiate: MDMetricDashBoard.
	mooseView := self instantiate: FastTablePresenter.
	mooseView
		displayBlock: [ :item | 
			item class = MooseModel
				ifTrue: [ item name ]
				ifFalse: [ item asString copyReplaceAll: 'famixt' with: 'famix' ] ];
		icons: [ :item | item mooseIcon ];
		sortingBlock: [ :a :b | a asString < b asString ]
]

{ #category : #'instance creation' }
MDMainPresenter >> loadModelToStudy [
	^ guiModel loadProjectFromMSEFile
]

{ #category : #accessing }
MDMainPresenter >> metricsDashboard [
	^ metricsDashboard
]

{ #category : #accessing }
MDMainPresenter >> model [
	^ guiModel
]

{ #category : #accessing }
MDMainPresenter >> mooseView [
	^ mooseView
]

{ #category : #'instance creation' }
MDMainPresenter >> openDefault [
	self loadModelToStudy.
	self populateListView.
	self openWithSpec
]

{ #category : #'instance creation' }
MDMainPresenter >> populateListView [
	^ mooseView items: guiModel mooseModelSummary
]

{ #category : #'event testing' }
MDMainPresenter >> simulateDoubleClick [
	^mooseView doubleClick: mooseView doubleClickAction
]

{ #category : #api }
MDMainPresenter >> title [
^'Metric DashBoard'
]
