"
I am an Analyser, responsible for analyzing how classes are defined
 and referenced within a given package. My analysis identifies which
 classes are internal versus external, how many references exist, and
 provides relevant metrics.


"
Class {
	#name : 'PackageAnalyser',
	#superclass : 'Object',
	#instVars : [
		'package',
		'scope',
		'definedClassNames',
		'referencesByClass',
		'packagesByClass'
	],
	#category : 'ExtendedHeuristicCompletion-Analyser',
	#package : 'ExtendedHeuristicCompletion-Analyser'
}

{ #category : 'initialization' }
PackageAnalyser >> allReferencedClasses [
	
	^ referencesByClass keys
]

{ #category : 'initialization' }
PackageAnalyser >> ambiguity [

	^ self completionVocabularyExternalRatio
]

{ #category : 'widget API' }
PackageAnalyser >> collectClassDefinitions [

    definedClassNames := Set newFrom: 
        (package definedClasses collect: [ :each | each name ])
]

{ #category : 'initialization' }
PackageAnalyser >> collectClassReferences [

	scope methodsDo: [ :method |
		| parseTree |
		parseTree := method parseTree.

		parseTree nodesDo: [ :node |
			(self isClassReferenceNode: node)
				ifTrue: [ self noteReferenceIn: method forClass: node name ]
		]
	]
]

{ #category : 'initialization' }
PackageAnalyser >> completionEntropy [

| counts total |
	counts := referencesByClass values collect: [ :methods | methods size ].
	counts isEmpty ifTrue: [ ^ 0.0 ].
	total := counts sum.
	total = 0 ifTrue: [ ^ 0.0 ].
	^ counts inject: 0.0 into: [ :sum :count |
		  | p |
		  p := count / total asFloat.
		  sum - (p * (p log: 2)) ]


]

{ #category : 'initialization' }
PackageAnalyser >> completionVocabulary [

	^ definedClassNames union: self externalReferences asSet
]

{ #category : 'initialization' }
PackageAnalyser >> completionVocabularyExternalCount [

	^ self externalReferences size
]

{ #category : 'initialization' }
PackageAnalyser >> completionVocabularyExternalRatio [

	| total |
	total := self completionVocabularySize.
	^ total = 0
		  ifTrue: [ 0.0 ]
		  ifFalse: [ self completionVocabularyExternalCount / total asFloat ]
]

{ #category : 'initialization' }
PackageAnalyser >> completionVocabularyInternalCount [

	^ definedClassNames size
]

{ #category : 'initialization' }
PackageAnalyser >> completionVocabularyInternalRatio [

	| total |
	total := self completionVocabularySize.
	^ total = 0
		  ifTrue: [ 0.0 ]
		  ifFalse: [ self completionVocabularyInternalCount / total asFloat ]
]

{ #category : 'initialization' }
PackageAnalyser >> completionVocabularySize [

	^ self completionVocabulary size
]

{ #category : 'initialization' }
PackageAnalyser >> definedClassNames [

	^ definedClassNames
]

{ #category : 'initialization' }
PackageAnalyser >> externalReferences [

    ^ (self allReferencedClasses) select: [ :className |
        self isClassExternal: className ]
]

{ #category : 'initialization' }
PackageAnalyser >> initialize [

	super initialize.
	definedClassNames := Set new.
	referencesByClass := Dictionary new.
	packagesByClass   := Dictionary new.
]

{ #category : 'initialization' }
PackageAnalyser >> internalClassReferences [

	^ definedClassNames intersection: self allReferencedClasses
]

{ #category : 'initialization' }
PackageAnalyser >> internalUserCount [

	^ self internalClassReferences size
]

{ #category : 'initialization' }
PackageAnalyser >> internalUserRatio [

	^ definedClassNames isEmpty
		ifTrue: [ 0.0 ]
		ifFalse: [ (self internalUserCount / definedClassNames size) asFloat ]
]

{ #category : 'initialization' }
PackageAnalyser >> isClassExternal: aClassName [

    ^ (definedClassNames includes: aClassName) not
]

{ #category : 'initialization' }
PackageAnalyser >> isClassReferenceNode: aNode [

	^ aNode isVariable
		and: [ aNode name first isUppercase ]
]

{ #category : 'initialization' }
PackageAnalyser >> noteReferenceIn: aCompiledMethod forClass: aClassName [

	(referencesByClass
		at: aClassName
		ifAbsentPut: [ OrderedCollection new ]) add: aCompiledMethod
]

{ #category : 'initialization' }
PackageAnalyser >> referencesForClass: aClassName [

	^ referencesByClass
		at: aClassName
		ifAbsent: [ #() ]
]

{ #category : 'widget API' }
PackageAnalyser >> referencesGroupedByDefiningPackage [

    | dict |
    dict := Dictionary new.
    referencesByClass keysAndValuesDo: [ :className :methods |
        | pkgName subDict |
        pkgName := (packagesByClass at: className ifAbsent: [ 'UnknownPackage' ]) asString.
        subDict := dict at: pkgName ifAbsentPut: [ Dictionary new ].
        subDict at: className put: methods
    ].
    ^ dict
]

{ #category : 'initialization' }
PackageAnalyser >> runAnalysisForPackage: aPackage [

	package := aPackage.
	scope := CoBenchmarkPackage on: aPackage.
	
	self collectClassDefinitions.
	self collectClassReferences.
]
