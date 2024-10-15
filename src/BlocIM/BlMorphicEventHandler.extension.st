Extension { #name : 'BlMorphicEventHandler' }

{ #category : '*BlocIM' }
BlMorphicEventHandler >> handleTextEditionEvent: anEvent [

	| aBlEvent |
	aBlEvent := BlTextEditingEvent new
		            text: anEvent text asString;
		            modifiers: (BlKeyModifiers
				             shift: false
				             ctrl: false
				             alt: false
				             cmd: false);
		            timestamp: self timestampNow;
		            yourself.

	self enqueue: aBlEvent
]
