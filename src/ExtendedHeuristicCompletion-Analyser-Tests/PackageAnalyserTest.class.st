Class {
	#name : 'PackageAnalyserTest',
	#superclass : 'TestCase',
	#category : 'ExtendedHeuristicCompletion-Analyser-Tests',
	#package : 'ExtendedHeuristicCompletion-Analyser-Tests'
}

{ #category : 'tests' }
PackageAnalyserTest >> testCompletionEntropyEmptyReferences [

	| analyser |
	analyser := PackageAnalyser new.
	analyser instVarNamed: 'referencesByClass' put: Dictionary new.

	self assert: analyser completionEntropy equals: 0.0
]

{ #category : 'tests' }
PackageAnalyserTest >> testCompletionVocabularyRatios [

	| analyser |
	analyser := PackageAnalyser new.
	analyser instVarNamed: 'definedClassNames' put: (Set withAll: #( Alpha Beta )).
	analyser instVarNamed: 'referencesByClass' put: (Dictionary new
		at: #Beta put: #( 1 );
		at: #Gamma put: #( 2 3 );
		yourself).

	self assert: analyser completionVocabularySize equals: 3.
	self assert: analyser completionVocabularyInternalCount equals: 2.
	self assert: analyser completionVocabularyExternalCount equals: 1.
	self assert: analyser completionVocabularyInternalRatio equals: (2 / 3) asFloat.
	self assert: analyser completionVocabularyExternalRatio equals: (1 / 3) asFloat.
	self assert: analyser ambiguity equals: analyser completionVocabularyExternalRatio
]

{ #category : 'tests' }
PackageAnalyserTest >> testDefineClassesOfData [
	"
	| pa |
	pa := PackageAnalyser new.
	pa runAnalysisForPackage: (PackageOrganizer default packageNamed: 'ExtendedHeuristicCompletion-Analyser-Data').
	self 
		assert: pa definedClassNames asOrderedCollection 
		equals: #(#AnalyserData1 #OtherAnalyserData1 #AnalyserData2 #AnalyserData3 #OtherAnalyserData2) asOrderedCollection 
		"
]

{ #category : 'tests' }
PackageAnalyserTest >> testDefineClassesOfData2 [
	
	| pa |
	pa := PackageAnalyser new.
	pa runAnalysisForPackage: (PackageOrganizer default packageNamed: 'HeuristicCompletion-Analyser-Data2').
	self 
		assert: pa definedClassNames asOrderedCollection
		equals: #(#DifferentAnalyserData1 #DifferentAnalyserData2 #OtherAnalyserData3) asOrderedCollection 
]

{ #category : 'tests' }
PackageAnalyserTest >> testInternalUserMetrics [

	| analyser |
	analyser := PackageAnalyser new.
	analyser instVarNamed: 'definedClassNames' put: (Set withAll: #( Alpha Beta Gamma )).
	analyser instVarNamed: 'referencesByClass' put: (Dictionary new
		at: #Beta put: #( 1 );
		at: #Delta put: #( 2 );
		yourself).

	self assert: analyser internalClassReferences equals: (Set with: #Beta).
	self assert: analyser internalUserCount equals: 1.
	self assert: analyser internalUserRatio equals: (1 / 3) asFloat
]

{ #category : 'tests' }
PackageAnalyserTest >> testReferencesGroupedByDefiningPackage [

	| analyser grouped |
	analyser := PackageAnalyser new.
	analyser instVarNamed: 'referencesByClass' put: (Dictionary new
		at: #Alpha put: #( 1 );
		at: #Beta put: #( 2 3 );
		yourself).
	analyser instVarNamed: 'packagesByClass' put: (Dictionary new
		at: #Alpha put: 'AlphaPackage';
		at: #Beta put: 'BetaPackage';
		yourself).
	grouped := analyser referencesGroupedByDefiningPackage.

	self assert: (grouped includesKey: 'AlphaPackage').
	self assert: (grouped includesKey: 'BetaPackage').
	self assert: ((grouped at: 'AlphaPackage') includesKey: #Alpha).
	self assert: ((grouped at: 'BetaPackage') includesKey: #Beta)
]
