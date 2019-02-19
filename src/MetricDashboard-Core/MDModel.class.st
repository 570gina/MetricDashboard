Class {
	#name : #MDModel,
	#superclass : #Object,
	#instVars : [
		'projectModel',
		'currentClass'
	],
	#category : #'MetricDashboard-Core'
}

{ #category : #accessing }
MDModel >> averageSystemClassesTightCohesion [
^(self projectModelClasses  inject: 0 into:[:sum :each| sum+each tightClassCohesion ] )/self size
]

{ #category : #accessing }
MDModel >> averageclassePackageTightCohesion [
|packageClasses|
packageClasses := currentClass parentType allClasses.
	^ ( packageClasses 
		inject: 0
		into: [ :sum :each | sum + each tightClassCohesion ]) / packageClasses size
]

{ #category : #accessing }
MDModel >> currentClass [
	^ currentClass
]

{ #category : #accessing }
MDModel >> currentClass: anObject [
	currentClass := anObject
]

{ #category : #'as yet unclassified' }
MDModel >> loadProjectFromMSEFile [
	MVSMSELoader importModel.
	projectModel := MooseModel root last
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

{ #category : #'as yet unclassified' }
MDModel >> updatePresenter:aPresenter [

]
