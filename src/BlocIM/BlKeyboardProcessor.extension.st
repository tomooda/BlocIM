Extension { #name : 'BlKeyboardProcessor' }

{ #category : '*BlocIM' }
BlKeyboardProcessor >> processKeyDown: anEvent [

	| aTarget aShortcutEvent |
	(self buffer hasEvent: anEvent key) ifTrue: [ ^ self ].

	textInputBuffer hasPendingText ifTrue: [
		^ self].

	self buffer add: anEvent.

	aTarget := self findTarget.
	anEvent target: aTarget.
	self fireEvent: anEvent.

	aShortcutEvent := BlShortcutEvent new.
	aShortcutEvent buffer: self buffer.
	aShortcutEvent target: aTarget.
	aShortcutEvent modifiers: anEvent modifiers.

	self fireEvent: aShortcutEvent.

	previousShortcutTime := self space time now.

	preventKeystrokes := aShortcutEvent isConsumed
]

{ #category : '*BlocIM' }
BlKeyboardProcessor >> processTextEditing: anEvent [

	self keystrokesAllowed ifFalse: [ ^ self ].
	textInputBuffer editing: anEvent text modifiers: anEvent modifiers
]
