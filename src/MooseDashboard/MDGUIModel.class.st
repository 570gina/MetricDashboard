"
I'm the model of the MDPresenter
"
Class {
	#name : #MDGUIModel,
	#superclass : #Object,
	#instVars : [
		'mooseModel',
		'focusedEntities',
		'metrics',
		'subQueries'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #accessing }
MDGUIModel >> addMetric: aMetric [
	metrics add: aMetric
]

{ #category : #accessing }
MDGUIModel >> addSubQuery: aQuery [
	subQueries add: aQuery
]

{ #category : #accessing }
MDGUIModel >> focusedEntities [
	^ focusedEntities
]

{ #category : #accessing }
MDGUIModel >> focusedEntities: anObject [
	focusedEntities := anObject
]

{ #category : #initialize }
MDGUIModel >> initialize [
	super initialize.
	metrics := {MDMetricLOC new.
	MDMetricCyclomaticComplexity new.
	MDMetricLCOM3 new} asOrderedCollection.
	subQueries := {(MDQueryCore new master: self).
	(MDQueryBig new
		master: self;
		threshold: 20 percent).
	(MDQueryComplex new
		master: self;
		threshold: 20 percent)} asOrderedCollection
]

{ #category : #utilities }
MDGUIModel >> loadProjectFromMSEFile [
	MooseModel root allModels
		ifEmpty: [	MVSMSELoader importModel].
	MooseModel root ifNotEmpty: [ mooseModel := MooseModel root allModels last ]
]

{ #category : #accessing }
MDGUIModel >> metric: id [
	^ metrics at: id
]

{ #category : #accessing }
MDGUIModel >> mooseModelSummary [
	^ {mooseModel allModelPackages.
	mooseModel allModelNamespaces.
	mooseModel allModelClasses.
	mooseModel allModelMethods.
	mooseModel allModelNamespaces first}
]

{ #category : #accessing }
MDGUIModel >> subQuery: id [
	^ subQueries at: id
]
