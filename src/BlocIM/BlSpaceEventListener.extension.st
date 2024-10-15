Extension { #name : 'BlSpaceEventListener' }

{ #category : '*BlocIM' }
BlSpaceEventListener >> textEditingEvent: anEvent [

	self keyboardProcessor processTextEditing: anEvent
]
