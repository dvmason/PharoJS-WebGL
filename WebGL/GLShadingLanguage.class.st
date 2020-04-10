"
I represent a program in OpenGL ES Shading Language.

I have methods to build, compile, attach, and link programs.
"
Class {
	#name : #GLShadingLanguage,
	#superclass : #Object,
	#instVars : [
		'attributes',
		'uniforms',
		'functions',
		'structs',
		'currentFunction'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'WebGL-Programs'
}

{ #category : #'as yet unclassified' }
GLShadingLanguage class >> formatDictionary: aCollection called: kind [
	| separator result |
	separator := ';
'.
	result := self formatDictionary: aCollection called: kind separator: separator.
	^ result = '' ifTrue: [''] ifFalse: [ result, separator ]
]

{ #category : #'as yet unclassified' }
GLShadingLanguage class >> formatDictionary: aCollection called: kind separator: separater [
	| result |
	result := OrderedCollection new.
	aCollection keysAndValuesDo: [: key : value |
			result addLast: kind,' ',value asString,' ',key
		].
	^ separater join: result
]

{ #category : #'as yet unclassified' }
GLShadingLanguage class >> formatFunctions: aCollection [ 
	^ '
' join: (aCollection collect: #asString)
]

{ #category : #construction }
GLShadingLanguage >> asString [
	^ self asString: Dictionary new
]

{ #category : #construction }
GLShadingLanguage >> asString: varyings [
	^ (GLShadingLanguage formatDictionary: structs called: #struct),
		(GLShadingLanguage formatDictionary: varyings called: #varying),
		(GLShadingLanguage formatDictionary: attributes called: #attribute),
		(GLShadingLanguage formatDictionary: uniforms called: #uniform),
		(GLShadingLanguage formatFunctions: functions)
]

{ #category : #construction }
GLShadingLanguage >> attribute: type named: name [
	attributes at: name put: type asGLType.

]

{ #category : #accessing }
GLShadingLanguage >> attributes [
	^ attributes
]

{ #category : #construction }
GLShadingLanguage >> code: aString [ 
	currentFunction code: aString.

]

{ #category : #construction }
GLShadingLanguage >> compileWithGL: gl andVarying: varyings [
	| shader msg source |
	shader := gl createShader: self shaderType.
	self halt.
	source := self asString: varyings.
	gl shaderSource: shader source: source.
	gl compileShader: shader.
	(gl getShaderParameter: shader parameter: COMPILE_STATUS)
		ifFalse: [ msg := 'An error occurred compiling the shader: '
				, (gl getShaderInfoLog: shader).
			gl deleteShader: shader.
			self error: msg ].
	^ shader
]

{ #category : #construction }
GLShadingLanguage >> function: name [
	self function: #void named: name.

]

{ #category : #construction }
GLShadingLanguage >> function: type named: name [
	currentFunction := GLFunction new name: name; type: type; yourself.
	functions add: currentFunction.

]

{ #category : #initialization }
GLShadingLanguage >> initialize [
	super initialize.
	attributes := Dictionary new.
	uniforms := Dictionary new.
	functions := OrderedCollection new.
	structs := Dictionary new.


]

{ #category : #construction }
GLShadingLanguage >> local: type named: name [
	currentFunction local: type named: name.

]

{ #category : #accessing }
GLShadingLanguage >> shaderType [
	^ self subclassResponsibility
]

{ #category : #construction }
GLShadingLanguage >> uniform: type named: name [
	uniforms at: name put: type asGLType.

]

{ #category : #accessing }
GLShadingLanguage >> uniforms [
	^ uniforms
]
