Extension { #name : 'BlOSWindowEventHandler' }

{ #category : '*BlocIM' }
BlOSWindowEventHandler >> visitTextEditingEvent: anEvent [
	| blEvent |
	blEvent := BlTextInputEvent new
		           text: anEvent text;
		           modifiers: (self convertKeyModifiers: anEvent modifiers);
		           yourself.
	self enqueue: blEvent
]

{ #category : '*BlocIM' }
BlOSWindowEventHandler >> visitTextInputEvent: anEvent [

	| blEvent |
	blEvent := BlTextInputEvent new
		           text: anEvent text;
		           modifiers: (self convertKeyModifiers: anEvent modifiers);
		           yourself.
	self enqueue: blEvent
]
