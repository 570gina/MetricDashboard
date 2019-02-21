Class {
	#name : #MDTest,
	#superclass : #TestCase,
	#instVars : [
		'rootCurrent',
		'presenter'
	],
	#category : #'MetricDashboard-Test'
}

{ #category : #'testing-utilities' }
MDTest >> createTestingMSE [
	| model importer package |
	model := MooseModel new.
	importer := MoosePharoImporterTask new model: model.
	importer factory: SmalltalkCompatibilityMetamodelFactory.
	importer
		importingContext:
			(MooseImportingContext new
				mergeClassAndMetaclass;
				importClass;
				importPackage;
				importInheritance;
				yourself).
	package := MCPackage named: 'TestMokePackage'.
	importer addFromPackageNamed: package name;
	 run.
	model name: 'TestMokePackage'.
	^ model
]

{ #category : #'testing-utilities' }
MDTest >> createTestingModel [
	| maClass |
	#('ModelClass1' 'ModelClass2' 'ModelClass3' 'ModelClass7' 'ModelClass4' 'ModelClass5' 'ModelClass6')
		do: [ :each | 
			Object
				subclass: each
				instanceVariableNames: ''
				classVariableNames: ''
				package: 'TestMokePackage' ].
	maClass := Object
		subclass: 'MVSTestingClass'
		instanceVariableNames: 'inst1 inst2'
		classVariableNames: ''
		package: 'TestMokePackage'.
	(RBCreateAccessorsForVariableRefactoring
		variable: 'inst1'
		class: maClass
		classVariable: false) execute.
	(RBCreateAccessorsForVariableRefactoring
		variable: 'inst2'
		class: maClass
		classVariable: false) execute.
	maClass
		subclass: 'MVSSubTestingClass'
		instanceVariableNames: 'inst3 inst4'
		classVariableNames: ''
		package: 'TestMokePackage'
]

{ #category : #running }
MDTest >> setUp [
	super setUp.
	self createTestingModel.
	rootCurrent := MooseModel root.
	MooseModel resetRoot.
	MooseModel root add: self createTestingMSE.
	presenter := MDPresenter new.
	presenter listView items: MooseModel root last mvsGroupEntitycache
]

{ #category : #running }
MDTest >> tearDown [
	MooseModel resetRoot.
	MooseModel root addAll: rootCurrent.
	MVSMainPresenter closeOfSelfWindowOpen.
	(MCPackage named: 'TestMokePackage') unload.
	presenter := nil.
	super tearDown
]

{ #category : #tests }
MDTest >> testStudyModelShouldNotBeNilIfDoubleClick [
	presenter listView setSelectedItem: presenter listView listItems first.
	presenter listView selectedItem.
	presenter simulateDoubleClick.
	self deny: presenter model studyModel isNil
]
