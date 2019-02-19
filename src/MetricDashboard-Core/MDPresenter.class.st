Class {
	#name : #MDPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'classCohesionItem',
		'systemCohesionItem',
		'packageCohesionItem',
		'emptyButton'
	],
	#category : #'MetricDashboard-Core'
}

{ #category : #specs }
MDPresenter class >> defaultSpec [
	^ SpecLayout composed
		add: #systemCohesionItem origin: 0 @ 0 corner: 0.4 @ 0.25;
		add: #packageCohesionItem origin: 0.5 @ 0 corner: 0.9 @ 0.25;
		add: #classCohesionItem origin: 0 @ 0.35 corner: 0.4 @ 0.60;
		add: #classCohesionItem origin: 0.5 @ 0.35 corner: 0.9 @ 0.60;
		add: #classCohesionItem origin: 0 @ 0.75 corner: 0.4 @ 1;
		yourself
]

{ #category : #specs }
MDPresenter class >> runMe [
	<script>
	self new openWithSpec
]

{ #category : #accessing }
MDPresenter >> classCohesionItem [
	^ classCohesionItem
]

{ #category : #accessing }
MDPresenter >> classCohesionItem: anObject [
	classCohesionItem := anObject
]

{ #category : #accessing }
MDPresenter >> emptyButton [
	^ emptyButton
]

{ #category : #initialization }
MDPresenter >> initializeWidgets [
	classCohesionItem := self newButton
	label: 'classCohesionItem'.
	systemCohesionItem := self newButton
	label: 'systemCohesionItem'.
	packageCohesionItem := self newButton
	label:'packageCohesionItem'.
	emptyButton := self newButton
	
]

{ #category : #accessing }
MDPresenter >> packageCohesionItem [
	^ packageCohesionItem
]

{ #category : #accessing }
MDPresenter >> systemCohesionItem [
	^ systemCohesionItem
]

{ #category : #api }
MDPresenter >> title [
^'Metric DashBoard'
]
