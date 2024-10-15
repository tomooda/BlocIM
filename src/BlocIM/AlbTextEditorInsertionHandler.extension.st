Extension { #name : 'AlbTextEditorInsertionHandler' }

{ #category : '*BlocIM' }
AlbTextEditorInsertionHandler >> eventsToHandle [

	^ {
		  BlTextInputEvent.
		  BlTextEditingEvent }
]

{ #category : '*BlocIM' }
AlbTextEditorInsertionHandler >> insert: aString atCursorIn: anEditor context: anElement [
	anEditor surroundMap
		closingFor: aString asSymbol
		ifPresent: [ :aSurroundSymbol |
			anEditor inserter
				context: anElement;
				inputFilter: anEditor inputFilter;
				atCursor;
				string: aString;
				surroundings: anEditor surroundMap;
				withoutSelectionDelete;
				insert ]
		ifAbsent: [
			anEditor inserter
				context: anElement;
				inputFilter: anEditor inputFilter;
				atCursor;
				string: aString;
				surroundings: anEditor surroundMap;
				insert ]
]

{ #category : '*BlocIM' }
AlbTextEditorInsertionHandler >> swapSelection: aString atCursorIn: anEditor context: anElement [

	| position |
	anEditor selection ifNotEmpty: [ :selection |
		anEditor
			delete: selection from to: selection to;
			moveCursorTo: selection from;
			selection: BlCompositeSelection new ].
	position := anEditor cursor position.
	anEditor
		insertString: aString at: position;
		select: position to: position + aString size.
	anEditor moveCursorTo: position + aString size
]

{ #category : '*BlocIM' }
AlbTextEditorInsertionHandler >> textEditingEvent: anEvent [

	anEvent consume.
	self
		swapSelection: anEvent text asString
		atCursorIn: anEvent currentTarget editor
		context: anEvent currentTarget
]
