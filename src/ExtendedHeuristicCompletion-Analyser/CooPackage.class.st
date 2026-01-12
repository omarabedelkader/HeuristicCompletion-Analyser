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

{ #category : 'analyzing' }
CooPackage class >> runForPackageNames: packageNames [

	| rows totClasses totDefined totMethods totInternalRatio internalUserCount totExternalRefs  totCompletionVocab totVocabInternalRatio totVocabExternalRatio totAmbiguity totEntropy |
	rows := packageNames collect: [ :name |
			        | pkg analyser internalRatio internalCount externalCount completionVocab vocabInternalRatio vocabExternalRatio ambiguity entropy |
			        pkg := PackageOrganizer default packageNamed: name.
			        pkg
				        ifNil: [
						        Transcript
							        show: 'Package ' , name , ' is not loaded.';
							        cr.
						        {
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
							        0.0 } ]
				        ifNotNil: [
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
						        {
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
							        entropy } ] ].

	totClasses := rows inject: 0 into: [ :sum :r | sum + (r at: 2) ].
	totDefined := rows inject: 0 into: [ :sum :r | sum + (r at: 3) ].
	totMethods := rows inject: 0 into: [ :sum :r | sum + (r at: 4) ].
	totInternalRatio := rows inject: 0.0 into: [ :sum :r | sum + (r at: 5) ].
	internalUserCount := rows inject: 0 into: [ :sum :r | sum + (r at: 6) ].
	totExternalRefs := rows inject: 0 into: [ :sum :r | sum + (r at: 7) ].
	totCompletionVocab := rows inject: 0 into: [ :sum :r | sum + (r at: 8) ].
	totVocabInternalRatio := rows inject: 0.0 into: [ :sum :r | sum + (r at: 9) ].
	totVocabExternalRatio := rows inject: 0.0 into: [ :sum :r | sum + (r at: 10) ].
	totAmbiguity := rows inject: 0.0 into: [ :sum :r | sum + (r at: 11) ].
	totEntropy := rows inject: 0.0 into: [ :sum :r | sum + (r at: 12) ].

	rows := rows copyWith: {
			        'TOTAL'.
			        totClasses.
			        totDefined.
			        totMethods.
			        (totInternalRatio / packageNames size asFloat).
			        internalUserCount.
			        totExternalRefs.
			        totCompletionVocab.
			        (totVocabInternalRatio / packageNames size asFloat).
			        (totVocabExternalRatio / packageNames size asFloat).
			        (totAmbiguity / packageNames size asFloat).
			        (totEntropy / packageNames size asFloat) }.
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
