"
Some class
"
Class {
	#name : 'CooPackageMetrics',
	#superclass : 'CooPackage',
	#instVars : [
		'packagePatterns',
		'matchedPackages',
		'localDefinitions',
		'externalDefinitions',
		'localUses',
		'externalUses',
		'originalLocalDefinitions',
		'originalExternalDefinitions',
		'originalLocalUses',
		'originalExternalUses'
	],
	#category : 'ExtendedHeuristicCompletion-Analyser',
	#package : 'ExtendedHeuristicCompletion-Analyser'
}

{ #category : 'examples' }
CooPackageMetrics class >> iceberg [

	<script>
	^ (self runForPackageNames:
		   { 'Iceberg'. 'Iceberg-ArchitecturalRules'. 'Iceberg-Libgit'. 'Iceberg-Libgit-Filetree'. 'Iceberg-Libgit-Tonel'.
		   'Iceberg-Memory'. 'Iceberg-Metacello-Integration'. 'Iceberg-Playground-Plugin-Gist'. 'Iceberg-Plugin'. 'Iceberg-Plugin-Github'.
		   'Iceberg-Plugin-Metacello'. 'Iceberg-Plugin-Migration'. 'Iceberg-Plugin-Pharo'. 'Iceberg-TipUI'. 'Iceberg-TipUI-SnapShotBrowser' })
		  inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> icebergTest [

	<script>
	^ (self runForPackageNames:
		   { 'Iceberg-Plugin-Migration-Tests'. 'Iceberg-Tests'. 'Iceberg-Tests-MetacelloIntegration'.
		   'Iceberg-TipUI-SnapshotBrowser-Tests'. 'Iceberg-UI-Tests' }) inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> moose [

	<script>
	^ (self runForPackageNames: { 'Moose-Blueprint-Invocations-Models'. 'Moose-Blueprint-Models'. 'Moose-Blueprint-Visualization-Models'.
		   'Moose-Configuration'. 'Moose-Core'. 'Moose-Core-Generator'. 'Moose-Importers'. 'Moose-Query'. 'Moose-Query-Extensions'.
		   'Moose-SmalltalkImporter'. 'MooseIDE-WelcomeBrowser'. 'MooseIDE-Analysis'. 'MooseIDE-AttributedText'.
		   'MooseIDE-ButterflyMap'. 'MooseIDE-ClassBlueprint'. 'MooseIDE-CoUsageMap'. 'MooseIDE-Core'. 'MooseIDE-Core-Reporter'.
		   'MooseIDE-CriticBrowser'. 'MooseIDE-Dependency'. 'MooseIDE-Duplication'. 'MooseIDE-Export'. 'MooseIDE-Famix'. 'MooseIDE-LayerVisualization'.
		   'MooseIDE-Meta'. 'MooseIDE-NewTools'. 'MooseIDE-QueriesBrowser'. 'MooseIDE-QueriesDashboard'. 'MooseIDE-Spotter'.
		   'MooseIDE-Tagging'. 'MooseIDE-Visualization' }) inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> mooseTests [

	<script>
	^ (self runForPackageNames:
		   { 'Moose-Blueprint-Models-Tests'. 'Moose-Core-Tests'. 'Moose-Core-Tests-Entities'. 'Moose-Importers-Tests'.
		   'Moose-Query-Test'. 'Moose-SmalltalkImporter-Core-Tests'. 'Moose-SmalltalkImporter-KGB-Tests'.
		   'Moose-SmalltalkImporter-LAN-Tests'. 'Moose-TestResources-KGB-P10InteractedReferee'.
		   'Moose-TestResources-KGB-P11FullReferee'. 'Moose-TestResources-KGB-P12FullReferencer'.
		   'Moose-TestResources-KGB-P13FullReferencer'. 'Moose-TestResources-KGB-P14FullReferee'.
		   'Moose-TestResources-KGB-P1FullReferencer'. 'Moose-TestResources-KGB-P2InteractedReferencerReferee'.
		   'Moose-TestResources-KGB-P3InteractedReferencer'. 'Moose-TestResources-KGB-P4FullInteracted'.
		   'Moose-TestResources-KGB-P5FullReferee'. 'Moose-TestResources-KGB-P6InteractedReferee'.
		   'Moose-TestResources-KGB-P7ReferencerReferee'. 'Moose-TestResources-KGB-P8FullReferencer'.
		   'Moose-TestResources-KGB-P9FullReferencer'. 'Moose-TestResources-KGB-PExtensions'. 'Moose-TestResources-LAN'.
		   'Moose-TestResources-LCOM'. 'Moose-TestResources-PackageBlueprint-P1'. 'Moose-TestResources-PackageBlueprint-P2'.
		   'Moose-TestResources-PackageBlueprint-P3'. 'Moose-TestResources-PackageBlueprint-P4'.
		   'Moose-TestResources-Reference-Core'. 'Moose-TestResources-Reference-External'. 'Moose-TestResources-Reference-PackageOne'.
		   'Moose-TestResources-Reference-PackageTwo'. 'MooseIDE-ButterflyMap-Tests'. 'MooseIDE-CoUsageMap-Tests'.
		   'MooseIDE-CriticBrowser-Tests'. 'MooseIDE-NewTools-Tests'. 'MooseIDE-QueriesBrowser-Tests'. 'MooseIDE-Spotter-Tests'.
		   'MooseIDE-Tagging-Tests'. 'MooseIDE-Tests' }) inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> nec [

	<script>
	^ (self runForPackageNames: {'NECompletion' })
		  inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> necTests [

	<script>
	^ (self runForPackageNames: {'NECompletion-Tests' })
		  inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> roassal [

	<script>
	^ (self runForPackageNames:
		   { 'Roassal'. 'Roassal-Animation'. 'Roassal-BaselineMap'. 'Roassal-Builders'. 'Roassal-Chart'. 'Roassal-Chart-Examples'.
		   'Roassal-Class-Examples'. 'Roassal-Colors'. 'Roassal-DSM'. 'Roassal-Event'. 'Roassal-Examples'. 'Roassal-Experimental'.
		   'Roassal-Exporters'. 'Roassal-Exporters-Examples'. 'Roassal-FlameGraph-Examples'. 'Roassal-Inspector'. 'Roassal-Interaction'.
		   'Roassal-LayoutStudio'. 'Roassal-Layouts'. 'Roassal-Layouts-Util'. 'Roassal-Legend'. 'Roassal-Legend-Examples'.
		   'Roassal-Menu'. 'Roassal-Mondrian'. 'Roassal-Pie'. 'Roassal-Pie-Examples'. 'Roassal-SVG'. 'Roassal-SVG-Examples'.
		   'Roassal-Shapes'. 'Roassal-Spec'. 'Roassal-Spec-Examples'. 'Roassal-Spec-Morphic'. 'Roassal-Sunburst'. 'Roassal-Sunburst-Examples'.
		   'Roassal-TreeMap'. 'Roassal-TreeMap-Examples'. 'Roassal-UML'. 'Roassal-UML-Calypso'. 'Roassal-UML-Examples' }) inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> roassalTests [

	<script>
	^ (self runForPackageNames:
		   { 'Roassal-Animation-Tests'. 'Roassal-BaselineMap-Tests'. 'Roassal-Chart-Tests'. 'Roassal-Exporters-Tests'.
		   'Roassal-Global-Tests'. 'Roassal-Inspector-Tests'. 'Roassal-Interaction-Tests'. 'Roassal-LayoutStudio-Tests'.
		   'Roassal-Layouts-Tests'. 'Roassal-Shapes-Tests'. 'Roassal-Spec-Tests'. 'Roassal-SVG-Tests'. 'Roassal-UML-Tests' }) inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> runAllForPackageNames: packageNames [
	| rows reporter |
	rows := super runForPackageNames: packageNames.
	reporter := self new.
	reporter packagePatterns: packageNames.
	reporter computeMatchedPackages.
	^ Dictionary new
		at: #packageMetrics put: rows;
		at: #vocReporter put: reporter gatherAnalysis;
		yourself
]

{ #category : 'examples' }
CooPackageMetrics class >> runAllOnPatterns: patternList [

	"Creates a CooPackageMetrics, sets the patterns, computes the matched packages,
	collects the results in a Dictionary, and returns it."

	| reporter results |
	reporter := self new.
	reporter packagePatterns: patternList.
	reporter computeMatchedPackages.
	results := reporter gatherAnalysis.
	^ results
]

{ #category : 'examples' }
CooPackageMetrics class >> seaside [

	<script>
	^ (self runForPackageNames:
		   { 'Seaside-Ajaxifier-Core'. 'Seaside-Canvas'. 'Seaside-Component'. 'Seaside-Continuation'. 'Seaside-Core'. 'Seaside-Development'.
		   'Seaside-Email'. 'Seaside-Environment'. 'Seaside-Examples'. 'Seaside-Flow'. 'Seaside-JSON-Core'. 'Seaside-Pharo-Canvas'.
		   'Seaside-Pharo-Continuation'. 'Seaside-Pharo-Core'. 'Seaside-Pharo-Development'. 'Seaside-Pharo-Email'. 'Seaside-Pharo-Environment'.
		   'Seaside-Pharo-Flow'. 'Seaside-Pharo-JSON-Core'. 'Seaside-Pharo-Tools-Web'. 'Seaside-Pharo-Welcome'. 'Seaside-REST-Core'.
		   'Seaside-RenderLoop'. 'Seaside-Session'. 'Seaside-Tools-Core'. 'Seaside-Tools-Web'. 'Seaside-Welcome'. 'Seaside-Widgets'.
		   'Seaside-Zinc-Core'. 'Seaside-Zinc-Pharo' }) inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> seasideTests [

	<script>
	^ (self runForPackageNames:
		   { 'Seaside-Tests-Canvas'. 'Seaside-Tests-Component'. 'Seaside-Tests-Core'. 'Seaside-Tests-Environment'.
		   'Seaside-Tests-Flow'. 'Seaside-Tests-Functional'. 'Seaside-Tests-Pharo-Canvas'. 'Seaside-Tests-Pharo-Continuation'.
		   'Seaside-Tests-Pharo-Core'. 'Seaside-Tests-Pharo-Functional'. 'Seaside-Tests-RenderLoop'. 'Seaside-Tests-Session' }) inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> spec [

	<script>
	^ self runAllForPackageNames:
		  { 'Spec2-Adapters-Morphic'. 'Spec2-Adapters-Morphic-ListView'. 'Spec2-Adapters-Stub'. 'Spec2-Code'. 'Spec2-Code-Commands'.
		  'Spec2-Code-Diff'. 'Spec2-Code-Diff-Morphic'. 'Spec2-Code-Morphic'. 'Spec2-CommandLine'. 'Spec2-Commander2'. 'Spec2-Commands'.
		  'Spec2-CommonWidgets'. 'Spec2-Core'. 'Spec2-Dialogs'. 'Spec2-Examples'. 'Spec2-Interactions'. 'Spec2-Layout'. 'Spec2-ListView'.
		  'Spec2-Microdown'. 'Spec2-Morphic'. 'Spec2-Morphic-Examples'. 'Spec2-Transmission' }
]

{ #category : 'examples' }
CooPackageMetrics class >> specTests [

	<script>
	^ (self runForPackageNames:
		   { 'Spec2-Adapters-Morphic-Tests'. 'Spec2-Adapters-Stub'. 'Spec2-Backend-Tests'. 'Spec2-Code-Backend-Tests'.
		   'Spec2-Code-Diff-Tests'. 'Spec2-Code-Tests'. 'Spec2-Commander2-Tests'. 'Spec2-Dialogs-Tests'. 'Spec2-Morphic-Backend-Tests'.
		   'Spec2-Morphic-Tests'. 'Spec2-Tests' }) inspect
]

{ #category : 'examples' }
CooPackageMetrics >> argestClassesByMethodCount: topN [

	| classSizePairs sorted |
	classSizePairs := self matchedPackages flatCollect: [ :pkg |
		                  pkg definedClasses collect: [ :class |
			                  { class -> class selectors size } ] ].
	sorted := classSizePairs asArray sort: [ :a :b | a second > b second ].
	^ sorted first: (topN min: sorted size)
]

{ #category : 'examples' }
CooPackageMetrics >> averageInstanceVariablesPerClass [

	| instVarCounts |
	instVarCounts := self matchedPackages flatCollect: [ :pkg |
		                 pkg definedClasses collect: [ :class | class instVarNames size ] ].
	^ instVarCounts isEmpty
		  ifTrue: [ 0 ]
		  ifFalse: [ instVarCounts sum / instVarCounts size ]
]

{ #category : 'examples' }
CooPackageMetrics >> averageMethodsPerClass [

	^ self numberOfClasses = 0
		  ifTrue: [ 0 ]
		  ifFalse: [ self totalNumberOfMethods asFloat / self numberOfClasses ]
]

{ #category : 'examples' }
CooPackageMetrics >> classPackageRatio [

	^ (self numberOfClasses / self matchedPackages size) asFloat
]

{ #category : 'examples' }
CooPackageMetrics >> classToMethodRatio [

	| totalMethods totalClasses |
	totalMethods := 0.
	self matchedPackages do: [ :pkg | totalMethods := totalMethods + pkg methods size ].
	totalClasses := self numberOfClasses.

	^ totalMethods = 0
		  ifTrue: [ 0 ]
		  ifFalse: [ totalClasses asFloat / totalMethods asFloat ]
]

{ #category : 'examples' }
CooPackageMetrics >> computeMatchedPackages [

	self packageOrganizer packageNamesDo: [ :pkgName |
		(packagePatterns anySatisfy: [ :pat | pat match: pkgName ]) ifTrue: [
			matchedPackages add: (self packageOrganizer packageNamed: pkgName) ] ].
	^ matchedPackages
]

{ #category : 'examples' }
CooPackageMetrics >> computedMatchedPatterns [

	self packageOrganizer packageNamesDo: [ :each |
		(packagePatterns anySatisfy: [ :pat | pat match: each ]) ifTrue: [
			matchedPackages add: (self packageOrganizer packageNamed: each) ] ]
]

{ #category : 'examples' }
CooPackageMetrics >> deprecatedMethods [

	| isDeprecated |
	isDeprecated := [ :method | method pragmas anySatisfy: [ :pr | pr selector = #deprecated ] ].
	^ self matchedPackages flatCollect: [ :pkg | pkg methods select: isDeprecated ]
]

{ #category : 'examples' }
CooPackageMetrics >> externalDefinitions: aCollection [
	externalDefinitions := aCollection
]

{ #category : 'examples' }
CooPackageMetrics >> externalUses: aCollection [
	externalUses := aCollection
]

{ #category : 'examples' }
CooPackageMetrics >> gatherAnalysis [
	"Gather all relevant analysis in a Dictionary and return it."

	^ Dictionary new
		  at: #matchedPackages put: self matchedPackages;
		  at: #numberOfPackages put: self matchedPackages size;
		  at: #numberOfClasses put: self numberOfClasses;
		  at: #averageMethodsPerClass put: self averageMethodsPerClass;
		  at: #averageInstanceVariablesPerClass put: self averageInstanceVariablesPerClass;
		  at: #methodsPerPackage put: self methodsPerPackage;
		  at: #classPackageRatio put: self classPackageRatio;
		  at: #deprecatedMethods put: self deprecatedMethods;
		  at: #methodsWithMostLinesOfCode put: (self methodsWithMostLinesOfCode: 5);
		  at: #uniqueMethods put: self uniqueMethods;
		  yourself
]

{ #category : 'examples' }
CooPackageMetrics >> initialize [

	super initialize.
	matchedPackages := OrderedCollection new.
	localDefinitions := OrderedCollection new.
	externalDefinitions := OrderedCollection new.
	localUses := OrderedCollection new.
	externalUses := OrderedCollection new.
	originalLocalDefinitions := OrderedCollection new.
	originalExternalDefinitions := OrderedCollection new.
	originalLocalUses := OrderedCollection new.
	originalExternalUses := OrderedCollection new.
]

{ #category : 'examples' }
CooPackageMetrics >> largestClassesByMethodCount: topN [

	| classSizePairs sorted |
	classSizePairs := self matchedPackages flatCollect: [ :pkg |
		                  pkg definedClasses collect: [ :class | { class -> class selectors size } ] ].
	sorted := classSizePairs asArray sort: [ :a :b | a second > b second ].
	^ sorted first: (topN min: sorted size)
]

{ #category : 'examples' }
CooPackageMetrics >> localDefinitions: aCollection [
	localDefinitions := aCollection
]

{ #category : 'examples' }
CooPackageMetrics >> localUses: aCollection [
	localUses := aCollection
]

{ #category : 'examples' }
CooPackageMetrics >> localityDefUseRatio [

	^ self percent: localUses size / localDefinitions size
]

{ #category : 'examples' }
CooPackageMetrics >> localityDefinitionRatio [

	^ self percent: localDefinitions size / (localDefinitions size + externalDefinitions size)
]

{ #category : 'examples' }
CooPackageMetrics >> localityUseRatio [
	^ self percent: (localUses size / (localUses size + externalUses size))
]

{ #category : 'examples' }
CooPackageMetrics >> logAnalysis [

	"Prints or logs all key analysis results to Transcript (or uses traceCr, etc.)"

	Transcript show: self matchedPackages size printString, ' packages matched.'; cr.
	Transcript show: self numberOfClasses printString, ' classes found.'; cr.

	Transcript show: 'Average methods per class: ', self averageMethodsPerClass printString; cr.
	Transcript show: 'Average instance variables per class: ',
		self averageInstanceVariablesPerClass printString;
		cr.

	Transcript show: 'Methods per package:'; cr.
	self methodsPerPackage keysAndValuesDo: [ :pkgName :methodCount |
		Transcript show: pkgName, ': ', methodCount printString; cr ].

	Transcript show: 'Class to package ratio: ', self classPackageRatio printString; cr.

	Transcript show: self deprecatedMethods size printString, ' deprecated methods found.'; cr.

	Transcript show: 'Top 5 methods with most lines of code:'; cr.
	(self methodsWithMostLinesOfCode: 5) do: [ :pair |
		Transcript
			show: pair first selector;
			show: ' (';
			show: pair first methodClass name;
			show: '): ';
			show: pair second printString;
			show: ' lines';
			cr ].

	Transcript show: 'Unique methods: ', self uniqueMethods size printString; cr.
]

{ #category : 'examples' }
CooPackageMetrics >> matchedPackages [

	^ matchedPackages
]

{ #category : 'examples' }
CooPackageMetrics >> matchedPackages: anObject [

	matchedPackages := anObject
]

{ #category : 'examples' }
CooPackageMetrics >> methodNames [

	| results |
	results := Set new.
	matchedPackages do: [ :each | results addAll: each selectors ].
	^ results
]

{ #category : 'examples' }
CooPackageMetrics >> methodsPerPackage [

	| dict |
	dict := Dictionary new.
	self matchedPackages do: [ :pkg | dict at: pkg name put: pkg methods size ].
	^ dict
]

{ #category : 'examples' }
CooPackageMetrics >> methodsWithMostLinesOfCode: n [

	| methodsWithLines |
	methodsWithLines := self matchedPackages flatCollect: [ :pkg |
		                   pkg methods collect: [ :method | { method. method sourceCode lines size } ] ].
	^ methodsWithLines
		  sort: [ :a :b | a second > b second ];
		  first: (n min: methodsWithLines size)
]

{ #category : 'examples' }
CooPackageMetrics >> numberOfClasses [

	^ self totalNumberOfClasses
]

{ #category : 'examples' }
CooPackageMetrics >> packageOrganizer [

	^ PackageOrganizer default
]

{ #category : 'examples' }
CooPackageMetrics >> packagePatterns: aCollection [

	packagePatterns := aCollection
]

{ #category : 'examples' }
CooPackageMetrics >> percent: aNumber [

	^ aNumber asFloat round: 2
]

{ #category : 'examples' }
CooPackageMetrics >> printOn: aStream [

	aStream << 'locality definition ratio: '.
	self localityDefinitionRatio printOn: aStream.
	aStream << ' ('.
	localDefinitions size printOn: aStream.
	aStream << '/'.
	(externalDefinitions size + localDefinitions size) printOn: aStream.
	aStream << ')'.
	aStream cr.

	aStream << 'locality use ratio: '.
	self localityDefinitionRatio printOn: aStream.
	aStream << ' ('.
	localUses size printOn: aStream.
	aStream << '/'.
	(localUses size + externalUses size) printOn: aStream.
	aStream << ')'.
	aStream cr.

	aStream << 'local def/use ratio: '.
	self localityDefUseRatio printOn: aStream.
	aStream << ' ('.
	localUses size printOn: aStream.
	aStream << '/'.
	localDefinitions size printOn: aStream.
	aStream << ')'
]

{ #category : 'examples' }
CooPackageMetrics >> topPackagesByClassCount: n [

	^ (self matchedPackages sorted: [ :a :b | a definedClasses size > b definedClasses size ])
		  first: (n min: self matchedPackages size)
]

{ #category : 'examples' }
CooPackageMetrics >> totalNumberOfClasses [

	^ self matchedPackages inject: 0 into: [ :sum :pkg | sum + pkg definedClasses size ]
]

{ #category : 'examples' }
CooPackageMetrics >> totalNumberOfMethods [

	^ self matchedPackages inject: 0 into: [ :sum :pkg | sum + pkg methods size ]
]

{ #category : 'examples' }
CooPackageMetrics >> uniqueMethods [

	| methodCounts |
	methodCounts := Dictionary new.
	self matchedPackages do: [ :pkg |
		pkg methods do: [ :method |
			methodCounts
				at: method selector
				put: (methodCounts at: method selector ifAbsent: [ 0 ]) + 1 ] ].
	^ methodCounts keys select: [ :selector | (methodCounts at: selector) = 1 ]
]
