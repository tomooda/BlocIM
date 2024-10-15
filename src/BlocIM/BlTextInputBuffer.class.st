"
# Text input buffer
Collects all the text input events during a frame

"
Class {
	#name : 'BlTextInputBuffer',
	#superclass : 'Object',
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'inputs',
		'editingText',
		'pendingText'
	],
	#category : 'BlocIM',
	#package : 'BlocIM'
}

{ #category : 'adding' }
BlTextInputBuffer >> editing: aString modifiers: aBlKeyModifiers [

	editingText := pendingText := aString
]

{ #category : 'adding' }
BlTextInputBuffer >> flushPendingText [

	pendingText := nil
]

{ #category : 'testing' }
BlTextInputBuffer >> hasPendingText [

	^ pendingText notNil
]

{ #category : 'enumerating' }
BlTextInputBuffer >> initialize [
	super initialize.
	
	inputs := OrderedCollection new.
	editingText := nil
]

{ #category : 'enumerating' }
BlTextInputBuffer >> reset [

	inputs removeAll.
	editingText := nil
]

{ #category : 'adding' }
BlTextInputBuffer >> text: aString modifiers: aBlKeyModifiers [

	editingText := pendingText := nil.
	inputs
		ifEmpty: [ inputs add: aString -> aBlKeyModifiers copy ]
		ifNotEmpty: [ :theInputs |
			theInputs last value = aBlKeyModifiers
				ifTrue: [ theInputs last key: theInputs last key , aString ]
				ifFalse: [ inputs add: aString -> aBlKeyModifiers copy ] ]
]

{ #category : 'enumerating' }
BlTextInputBuffer >> textInputEventsDo: aBlock [

	inputs do: [ :eachAssoc |
		aBlock value: (BlTextInputEvent new
				 text: eachAssoc key;
				 modifiers: eachAssoc value;
				 yourself) ].
	editingText ifNotNil: [
		aBlock value: (BlTextEditingEvent new
				 text: editingText;
				 modifiers: BlKeyModifiers new;
				 yourself).
		editingText := nil ]
]
