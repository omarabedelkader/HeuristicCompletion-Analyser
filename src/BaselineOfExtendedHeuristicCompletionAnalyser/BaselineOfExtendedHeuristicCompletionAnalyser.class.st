Class {
	#name : 'BaselineOfExtendedHeuristicCompletionAnalyser',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfExtendedHeuristicCompletionAnalyser',
	#package : 'BaselineOfExtendedHeuristicCompletionAnalyser'
}

{ #category : 'baselines' }
BaselineOfExtendedHeuristicCompletionAnalyser >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		spec package: 'ExtendedHeuristicCompletion-Analyser'.
	spec
		package: 'ExtendedHeuristicCompletion-Analyser-Tests'
		with: [ spec requires: 'ExtendedHeuristicCompletion-Analyser' ].
		
			spec package: 'ExtendedHeuristicCompletion-Analyser-Data' with: [
			spec requires: 'ExtendedHeuristicCompletion-Analyser-Tests'].
					spec package: 'ExtendedHeuristicCompletion-Analyser-Data2' with: [
			spec requires: 'ExtendedHeuristicCompletion-Analyser-Tests'].
							spec package: 'ExtendedHeuristicCompletion-Analyser-Data3' with: [
			spec requires: 'ExtendedHeuristicCompletion-Analyser-Tests'].
							spec package: 'ExtendedHeuristicCompletion-Analyser-Data4' with: [
			spec requires: 'ExtendedHeuristicCompletion-Analyser-Tests']
		]
]
