"
I query models
"
Class {
	#name : #MDQuery,
	#superclass : #Object,
	#instVars : [
		'masterModel'
	],
	#category : #'MooseDashboard-Query'
}

{ #category : #accessing }
MDQuery >> displayName [
	self subclassResponsibility 
]

{ #category : #accessing }
MDQuery >> entities [
	self subclassResponsibility 
]

{ #category : #accessing }
MDQuery >> master: aGuiModel [
	masterModel := aGuiModel 
]
