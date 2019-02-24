Class {
	#name : #MDTest,
	#superclass : #TestCase,
	#instVars : [
		'rootCurrent',
		'presenter'
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
	#('TestClass2' 'TestClass3' 'ModelClass4')
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
	presenter := MDPresenter new.
	presenter mooseView items: {rootCurrent allModelClasses}
]

{ #category : #tests }
MDTest >> testMDMetricCyclomaticComplexity [
	| metric classes |
	classes := rootCurrent allModelClasses.
	classes
		sort: [ :a :b | a cyclomaticComplexity > b cyclomaticComplexity ].
	metric := MDMetricCyclomaticComplexity new.
	self assert: (metric aggregateMetricFor: classes) equals: 3.5.
	self
		assert: (metric aggregateMetricFor: (classes copyFrom: 2 to: classes size))
		equals: 2
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
	presenter mooseView setSelectedItem: presenter mooseView listItems first.
	presenter mooseView selectedItem.
	presenter simulateDoubleClick.
	self deny: presenter model focusedEntities isNil
]
