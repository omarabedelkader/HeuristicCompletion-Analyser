Class {
	#name : 'VocabularyMetricTest',
	#superclass : 'TestCase',
	#category : 'ExtendedHeuristicCompletion-Analyser-Tests',
	#package : 'ExtendedHeuristicCompletion-Analyser-Tests'
}

{ #category : 'tests' }
VocabularyMetricTest >> percent: aFraction [

	^ aFraction asFloat round: 2
]

{ #category : 'tests' }
VocabularyMetricTest >> testDefUsesRatio [

	| vm |
	vm := CooPackageMetrics new.
	vm localDefinitions: #( A B C D E F ).
	vm externalDefinitions: #( EA EB EC ED EF EG EH EI EJ EK ). "here we have only A B C that are used"
	vm localUses: #( A B C ).
	vm externalUses: #( EA EB EC ED EF ).

	self assert: vm localityDefUseRatio equals: (self percent: 3 / 6)
]

{ #category : 'tests' }
VocabularyMetricTest >> testDefinitionRatio [

	| vm |
	vm := CooPackageMetrics new.
	vm localDefinitions: #( A B C D E F ).
	vm externalDefinitions: #( EA EB EC ED EF EG EH EI EJ EK ).

	self assert: vm localityDefinitionRatio equals: (self percent: 6 / 16)
]

{ #category : 'tests' }
VocabularyMetricTest >> testFormatNumber [

	self assert: (CooPackageMetrics formatNumber: 12) equals: 12.
	self assert: (CooPackageMetrics formatNumber: 1.234) equals: '1.23'
]

{ #category : 'tests' }
VocabularyMetricTest >> testLatexEscape [

	self assert: (CooPackageMetrics latexEscape: 'A&B_#%') equals: 'A\&B\_\#\%'.
	self assert: (CooPackageMetrics latexEscape: '{x}\y') equals: '\{x\}\\y'
]

{ #category : 'tests' }
VocabularyMetricTest >> testPrinting [

	| vm |
	vm := CooPackageMetrics new.
	vm localDefinitions: #( A B C D E F ).
	vm externalDefinitions: #( EA EB EC ED EF EG EH EI EJ EK ). "here we have only A B C that are used"
	vm localUses: #( A B C ).
	vm externalUses: #( EA EB EC ED EF ).

	self assert: vm printString equals: 'locality definition ratio: 0.38 (6/16)
locality use ratio: 0.38 (3/8)
local def/use ratio: 0.5 (3/6)'
]

{ #category : 'tests' }
VocabularyMetricTest >> testRatioForZeroDenominator [

	self assert: (CooPackageMetrics ratioFor: 10 denominator: 0) equals: 0.0.
	self assert: (CooPackageMetrics ratioFor: 4 denominator: 2) equals: 2.0
]

{ #category : 'tests' }
VocabularyMetricTest >> testReferenceCountForAnalyser [

	| analyser count |
	analyser := PackageAnalyser new.
	analyser instVarNamed: 'referencesByClass' put: (Dictionary new
		at: #Alpha put: #( 1 2 );
		at: #Beta put: #( 3 );
		yourself).
	count := CooPackageMetrics referenceCountFor: #( Alpha Beta ) in: analyser.

	self assert: count equals: 3
]

{ #category : 'tests' }
VocabularyMetricTest >> testUsesRatio [

	| vm |
	vm := CooPackageMetrics new.
	vm localDefinitions: #( A B C D E F ).
	vm externalDefinitions: #( EA EB EC ED EF EG EH EI EJ EK ). "here we have only A B C that are used"
	vm localUses: #( A B C ).
	vm externalUses: #( EA EB EC ED EF ). "this measurre the ratio of local vs. global use"
	self assert: vm localityUseRatio equals: (self percent: 3 / 8)
]
