Class {
	#name : #MDTest,
	#superclass : #TestCase,
	#instVars : [
		'rootCurrent',
		'presenter',
		'mostComplexClass'
	],
	#category : #'MooseDashboard-Tests'
}

{ #category : #running }
MDTest >> createFamix: aClass named: aString owner: ownerBlock [
	| fmx |
	fmx := aClass new
		name: aString;
		isStub: false ;
		mooseModel: rootCurrent;
		yourself.
	ownerBlock value: fmx.
	^ fmx
]

{ #category : #running }
MDTest >> createTestingModel [
	| pckg clazz mth |
	rootCurrent := MooseModel new
		name: ' testmodel';
		yourself.
	pckg := self
		createFamix: FAMIXPackage
		named: 'TestMokePackage'
		owner: [ :x |  ].
	clazz := self
		createFamix: FAMIXClass
		named: 'TestClass1'
		owner: [ :c | c parentPackage: pckg ].
	#('TestClass2' 'TestClass3' 'ModelClass4' 'TestClass4')
		do: [ :each | 
			| sub |
			sub := self
				createFamix: FAMIXClass
				named: each
				owner: [ :c | c parentPackage: pckg ].
			self inherit: sub from: clazz ].
	mth := self
		createFamix: FAMIXMethod
		named: 'testMthd1_1'
		owner: [ :m | m parentType: clazz ].
	mth
		cyclomaticComplexity: 8;
		numberOfLinesOfCode: 2.
	mostComplexClass := clazz.
	clazz := rootCurrent entityNamed: 'TestClass3'.
	mth := self
		createFamix: FAMIXMethod
		named: 'testMthd3_1'
		owner: [ :m | m parentType: clazz ].
	mth
		cyclomaticComplexity: 6;
		numberOfLinesOfCode: 4
]

{ #category : #running }
MDTest >> inherit: sub from: supr [
	| inh |
	inh := FAMIXInheritance new
		mooseModel: rootCurrent;
		yourself.
	sub addSuperInheritance: inh.
	supr addSubInheritance: inh
]

{ #category : #running }
MDTest >> setUp [
	super setUp.
	self createTestingModel.
	presenter := MDMainPresenter new.
	presenter mooseView items: {rootCurrent allModelClasses}
]

{ #category : #tests }
MDTest >> test20percentBigClass [
	| query context |
	context := MDGUIModel new
		focusedEntities: rootCurrent allModelClasses.
	query := MDQueryMetricThreshold new
		threshold: 20 percent;
		master: context.
	self
		assert: (query firstEntitiesFor: #numberOfLinesOfCode) size
		equals: 1
]

{ #category : #tests }
MDTest >> test20percentBigClassLOCShouldBe4 [
		| query context result |
	context := MDGUIModel new
		focusedEntities: rootCurrent allModelClasses.
	query := MDQueryMetricThreshold new
		threshold: 20 percent;
		master: context.
	result := query firstEntitiesFor: #numberOfLinesOfCode.

	self assert: (MDMetricLOC new aggregateMetricFor: result) equals: 4
]

{ #category : #tests }
MDTest >> test20percentageOfComplexeClasses [
	| query context complexeClasses |
	context := MDGUIModel new
		focusedEntities: rootCurrent allModelClasses.
	query := MDQueryMetricThreshold new
		threshold: 20 percent;
		master: context.
	complexeClasses := query firstEntitiesFor: #cyclomaticComplexity.
	self assert: complexeClasses size equals: 1.
	self assert: complexeClasses first equals: mostComplexClass
]

{ #category : #tests }
MDTest >> testDoubleClickOnPackageShouldReturnTestModelClasses [
	presenter mooseView items: rootCurrent allPackages.
	presenter mooseView setSelectedItem: rootCurrent allPackages first.
	presenter simulateDoubleClick.
	presenter model focusedEntities.
	self
		assert:
			(rootCurrent allModelClasses asOrderedCollection
				sort: [ :a :b | a name <= b name ])
		equals: (presenter model focusedEntities sort: [ :a :b | a name <= b name ])
]

{ #category : #tests }
MDTest >> testMDMetricCyclomaticComplexity [
	| metric classes |
	classes := rootCurrent allModelClasses.
	classes
		sort: [ :a :b | a cyclomaticComplexity > b cyclomaticComplexity ].
	metric := MDMetricCyclomaticComplexity new.
	self assert: (metric aggregateMetricFor: classes) equals: 2.8.
	self
		assert: (metric aggregateMetricFor: (classes copyFrom: 2 to: classes size))
		equals: 1.5
]

{ #category : #tests }
MDTest >> testMDMetricLOC [
	| metric |
	metric := MDMetricLOC new.
	self
		assert: (metric aggregateMetricFor: rootCurrent allModelClasses)
		equals: 6
]

{ #category : #tests }
MDTest >> testStudyModelShouldNotBeNilIfDoubleClick [
	presenter mooseView
		setSelectedItem: presenter mooseView listItems first.
	presenter mooseView selectedItem.
	presenter simulateDoubleClick.
	self deny: presenter model focusedEntities isNil
]
