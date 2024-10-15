Extension { #name : 'AeFontManager' }

{ #category : '*BlocIM' }
AeFontManager >> defaultEmojiFace [

	faceEntriesByFamilyName keysAndValuesDo: [ :name :fonts |
		(name includesSubstring: 'emoji') ifTrue: [
			^ fonts anyOne newFaceWith: freetypeLibrary ] ].
	^ nil
]

{ #category : '*BlocIM' }
AeFontManager >> defaultJapaneseFace [

	#( 'meiryo' 'ms pgothic' 'hiragino sans gb' ) do: [ :name |
		faceEntriesByFamilyName
			at: name
			ifPresent: [ :fonts | ^ fonts anyOne newFaceWith: freetypeLibrary ] ].
	^ nil
]

{ #category : '*BlocIM' }
AeFontManager class >> globalInstance [

	^ globalInstance ifNil: [
		  | aFace |
		  globalInstance := self new
			                    scanEmbeddedFonts;
			                    scanDefaultDirectories;
			                    yourself.

		  aFace := globalInstance defaultJapaneseFace ifNil: [
			           globalInstance
				           detectFamilyName: AeSourceSansPro_Regular familyName
				           slant: AeFontSlant normal
				           weight: AeFontWeight normal
				           stretch: AeFontStretch normal
				           ifNone: [ self error: 'Shouldn''t happen' ] ].

		  globalInstance defaultFace: aFace.

		  aFace := globalInstance defaultJapaneseFace ifNil: [
			           globalInstance
				           detectFamilyName: AeSourceCodePro_Regular familyName
				           slant: AeFontSlant normal
				           weight: AeFontWeight normal
				           stretch: AeFontStretch normal
				           ifNone: [ self error: 'Shouldn''t happen' ] ].

		  globalInstance defaultCodeFace: aFace.


		  globalInstance ]
]
