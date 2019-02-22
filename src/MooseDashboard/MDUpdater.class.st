Class {
	#name : #MDUpdater,
	#superclass : #Object,
	#instVars : [
		'averageSystemClassesTightCohesion',
		'averageclassePackageTightCohesion',
		'currentClassCohesion'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #accessing }
MDUpdater >> averageSystemClassesTightCohesion [
	^ averageSystemClassesTightCohesion
]

{ #category : #accessing }
MDUpdater >> averageSystemClassesTightCohesion: anObject [
	averageSystemClassesTightCohesion := anObject
]

{ #category : #accessing }
MDUpdater >> averageclassePackageTightCohesion [
	^ averageclassePackageTightCohesion
]

{ #category : #accessing }
MDUpdater >> averageclassePackageTightCohesion: anObject [
	averageclassePackageTightCohesion := anObject
]

{ #category : #accessing }
MDUpdater >> currentClassCohesion [
	^ currentClassCohesion
]

{ #category : #accessing }
MDUpdater >> currentClassCohesion: anObject [
	currentClassCohesion := anObject
]
