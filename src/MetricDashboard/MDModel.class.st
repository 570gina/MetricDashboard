"
I'm the model 
"
Class {
	#name : #MDModel,
	#superclass : #Object,
	#instVars : [
		'projectModel',
		'studyModel'
	],
	#category : #'MetricDashboard-Core'
}

{ #category : #accessing }
MDModel >> averageSystemClassesTightCohesion [
	^ (self projectModelPragmas
		inject: 0
		into: [ :sum :each | sum + each tightClassCohesion ])
		/ self projectModelPragmas size
]

{ #category : #accessing }
MDModel >> averageclassePackageTightCohesion [

]

{ #category : #accessing }
MDModel >> currentClassCohesion [

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
MDModel >> projectModelPragmas [
	^ projectModel mvsGroupEntitycache
]

{ #category : #accessing }
MDModel >> studyModel [
	^ studyModel
]

{ #category : #accessing }
MDModel >> studyModel: anObject [
	studyModel := anObject
]

{ #category : #conversion }
MDModel >> truncateFloat: aFloat to: aValue [
	^ (aFloat truncateTo: aValue) asString
]

{ #category : #utilities }
MDModel >> updatePresenter: aPresenter [
	"| updater precision |
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
	aPresenter updateMetricPresenterWith: updater"
]
