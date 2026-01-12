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

{ #category : 'as yet unclassified' }
PackageAnalyser class >> analysisRowForPackageName: name [

	| pkg analyser internalRatio internalCount externalCount completionVocab vocabInternalRatio vocabExternalRatio ambiguity entropy |
	pkg := PackageOrganizer default packageNamed: name.
	pkg
		ifNil: [
			Transcript
				show: 'Package ' , name , ' is not loaded.';
				cr.
			^ {
				  name.
				  0.
				  0.
				  0.
				  0.0.
				  0.
				  0.
				  0.
				  0.0.
				  0.0.
				  0.0.
				  0.0 } ].
	analyser := PackageAnalyser new.
	analyser runAnalysisForPackage: pkg.
	internalRatio := analyser internalUserRatio.
	internalCount := analyser internalUserCount.
	externalCount := analyser externalReferences size.
	completionVocab := analyser completionVocabularySize.
	vocabInternalRatio := analyser completionVocabularyInternalRatio.
	vocabExternalRatio := analyser completionVocabularyExternalRatio.
	ambiguity := analyser ambiguity.
	entropy := analyser completionEntropy.
	^ {
		  name.
		  pkg classes size.
		  pkg definedClasses size.
		  pkg methods size.
		  internalRatio.
		  internalCount.
		  externalCount.
		  completionVocab.
		  vocabInternalRatio.
		  vocabExternalRatio.
		  ambiguity.
		  entropy }
]

{ #category : 'as yet unclassified' }
PackageAnalyser class >> packageGroupNameFor: packageName [

	| base isTest |
	base := (packageName substrings: '-') ifNotEmpty: [ :parts | parts first ] ifEmpty: [ packageName ].
	isTest := packageName endsWith: 'Tests'.
	^ isTest
		  ifTrue: [ base , '-Tests' ]
		  ifFalse: [ base ]
]

{ #category : 'analyzing' }
PackageAnalyser class >> runForPackageNames: packageNames [

| rows groups allPackageRows totClasses totDefined totMethods totInternalRatio internalUserCount totExternalRefs totCompletionVocab totVocabInternalRatio totVocabExternalRatio totAmbiguity totEntropy |
	groups := Dictionary new.
	packageNames do: [ :name |
		| groupName |
		groupName := self packageGroupNameFor: name.
		(groups at: groupName ifAbsentPut: [ OrderedCollection new ]) add: name ].

	allPackageRows := OrderedCollection new.
	rows := groups keys asSortedCollection collect: [ :groupName |
		| groupRows groupCount groupClasses groupDefined groupMethods groupInternalRatio groupInternalCount groupExternalRefs groupCompletionVocab groupVocabInternalRatio groupVocabExternalRatio groupAmbiguity groupEntropy |
		groupRows := (groups at: groupName) collect: [ :name |
			| row |
			row := self analysisRowForPackageName: name.
			allPackageRows add: row.
			row ].
		groupCount := groupRows size.
		groupClasses := groupRows inject: 0 into: [ :sum :r | sum + (r at: 2) ].
		groupDefined := groupRows inject: 0 into: [ :sum :r | sum + (r at: 3) ].
		groupMethods := groupRows inject: 0 into: [ :sum :r | sum + (r at: 4) ].
		groupInternalRatio := groupRows inject: 0.0 into: [ :sum :r | sum + (r at: 5) ].
		groupInternalCount := groupRows inject: 0 into: [ :sum :r | sum + (r at: 6) ].
		groupExternalRefs := groupRows inject: 0 into: [ :sum :r | sum + (r at: 7) ].
		groupCompletionVocab := groupRows inject: 0 into: [ :sum :r | sum + (r at: 8) ].
		groupVocabInternalRatio := groupRows inject: 0.0 into: [ :sum :r | sum + (r at: 9) ].
		groupVocabExternalRatio := groupRows inject: 0.0 into: [ :sum :r | sum + (r at: 10) ].
		groupAmbiguity := groupRows inject: 0.0 into: [ :sum :r | sum + (r at: 11) ].
		groupEntropy := groupRows inject: 0.0 into: [ :sum :r | sum + (r at: 12) ].
		{
			groupName.
			groupClasses.
			groupDefined.
			groupMethods.
			(groupInternalRatio / groupCount asFloat).
			groupInternalCount.
			groupExternalRefs.
			groupCompletionVocab.
			(groupVocabInternalRatio / groupCount asFloat).
			(groupVocabExternalRatio / groupCount asFloat).
			(groupAmbiguity / groupCount asFloat).
			(groupEntropy / groupCount asFloat) } ].
		
		
		
		
	totClasses := allPackageRows inject: 0 into: [ :sum :r | sum + (r at: 2) ].
	totDefined := allPackageRows inject: 0 into: [ :sum :r | sum + (r at: 3) ].
	totMethods := allPackageRows inject: 0 into: [ :sum :r | sum + (r at: 4) ].
	totInternalRatio := allPackageRows inject: 0.0 into: [ :sum :r | sum + (r at: 5) ].
	internalUserCount := allPackageRows inject: 0 into: [ :sum :r | sum + (r at: 6) ].
	totExternalRefs := allPackageRows inject: 0 into: [ :sum :r | sum + (r at: 7) ].
	totCompletionVocab := allPackageRows inject: 0 into: [ :sum :r | sum + (r at: 8) ].
	totVocabInternalRatio := allPackageRows inject: 0.0 into: [ :sum :r | sum + (r at: 9) ].
	totVocabExternalRatio := allPackageRows inject: 0.0 into: [ :sum :r | sum + (r at: 10) ].
	totAmbiguity := allPackageRows inject: 0.0 into: [ :sum :r | sum + (r at: 11) ].
	totEntropy := allPackageRows inject: 0.0 into: [ :sum :r | sum + (r at: 12) ].
	
	
	rows := rows copyWith: {
			        'TOTAL'.
			        totClasses.
			        totDefined.
			        totMethods.
			        (totInternalRatio / allPackageRows size asFloat).
			        internalUserCount.
			        totExternalRefs.
			        totCompletionVocab.
			        (totVocabInternalRatio / allPackageRows size asFloat).
			        (totVocabExternalRatio / allPackageRows size asFloat).
			        (totAmbiguity / allPackageRows size asFloat).
			        (totEntropy / allPackageRows size asFloat) }.
	rows := rows collect: [ :r |
			        r withIndexCollect: [ :item :index |
					        (item isNumber and: [ item isInteger not ])
						        ifTrue: [ item printShowingDecimalPlaces: 2 ]
						        ifFalse: [ item ] ] ]. "⇓ Print header first ⇓"
	Transcript
		show: '\begin{tabular}{lrrrrrrrrrrr}';
		cr;
		show: '\hline';
		cr;
		show:
			'Package & Classes & Defined & Methods & InternalRatio & InternalUsers & ExternalRefs & CompletionVocab & VocabInternalRatio & VocabExternalRatio & Ambiguity & Entropy\\';
		cr;
		show: '\hline';
		cr.
	rows do: [ :r |
			Transcript
				show: (String streamContents: [ :s |
								 r do: [ :item | s nextPutAll: item asString ] separatedBy: [ s nextPutAll: ' & ' ].
								 s nextPutAll: ' \\' ]);
				cr ].

	Transcript
		show: '\hline';
		cr;
		show: '\end{tabular}';
		cr.

	^ rows
]

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
