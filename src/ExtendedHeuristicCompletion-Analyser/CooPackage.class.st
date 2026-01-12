"
I'm an abstract class. see my subclasses
"
Class {
	#name : 'CooPackage',
	#superclass : 'PackageAnalyser',
	#category : 'ExtendedHeuristicCompletion-Analyser',
	#package : 'ExtendedHeuristicCompletion-Analyser'
}

{ #category : 'as yet unclassified' }
CooPackage class >> analysisRowForPackageName: name [

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
CooPackage class >> listClassesFor: packageNames [
    | allClassNames |
    allClassNames := packageNames
        flatCollect: [:packageName |
            (PackageOrganizer default packageNamed: packageName)
                definedClasses collect: [:eachClass | eachClass name]].
    allClassNames do: [:className |
        Transcript show: '- ',className; cr ]
]

{ #category : 'analyzing' }
CooPackage class >> listMethodsFor: packageNames [

	| allMethods |
	allMethods := packageNames flatCollect: [ :packageName |
			              (PackageOrganizer default packageNamed: packageName) definedClasses flatCollect: [ :eachClass |
				              eachClass methodDictionary keys collect: [ :eachMethod | eachClass name , ' >> ' , eachMethod asString ] ] ].
	allMethods do: [ :methodName |
			Transcript
				show: '- ' , methodName;
				cr ]
]

{ #category : 'as yet unclassified' }
CooPackage class >> packageGroupNameFor: packageName [

	| base isTest |
	base := (packageName substrings: '-') ifNotEmpty: [ :parts | parts first ] ifEmpty: [ packageName ].
	isTest := packageName endsWith: 'Tests'.
	^ isTest
		  ifTrue: [ base , '-Tests' ]
		  ifFalse: [ base ]
]

{ #category : 'analyzing' }
CooPackage class >> runForPackageNames: packageNames [

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
