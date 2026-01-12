"
I'm an abstract class. see my subclasses
"
Class {
	#name : 'CooPackage',
	#superclass : 'Object',
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
