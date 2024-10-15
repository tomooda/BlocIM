Class {
	#name : 'BlTextEditingEvent',
	#superclass : 'BlTextInputEvent',
	#category : 'BlocIM',
	#package : 'BlocIM'
}

{ #category : 'testing' }
BlTextEditingEvent >> isTextEditing [

	^ true
]

{ #category : 'sending' }
BlTextEditingEvent >> sendTo: anObject [
	anObject textEditingEvent: self
]
