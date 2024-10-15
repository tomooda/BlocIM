Class {
	#name : 'BaselineOfBlocIM',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBlocIM',
	#package : 'BaselineOfBlocIM'
}

{ #category : 'baselines' }
BaselineOfBlocIM >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Bloc'
			with: [ spec repository: 'github://pharo-graphics/Bloc:v2.1.0/src' ].
		spec
			baseline: 'Album'
			with: [
			spec repository: 'github://pharo-graphics/Album:v0.2.0/src' ].
		spec package: #BlocIM with: [ spec requires: #( 'Bloc' 'Album' ) ].
		spec postLoadDoIt: #postload ]
]

{ #category : 'scripts' }
BaselineOfBlocIM >> postload [

	AeFontManager resetGlobalInstance
]
