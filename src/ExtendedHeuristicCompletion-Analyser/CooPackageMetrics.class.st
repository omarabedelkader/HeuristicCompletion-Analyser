"
Some class
"
Class {
	#name : 'CooPackageMetrics',
	#superclass : 'PackageAnalyser',
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
CooPackageMetrics class >> all [

	<script>
	^ self logTablesForPackageNames:
		  { 'Spec2-Adapters-Morphic'. 'Spec2-Adapters-Morphic-ListView'. 'Spec2-Adapters-Stub'. 'Spec2-Code'. 'Spec2-Code-Commands'.
		  'Spec2-Code-Diff'. 'Spec2-Code-Diff-Morphic'. 'Spec2-Code-Morphic'. 'Spec2-CommandLine'. 'Spec2-Commander2'. 'Spec2-Commands'.
		  'Spec2-CommonWidgets'. 'Spec2-Core'. 'Spec2-Dialogs'. 'Spec2-Examples'. 'Spec2-Interactions'. 'Spec2-Layout'. 'Spec2-ListView'.
		  'Spec2-Microdown'. 'Spec2-Morphic'. 'Spec2-Morphic-Examples'. 'Spec2-Transmission'. 
		
		
			'Spec2-Adapters-Morphic-Tests'.
		  'Spec2-Adapters-Stub'. 'Spec2-Backend-Tests'. 'Spec2-Code-Backend-Tests'. 'Spec2-Code-Diff-Tests'. 'Spec2-Code-Tests'.
		  'Spec2-Commander2-Tests'. 'Spec2-Dialogs-Tests'. 'Spec2-Morphic-Backend-Tests'. 'Spec2-Morphic-Tests'. 'Spec2-Tests'.
		
			'Roassal'. 'Roassal-Animation'. 'Roassal-BaselineMap'. 'Roassal-Builders'. 'Roassal-Chart'. 'Roassal-Chart-Examples'.
		   'Roassal-Class-Examples'. 'Roassal-Colors'. 'Roassal-DSM'. 'Roassal-Event'. 'Roassal-Examples'. 'Roassal-Experimental'.
		   'Roassal-Exporters'. 'Roassal-Exporters-Examples'. 'Roassal-FlameGraph-Examples'. 'Roassal-Inspector'. 'Roassal-Interaction'.
		   'Roassal-LayoutStudio'. 'Roassal-Layouts'. 'Roassal-Layouts-Util'. 'Roassal-Legend'. 'Roassal-Legend-Examples'.
		   'Roassal-Menu'. 'Roassal-Mondrian'. 'Roassal-Pie'. 'Roassal-Pie-Examples'. 'Roassal-SVG'. 'Roassal-SVG-Examples'.
		   'Roassal-Shapes'. 'Roassal-Spec'. 'Roassal-Spec-Examples'. 'Roassal-Spec-Morphic'. 'Roassal-Sunburst'. 'Roassal-Sunburst-Examples'.
		   'Roassal-TreeMap'. 'Roassal-TreeMap-Examples'. 'Roassal-UML'. 'Roassal-UML-Calypso'. 'Roassal-UML-Examples'.
		
			'Roassal-Animation-Tests'. 'Roassal-BaselineMap-Tests'. 'Roassal-Chart-Tests'. 'Roassal-Exporters-Tests'.
		   'Roassal-Global-Tests'. 'Roassal-Inspector-Tests'. 'Roassal-Interaction-Tests'. 'Roassal-LayoutStudio-Tests'.
		   'Roassal-Layouts-Tests'. 'Roassal-Shapes-Tests'. 'Roassal-Spec-Tests'. 'Roassal-SVG-Tests'. 'Roassal-UML-Tests'.
		
		
		'Seaside-Ajaxifier-Core'. 'Seaside-Canvas'. 'Seaside-Component'. 'Seaside-Continuation'. 'Seaside-Core'. 'Seaside-Development'.
		   'Seaside-Email'. 'Seaside-Environment'. 'Seaside-Examples'. 'Seaside-Flow'. 'Seaside-JSON-Core'. 'Seaside-Pharo-Canvas'.
		   'Seaside-Pharo-Continuation'. 'Seaside-Pharo-Core'. 'Seaside-Pharo-Development'. 'Seaside-Pharo-Email'. 'Seaside-Pharo-Environment'.
		   'Seaside-Pharo-Flow'. 'Seaside-Pharo-JSON-Core'. 'Seaside-Pharo-Tools-Web'. 'Seaside-Pharo-Welcome'. 'Seaside-REST-Core'.
		   'Seaside-RenderLoop'. 'Seaside-Session'. 'Seaside-Tools-Core'. 'Seaside-Tools-Web'. 'Seaside-Welcome'. 'Seaside-Widgets'.
		   'Seaside-Zinc-Core'. 'Seaside-Zinc-Pharo' .
		
		'Seaside-Tests-Canvas'. 'Seaside-Tests-Component'. 'Seaside-Tests-Core'. 'Seaside-Tests-Environment'.
		   'Seaside-Tests-Flow'. 'Seaside-Tests-Functional'. 'Seaside-Tests-Pharo-Canvas'. 'Seaside-Tests-Pharo-Continuation'.
		   'Seaside-Tests-Pharo-Core'. 'Seaside-Tests-Pharo-Functional'. 'Seaside-Tests-RenderLoop'. 'Seaside-Tests-Session'
		
		
		 }
]

{ #category : 'examples' }
CooPackageMetrics class >> averageInstanceVariablesFor: classes [

	| instVarCounts |
	instVarCounts := classes collect: [ :class | class instVarNames size ].
	^ instVarCounts isEmpty
		  ifTrue: [ 0.0 ]
		  ifFalse: [ instVarCounts sum / instVarCounts size asFloat ]
]

{ #category : 'examples' }
CooPackageMetrics class >> deprecatedMethodsFor: pkg [

	| isDeprecated |
	isDeprecated := [ :method | method pragmas anySatisfy: [ :pr | pr selector = #deprecated ] ].
	^ (pkg methods select: isDeprecated) size
]

{ #category : 'examples' }
CooPackageMetrics class >> formatNumber: value [

	(value isNumber and: [ value isInteger not ])
		ifTrue: [ ^ value printShowingDecimalPlaces: 2 ].
	^ value
]

{ #category : 'examples' }
CooPackageMetrics class >> groupMetricsForPackages: groupPackages name: groupName [

	| groupPackageCount groupClasses groupDefined groupMethods groupDefinedClasses groupAverageMethods groupAverageInstVars groupDeprecated groupUnique groupLongestMethod groupLocalDefs groupExternalDefs groupLocalUses groupExternalUses groupInternalUsers groupInternalRatio groupExternalRefs groupCompletionInternalCount groupCompletionExternalCount groupCompletionSize groupCompletionInternalRatio groupCompletionExternalRatio groupAmbiguity groupEntropy |
	groupPackageCount := groupPackages size.
	groupClasses := groupPackages inject: 0 into: [ :sum :pkg | sum + pkg classes size ].
	groupDefined := groupPackages inject: 0 into: [ :sum :pkg | sum + pkg definedClasses size ].
	groupMethods := groupPackages inject: 0 into: [ :sum :pkg | sum + pkg methods size ].
	groupDefinedClasses := groupPackages flatCollect: [ :pkg | pkg definedClasses ].
	groupAverageMethods := groupClasses = 0
		                     ifTrue: [ 0.0 ]
		                     ifFalse: [ groupMethods / groupClasses asFloat ].
	groupAverageInstVars := self averageInstanceVariablesFor: groupDefinedClasses.
	groupDeprecated := groupPackages inject: 0 into: [ :sum :pkg | sum + (self deprecatedMethodsFor: pkg) ].
	groupUnique := groupPackages inject: 0 into: [ :sum :pkg | sum + (self uniqueMethodsFor: pkg) ].
	groupLongestMethod := self longestMethodSummaryForPackages: groupPackages.
	groupLocalDefs := 0.
	groupExternalDefs := 0.
	groupLocalUses := 0.
	groupExternalUses := 0.
	groupInternalUsers := 0.
	groupExternalRefs := 0.
	groupCompletionInternalCount := 0.
	groupCompletionExternalCount := 0.
	groupEntropy := 0.0.
	groupPackages do: [ :pkg |
		| analyser |
		analyser := PackageAnalyser new.
		analyser runAnalysisForPackage: pkg.
		groupLocalDefs := groupLocalDefs + analyser definedClassNames size.
		groupExternalDefs := groupExternalDefs + analyser externalReferences size.
		groupLocalUses := groupLocalUses + (self referenceCountFor: analyser internalClassReferences in: analyser).
		groupExternalUses := groupExternalUses + (self referenceCountFor: analyser externalReferences in: analyser).
		groupInternalUsers := groupInternalUsers + analyser internalUserCount.
		groupExternalRefs := groupExternalRefs + analyser externalReferences size.
		groupCompletionInternalCount := groupCompletionInternalCount + analyser completionVocabularyInternalCount.
		groupCompletionExternalCount := groupCompletionExternalCount + analyser completionVocabularyExternalCount.
		groupEntropy := groupEntropy + analyser completionEntropy ].
	groupInternalRatio := groupLocalDefs = 0
		                     ifTrue: [ 0.0 ]
		                     ifFalse: [ groupInternalUsers / groupLocalDefs asFloat ].
	groupCompletionSize := groupCompletionInternalCount + groupCompletionExternalCount.
	groupCompletionInternalRatio := groupCompletionSize = 0
		                               ifTrue: [ 0.0 ]
		                               ifFalse: [ groupCompletionInternalCount / groupCompletionSize asFloat ].
	groupCompletionExternalRatio := groupCompletionSize = 0
		                               ifTrue: [ 0.0 ]
		                               ifFalse: [ groupCompletionExternalCount / groupCompletionSize asFloat ].
	groupAmbiguity := groupCompletionExternalRatio.
	^ Dictionary new
		  at: #name put: (self latexEscape: groupName);
		  at: #packageCount put: groupPackageCount;
		  at: #totalClasses put: groupClasses;
		  at: #definedClasses put: groupDefined;
		  at: #totalMethods put: groupMethods;
		  at: #averageMethodsPerClass put: groupAverageMethods;
		  at: #averageInstanceVariablesPerClass put: groupAverageInstVars;
		  at: #classPackageRatio put: (self ratioFor: groupClasses denominator: groupPackageCount);
		  at: #classMethodRatio put: (self ratioFor: groupClasses denominator: groupMethods);
		  at: #deprecatedMethods put: groupDeprecated;
		  at: #uniqueMethods put: groupUnique;
		  at: #methodsWithMostLinesOfCode put: groupLongestMethod;
		  at: #localityDefinitionRatio put: (self ratioFor: groupLocalDefs denominator: groupLocalDefs + groupExternalDefs);
		  at: #localityUseRatio put: (self ratioFor: groupLocalUses denominator: groupLocalUses + groupExternalUses);
		  at: #localityDefUseRatio put: (self ratioFor: groupLocalUses denominator: groupLocalDefs);
		  at: #internalUserRatio put: groupInternalRatio;
		  at: #internalUserCount put: groupInternalUsers;
		  at: #externalReferenceCount put: groupExternalRefs;
		  at: #completionVocabularySize put: groupCompletionSize;
		  at: #completionVocabularyInternalRatio put: groupCompletionInternalRatio;
		  at: #completionVocabularyExternalRatio put: groupCompletionExternalRatio;
		  at: #completionAmbiguity put: groupAmbiguity;
		  at: #completionEntropy put: (groupPackageCount = 0
			                               ifTrue: [ 0.0 ]
			                               ifFalse: [ groupEntropy / groupPackageCount asFloat ]);
		  yourself
]

{ #category : 'TO-DELETE' }
CooPackageMetrics class >> iceberg [

	<script>
	^ (self runForPackageNames:
		   { 'Iceberg'. 'Iceberg-ArchitecturalRules'. 'Iceberg-Libgit'. 'Iceberg-Libgit-Filetree'. 'Iceberg-Libgit-Tonel'.
		   'Iceberg-Memory'. 'Iceberg-Metacello-Integration'. 'Iceberg-Playground-Plugin-Gist'. 'Iceberg-Plugin'. 'Iceberg-Plugin-Github'.
		   'Iceberg-Plugin-Metacello'. 'Iceberg-Plugin-Migration'. 'Iceberg-Plugin-Pharo'. 'Iceberg-TipUI'. 'Iceberg-TipUI-SnapShotBrowser' })
		  inspect
]

{ #category : 'TO-DELETE' }
CooPackageMetrics class >> icebergTest [

	<script>
	^ (self runForPackageNames:
		   { 'Iceberg-Plugin-Migration-Tests'. 'Iceberg-Tests'. 'Iceberg-Tests-MetacelloIntegration'.
		   'Iceberg-TipUI-SnapshotBrowser-Tests'. 'Iceberg-UI-Tests' }) inspect
]

{ #category : 'examples' }
CooPackageMetrics class >> latexEscape: aString [

	| escaped |
	escaped := aString asString.
	escaped := escaped copyReplaceAll: '\' with: '\\'.
	escaped := escaped copyReplaceAll: '&' with: '\&'.
	escaped := escaped copyReplaceAll: '%' with: '\%'.
	escaped := escaped copyReplaceAll: '#' with: '\#'.
	escaped := escaped copyReplaceAll: '_' with: '\_'.
	escaped := escaped copyReplaceAll: '{' with: '\{'.
	escaped := escaped copyReplaceAll: '}' with: '\}'.
	^ escaped
]

{ #category : 'examples' }
CooPackageMetrics class >> logGroupedTablesForPackageNames: packageNames [

	| groups groupedRows groupedMetrics |
	groups := Dictionary new.
	packageNames do: [ :name |
		| groupName |
		groupName := PackageAnalyser packageGroupNameFor: name.
		(groups at: groupName ifAbsentPut: [ OrderedCollection new ]) add: name ].
	groupedRows := groups keys asSortedCollection collect: [ :groupName |
		| groupPackages |
		groupPackages := ((groups at: groupName)
			                 collect: [ :name | PackageOrganizer default packageNamed: name ])
			                 select: [ :pkg | pkg notNil ].
		self groupMetricsForPackages: groupPackages name: groupName ].
	groupedMetrics := groupedRows collect: [ :row |
		Dictionary newFrom: (row associations collect: [ :assoc |
			assoc key -> ((assoc value isNumber and: [ assoc value isInteger not ])
				              ifTrue: [ assoc value printShowingDecimalPlaces: 2 ]
				              ifFalse: [ assoc value ]) ]) ].
	self logLatexTableWithTitle: 'Grouped Table 1'
		headers: { 'Group'. 'M_{pkg}'. 'C_{tot}'. 'C_{def}' }
		rows: (groupedMetrics collect: [ :row |
					 { row at: #name.
					 row at: #packageCount.
					 row at: #totalClasses.
					 row at: #definedClasses } ]).
	self logLatexTableWithTitle: 'Grouped Table 2'
		headers: { 'Group'. 'M_{tot}'. 'AM_{cls}'. 'AI_{cls}' }
		rows: (groupedMetrics collect: [ :row |
					 { row at: #name.
					 row at: #totalMethods.
					 row at: #averageMethodsPerClass.
					 row at: #averageInstanceVariablesPerClass } ]).
	self logLatexTableWithTitle: 'Grouped Table 3'
		headers: { 'Group'. 'R_{CP}'. 'R_{CM}' }
		rows: (groupedMetrics collect: [ :row |
					 { row at: #name.
					 row at: #classPackageRatio.
					 row at: #classMethodRatio } ]).
	self logLatexTableWithTitle: 'Grouped Table 4'
		headers: { 'Group'. 'M_{dep}'. 'U_{sel}'. 'M_{LOC}' }
		rows: (groupedMetrics collect: [ :row |
					 { row at: #name.
					 row at: #deprecatedMethods.
					 row at: #uniqueMethods.
					 row at: #methodsWithMostLinesOfCode } ]).
	self logLatexTableWithTitle: 'Grouped Table 5'
		headers: { 'Group'. 'R_{def}'. 'R_{use}'. 'R_{du}' }
		rows: (groupedMetrics collect: [ :row |
					 { row at: #name.
					 row at: #localityDefinitionRatio.
					 row at: #localityUseRatio.
					 row at: #localityDefUseRatio } ]).
	self logLatexTableWithTitle: 'Grouped Table 6'
		headers: { 'Group'. 'R_{int}'. 'U_{int}'. 'R_{ext}' }
		rows: (groupedMetrics collect: [ :row |
					 { row at: #name.
					 row at: #internalUserRatio.
					 row at: #internalUserCount.
					 row at: #externalReferenceCount } ]).
	self logLatexTableWithTitle: 'Grouped Table 7'
		headers: { 'Group'. 'V'. 'R_{V}^{int}'. 'R_{V}^{ext}' }
		rows: (groupedMetrics collect: [ :row |
					 { row at: #name.
					 row at: #completionVocabularySize.
					 row at: #completionVocabularyInternalRatio.
					 row at: #completionVocabularyExternalRatio } ]).
	self logLatexTableWithTitle: 'Grouped Table 8'
		headers: { 'Group'. 'A_{comp}'. 'H_{comp}' }
		rows: (groupedMetrics collect: [ :row |
					 { row at: #name.
					 row at: #completionAmbiguity.
					 row at: #completionEntropy } ])
]

{ #category : 'examples' }
CooPackageMetrics class >> logLatexTableWithTitle: title headers: headers rows: rows [

	| columnSpec |
	columnSpec := 'l' , (String new: headers size - 1 withAll: $r).
	Transcript
		show: '% ' , title;
		cr;
		show: '\begin{tabular}{' , columnSpec , '}';
		cr;
		show: '\hline';
		cr;
		show: (String streamContents: [ :stream |
					 headers
						 do: [ :header | stream nextPutAll: header ]
						 separatedBy: [ stream nextPutAll: ' & ' ].
					 stream nextPutAll: ' \\' ]);
		cr;
		show: '\hline';
		cr.
	rows do: [ :row |
		Transcript
			show: (String streamContents: [ :stream |
						 row
							 do: [ :cell | stream nextPutAll: cell asString ]
							 separatedBy: [ stream nextPutAll: ' & ' ].
						 stream nextPutAll: ' \\' ]);
			cr ].
	Transcript
		show: '\hline';
		cr;
		show: '\end{tabular}';
		cr;
		cr
]

{ #category : 'examples' }
CooPackageMetrics class >> logSectionLabel: sectionName packageNames: packageNames [

	Transcript
		show: sectionName;
		show: ': {'.
	Transcript
		show: (String streamContents: [ :stream |
					packageNames
						do: [ :name | stream nextPutAll: (self latexEscape: name) ]
						separatedBy: [ stream nextPutAll: ', ' ] ]);
		show: '}';
		cr
]

{ #category : 'examples' }
CooPackageMetrics class >> logTablesForPackageNames: packageNames [

	| rows packageCount |
	packageCount := packageNames size.
	rows := packageNames collect: [ :name | self packageMetricsForName: name packageCount: packageCount ].
	self logSectionLabel: 'details' packageNames: packageNames.
	self logLatexTableWithTitle: 'Package Scope \& Size Metrics'
		headers: { 'Package'. 'M_{pkg}'. 'C_{tot}'. 'C_{def}' }
		rows: (rows collect: [ :row |
					 { row at: #name.
					 row at: #packageCount.
					 row at: #totalClasses.
					 row at: #definedClasses } ]).
	self logSectionLabel: 'details' packageNames: packageNames.
	self logLatexTableWithTitle: 'Class-Level Structural Metrics'
		headers: { 'Package'. 'M_{tot}'. 'AM_{cls}'. 'AI_{cls}' }
		rows: (rows collect: [ :row |
					 { row at: #name.
					 row at: #totalMethods.
					 row at: #averageMethodsPerClass.
					 row at: #averageInstanceVariablesPerClass } ]).
				self logSectionLabel: 'details' packageNames: packageNames.
	self logLatexTableWithTitle: 'Package and Design Granularity Metrics'
		headers: { 'Package'. 'R_{CP}'. 'R_{CM}' }
		rows: (rows collect: [ :row |
					 { row at: #name.
					 row at: #classPackageRatio.
					 row at: #classMethodRatio } ]).
				self logSectionLabel: 'details' packageNames: packageNames.
	self logLatexTableWithTitle: 'Method-Level Quality and Maintenance Metrics'
		headers: { 'Package'. 'M_{dep}'. 'U_{sel}'. 'M_{LOC}' }
		rows: (rows collect: [ :row |
					 { row at: #name.
					 row at: #deprecatedMethods.
					 row at: #uniqueMethods.
					 row at: #methodsWithMostLinesOfCode } ]).
				self logSectionLabel: 'details' packageNames: packageNames.
	self logLatexTableWithTitle: 'Locality and Dependency Metrics'
		headers: { 'Package'. 'R_{def}'. 'R_{use}'. 'R_{du}' }
		rows: (rows collect: [ :row |
					 { row at: #name.
					 row at: #localityDefinitionRatio.
					 row at: #localityUseRatio.
					 row at: #localityDefUseRatio } ]).
				self logSectionLabel: 'details' packageNames: packageNames.
	self logLatexTableWithTitle: 'Package Usage and Dependency Direction Metrics'
		headers: { 'Package'. 'R_{int}'. 'U_{int}'. 'R_{ext}' }
		rows: (rows collect: [ :row |
					 { row at: #name.
					 row at: #internalUserRatio.
					 row at: #internalUserCount.
					 row at: #externalReferenceCount } ]).
				self logSectionLabel: 'details' packageNames: packageNames.
	self logLatexTableWithTitle: 'Code Completion Vocabulary Metrics'
		headers: { 'Package'. 'V'. 'R_{V}^{int}'. 'R_{V}^{ext}' }
		rows: (rows collect: [ :row |
					 { row at: #name.
					 row at: #completionVocabularySize.
					 row at: #completionVocabularyInternalRatio.
					 row at: #completionVocabularyExternalRatio } ]).
				self logSectionLabel: 'details' packageNames: packageNames.
	self logLatexTableWithTitle: 'Code Completion Uncertainty Metrics'
		headers: { 'Package'. 'A_{comp}'. 'H_{comp}' }
		rows: (rows collect: [ :row |
					 { row at: #name.
					 row at: #completionAmbiguity.
					 row at: #completionEntropy } ]).
	^ rows
]

{ #category : 'examples' }
CooPackageMetrics class >> longestMethodSummaryFor: pkg [

	| methodsWithLines top |
	methodsWithLines := pkg methods collect: [ :method |
		                   { method. method sourceCode lines size } ].
	methodsWithLines isEmpty ifTrue: [ ^ '-' ].
	top := methodsWithLines
		       sort: [ :a :b | a second > b second ];
		       first.
	^ self latexEscape:
		  (top first methodClass name , '>>' , top first selector printString , ' (' , top second printString , ')')
]

{ #category : 'examples' }
CooPackageMetrics class >> longestMethodSummaryForPackages: groupPackages [

	| bestMethod bestLines |
	bestLines := -1.
	bestMethod := nil.
	groupPackages do: [ :pkg |
		pkg methods do: [ :method |
			| lineCount |
			lineCount := method sourceCode lines size.
			lineCount > bestLines ifTrue: [
				bestLines := lineCount.
				bestMethod := method ] ] ].
	bestMethod ifNil: [ ^ '-' ].
	^ self latexEscape:
		  (bestMethod methodClass name , '>>' , bestMethod selector printString , ' (' , bestLines printString , ')')
]

{ #category : 'TO-DELETE' }
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

{ #category : 'TO-DELETE' }
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
CooPackageMetrics class >> packageMetricsForName: packageName packageCount: packageCount [

	| pkg analyser totalClasses definedClasses totalMethods averageMethods averageInstVars classPackageRatio classMethodRatio deprecatedCount uniqueCount longestMethod localDefs externalDefs localUses externalUses |
	pkg := PackageOrganizer default packageNamed: packageName.
	pkg ifNil: [
		^ Dictionary new
			  at: #name put: (self latexEscape: packageName);
			  at: #packageCount put: packageCount;
			  at: #totalClasses put: 0;
			  at: #definedClasses put: 0;
			  at: #totalMethods put: 0;
			  at: #averageMethodsPerClass put: '0.00';
			  at: #averageInstanceVariablesPerClass put: '0.00';
			  at: #classPackageRatio put: '0.00';
			  at: #classMethodRatio put: '0.00';
			  at: #deprecatedMethods put: 0;
			  at: #uniqueMethods put: 0;
			  at: #methodsWithMostLinesOfCode put: '-';
			  at: #localityDefinitionRatio put: '0.00';
			  at: #localityUseRatio put: '0.00';
			  at: #localityDefUseRatio put: '0.00';
			  at: #internalUserRatio put: '0.00';
			  at: #internalUserCount put: 0;
			  at: #externalReferenceCount put: 0;
			  at: #completionVocabularySize put: 0;
			  at: #completionVocabularyInternalRatio put: '0.00';
			  at: #completionVocabularyExternalRatio put: '0.00';
			  at: #completionAmbiguity put: '0.00';
			  at: #completionEntropy put: '0.00';
			  yourself ].
	analyser := PackageAnalyser new.
	analyser runAnalysisForPackage: pkg.

	totalClasses := pkg classes size.
	definedClasses := pkg definedClasses size.
	totalMethods := pkg methods size.
	averageMethods := totalClasses = 0
		ifTrue: [ 0.0 ]
		ifFalse: [ totalMethods / totalClasses asFloat ].
	averageInstVars := self averageInstanceVariablesFor: pkg definedClasses.
	classPackageRatio := totalClasses asFloat.
	classMethodRatio := totalMethods = 0
		ifTrue: [ 0.0 ]
		ifFalse: [ totalClasses / totalMethods asFloat ].
	deprecatedCount := self deprecatedMethodsFor: pkg.
	uniqueCount := self uniqueMethodsFor: pkg.
	longestMethod := self longestMethodSummaryFor: pkg.

	localDefs := analyser definedClassNames size.
	externalDefs := analyser externalReferences size.
	localUses := self referenceCountFor: analyser internalClassReferences in: analyser.
	externalUses := self referenceCountFor: analyser externalReferences in: analyser.

	^ Dictionary new
		  at: #name put: (self latexEscape: packageName);
		  at: #packageCount put: packageCount;
		  at: #totalClasses put: totalClasses;
		  at: #definedClasses put: definedClasses;
		  at: #totalMethods put: totalMethods;
		  at: #averageMethodsPerClass put: (self formatNumber: averageMethods);
		  at: #averageInstanceVariablesPerClass put: (self formatNumber: averageInstVars);
		  at: #classPackageRatio put: (self formatNumber: classPackageRatio);
		  at: #classMethodRatio put: (self formatNumber: classMethodRatio);
		  at: #deprecatedMethods put: deprecatedCount;
		  at: #uniqueMethods put: uniqueCount;
		  at: #methodsWithMostLinesOfCode put: longestMethod;
		  at: #localityDefinitionRatio put: (self formatNumber: (self ratioFor: localDefs denominator: localDefs + externalDefs));
		  at: #localityUseRatio put: (self formatNumber: (self ratioFor: localUses denominator: localUses + externalUses));
		  at: #localityDefUseRatio put: (self formatNumber: (self ratioFor: localUses denominator: localDefs));
		  at: #internalUserRatio put: (self formatNumber: analyser internalUserRatio);
		  at: #internalUserCount put: analyser internalUserCount;
		  at: #externalReferenceCount put: analyser externalReferences size;
		  at: #completionVocabularySize put: analyser completionVocabularySize;
		  at: #completionVocabularyInternalRatio put: (self formatNumber: analyser completionVocabularyInternalRatio);
		  at: #completionVocabularyExternalRatio put: (self formatNumber: analyser completionVocabularyExternalRatio);
		  at: #completionAmbiguity put: (self formatNumber: analyser ambiguity);
		  at: #completionEntropy put: (self formatNumber: analyser completionEntropy);
		  yourself
]

{ #category : 'examples' }
CooPackageMetrics class >> ratioFor: numerator denominator: denominator [

	^ denominator = 0
		  ifTrue: [ 0.0 ]
		  ifFalse: [ numerator / denominator asFloat ]
]

{ #category : 'examples' }
CooPackageMetrics class >> referenceCountFor: classNames in: analyser [

	^ classNames inject: 0 into: [ :sum :className |
		  sum + (analyser referencesForClass: className) size ]
]

{ #category : 'examples' }
CooPackageMetrics class >> runForPackageNames: packageNames [

	| rows metrics packages |
	rows := super runForPackageNames: packageNames.
	self logGroupedTablesForPackageNames: packageNames.
	packages := (packageNames collect: [ :name | PackageOrganizer default packageNamed: name ])
		            select: [ :pkg | pkg notNil ].
	metrics := self new.
	metrics matchedPackages: packages.
	metrics logAnalysis.
	^ rows
]

{ #category : 'examples' }
CooPackageMetrics class >> sunmmary [

	<script>
	^ self runForPackageNames:
		  { 'Spec2-Adapters-Morphic'. 'Spec2-Adapters-Morphic-ListView'. 'Spec2-Adapters-Stub'. 'Spec2-Code'. 'Spec2-Code-Commands'.
		  'Spec2-Code-Diff'. 'Spec2-Code-Diff-Morphic'. 'Spec2-Code-Morphic'. 'Spec2-CommandLine'. 'Spec2-Commander2'. 'Spec2-Commands'.
		  'Spec2-CommonWidgets'. 'Spec2-Core'. 'Spec2-Dialogs'. 'Spec2-Examples'. 'Spec2-Interactions'. 'Spec2-Layout'. 'Spec2-ListView'.
		  'Spec2-Microdown'. 'Spec2-Morphic'. 'Spec2-Morphic-Examples'. 'Spec2-Transmission'. 'Spec2-Adapters-Morphic-Tests'.
		  'Spec2-Adapters-Stub'. 'Spec2-Backend-Tests'. 'Spec2-Code-Backend-Tests'. 'Spec2-Code-Diff-Tests'. 'Spec2-Code-Tests'.
		  'Spec2-Commander2-Tests'. 'Spec2-Dialogs-Tests'. 'Spec2-Morphic-Backend-Tests'. 'Spec2-Morphic-Tests'. 'Spec2-Tests'.
		  'Roassal'. 'Roassal-Animation'. 'Roassal-BaselineMap'. 'Roassal-Builders'. 'Roassal-Chart'. 'Roassal-Chart-Examples'.
		  'Roassal-Class-Examples'. 'Roassal-Colors'. 'Roassal-DSM'. 'Roassal-Event'. 'Roassal-Examples'. 'Roassal-Experimental'.
		  'Roassal-Exporters'. 'Roassal-Exporters-Examples'. 'Roassal-FlameGraph-Examples'. 'Roassal-Inspector'. 'Roassal-Interaction'.
		  'Roassal-LayoutStudio'. 'Roassal-Layouts'. 'Roassal-Layouts-Util'. 'Roassal-Legend'. 'Roassal-Legend-Examples'.
		  'Roassal-Menu'. 'Roassal-Mondrian'. 'Roassal-Pie'. 'Roassal-Pie-Examples'. 'Roassal-SVG'. 'Roassal-SVG-Examples'.
		  'Roassal-Shapes'. 'Roassal-Spec'. 'Roassal-Spec-Examples'. 'Roassal-Spec-Morphic'. 'Roassal-Sunburst'. 'Roassal-Sunburst-Examples'.
		  'Roassal-TreeMap'. 'Roassal-TreeMap-Examples'. 'Roassal-UML'. 'Roassal-UML-Calypso'. 'Roassal-UML-Examples'.
		  'Roassal-Animation-Tests'. 'Roassal-BaselineMap-Tests'. 'Roassal-Chart-Tests'. 'Roassal-Exporters-Tests'.
		  'Roassal-Global-Tests'. 'Roassal-Inspector-Tests'. 'Roassal-Interaction-Tests'. 'Roassal-LayoutStudio-Tests'.
		  'Roassal-Layouts-Tests'. 'Roassal-Shapes-Tests'. 'Roassal-Spec-Tests'. 'Roassal-SVG-Tests'. 'Roassal-UML-Tests'.
		  'Seaside-Ajaxifier-Core'. 'Seaside-Canvas'. 'Seaside-Component'. 'Seaside-Continuation'. 'Seaside-Core'. 'Seaside-Development'.
		  'Seaside-Email'. 'Seaside-Environment'. 'Seaside-Examples'. 'Seaside-Flow'. 'Seaside-JSON-Core'. 'Seaside-Pharo-Canvas'.
		  'Seaside-Pharo-Continuation'. 'Seaside-Pharo-Core'. 'Seaside-Pharo-Development'. 'Seaside-Pharo-Email'. 'Seaside-Pharo-Environment'.
		  'Seaside-Pharo-Flow'. 'Seaside-Pharo-JSON-Core'. 'Seaside-Pharo-Tools-Web'. 'Seaside-Pharo-Welcome'. 'Seaside-REST-Core'.
		  'Seaside-RenderLoop'. 'Seaside-Session'. 'Seaside-Tools-Core'. 'Seaside-Tools-Web'. 'Seaside-Welcome'. 'Seaside-Widgets'.
		  'Seaside-Zinc-Core'. 'Seaside-Zinc-Pharo'. 'Seaside-Tests-Canvas'. 'Seaside-Tests-Component'. 'Seaside-Tests-Core'.
		  'Seaside-Tests-Environment'. 'Seaside-Tests-Flow'. 'Seaside-Tests-Functional'. 'Seaside-Tests-Pharo-Canvas'.
		  'Seaside-Tests-Pharo-Continuation'. 'Seaside-Tests-Pharo-Core'. 'Seaside-Tests-Pharo-Functional'.
		  'Seaside-Tests-RenderLoop'. 'Seaside-Tests-Session' }
]

{ #category : 'examples' }
CooPackageMetrics class >> uniqueMethodsFor: pkg [

	| methodCounts |
	methodCounts := Dictionary new.
	pkg methods do: [ :method |
		methodCounts
			at: method selector
			put: (methodCounts at: method selector ifAbsent: [ 0 ]) + 1 ].
	^ (methodCounts keys select: [ :selector | (methodCounts at: selector) = 1 ]) size
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

	| summaryRows formatValue |
	formatValue := [ :value |
		               value isNumber
			               ifTrue: [
					               value isInteger
						               ifTrue: [ value printString ]
						               ifFalse: [ value asFloat printShowingDecimalPlaces: 2 ] ]
			               ifFalse: [ value printString ] ].

	summaryRows := {
		               {
			               'Packages matched'.
			               (formatValue value: self matchedPackages size) }.
		               {
			               'Classes found'.
			               (formatValue value: self numberOfClasses) }.
		               {
			               'Average methods per class'.
			               (formatValue value: self averageMethodsPerClass) }.
		               {
			               'Average instance variables per class'.
			               (formatValue value: self averageInstanceVariablesPerClass) }.
		               {
			               'Class to package ratio'.
			               (formatValue value: self classPackageRatio) }.
		               {
			               'Deprecated methods found'.
			               (formatValue value: self deprecatedMethods size) }.
		               {
			               'Unique methods'.
			               (formatValue value: self uniqueMethods size) } }.
			self class
		logSectionLabel: 'summary'
		packageNames: (self matchedPackages collect: [ :pkg | pkg name ]).
	Transcript
		show: (String streamContents: [ :stream |
						 stream
							 nextPutAll: '\begin{tabular}{ll}';
							 nextPutAll: '\hline';
							 cr.
						 stream
							 nextPutAll: 'Metric & Value \\';
							 cr.
						 stream
							 nextPutAll: '\hline';
							 cr.
						 summaryRows do: [ :row |
								 stream
									 nextPutAll: row first;
									 nextPutAll: ' & ';
									 nextPutAll: row second;
									 nextPutAll: ' \\';
									 cr ].
						 stream
							 nextPutAll: '\end{tabular}';
							 cr ]);
		cr
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
