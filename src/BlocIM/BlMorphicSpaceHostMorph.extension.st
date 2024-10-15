Extension { #name : 'BlMorphicSpaceHostMorph' }

{ #category : '*BlocIM' }
BlMorphicSpaceHostMorph >> handlesTextEditionEvent: evt [
	"Do I want to receive text edition events?" 

	^true
]

{ #category : '*BlocIM' }
BlMorphicSpaceHostMorph >> textEdition: aTextEditingEvent [

	aTextEditingEvent sentTo: eventHandler
]
