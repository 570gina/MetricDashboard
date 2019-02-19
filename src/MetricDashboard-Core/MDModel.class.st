Class {
	#name : #MDModel,
	#superclass : #Object,
	#instVars : [
		'projectModel'
	],
	#category : #'MetricDashboard-Core'
}

{ #category : #'as yet unclassified' }
MDModel >> loadProjectFromMSEFile [
MVSMSELoader importModel.
projectModel := MooseModel root last.

]

{ #category : #accessing }
MDModel >> projectModel [
	^ projectModel
]

{ #category : #accessing }
MDModel >> projectModel: anObject [
	projectModel := anObject
]

{ #category : #'as yet unclassified' }
MDModel >> projectModelClasses [
^projectModel allModelClasses 
]
