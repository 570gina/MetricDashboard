"
I'm the model 
"
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
	^ (self projectModelClasses
		inject: 0
		into: [ :sum :each | sum + each tightClassCohesion ])
		/ self projectModelClasses size
]

{ #category : #accessing }
MDModel >> averageclassePackageTightCohesion [
|packageClasses|
packageClasses := currentClass typeContainer classes.
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

{ #category : #accessing }
MDModel >> currentClassCohesion [
^ currentClass tightClassCohesion
]

{ #category : #utilities }
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

{ #category : #utilities }
MDModel >> projectModelClasses [
	^ projectModel allModelClasses
]

{ #category : #conversion }
MDModel >> truncateFloat: aFloat to: aValue [
	^ (aFloat truncateTo: aValue) asString
]

{ #category : #utilities }
MDModel >> updatePresenter: aPresenter [
	| updater precision |
	precision := 0.01.
	updater := MDUpdater new
		currentClassCohesion:
			'Class TCC: '
				, (self truncateFloat: self currentClassCohesion to: precision);
		averageSystemClassesTightCohesion:
			'AVG Sys TCC: '
				,
					(self
						truncateFloat: self averageSystemClassesTightCohesion
						to: precision);
		averageclassePackageTightCohesion:
			'AVG Pkg TCC: '
				,
					(self
						truncateFloat: self averageclassePackageTightCohesion
						to: precision).
	aPresenter updateMetricPresenterWith: updater
]
