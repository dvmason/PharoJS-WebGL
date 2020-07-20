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
		'currentFunction',
		'suffix',
		'varyings'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Programs'
}

{ #category : #'as yet unclassified' }
GLShadingLanguage class >> formatDictionary: aCollection called: kind separator: separater suffix: suffix [
	| result |
	result := OrderedCollection new.
	aCollection keysAndValuesDo: [: key : value |
			result addLast: kind,' ',value asString,' ',key,suffix
		].
	^ separater join: result
]

{ #category : #'as yet unclassified' }
GLShadingLanguage class >> formatDictionary: aCollection called: kind suffix: suffix [
	| separator result |
	separator := ';
'.
	result := self formatDictionary: aCollection called: kind separator: separator suffix: suffix.
	^ result = '' ifTrue: [''] ifFalse: [ result, separator ]
]

{ #category : #'as yet unclassified' }
GLShadingLanguage class >> formatFunctions: aCollection [ 
	^ '
' join: (aCollection collect: #asString)
]

{ #category : #converting }
GLShadingLanguage >> asString [
	^ (GLShadingLanguage formatDictionary: structs called: #struct suffix: suffix),
		(GLShadingLanguage formatDictionary: varyings called: #varying suffix: suffix),
		(GLShadingLanguage formatDictionary: attributes called: #attribute suffix: suffix),
		(GLShadingLanguage formatDictionary: uniforms called: #uniform suffix: suffix),
		(GLShadingLanguage formatFunctions: functions)
]

{ #category : #construction }
GLShadingLanguage >> assign: aString equals: anObject [
	currentFunction code: (self maybeAddSuffix: aString),' = ',(self maybeAddSuffix: anObject).

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
GLShadingLanguage >> compileWithGL: gl andVarying: xxxvaryings [
	| shader msg source |
	gl log: #createShader:.
	shader := gl createShader: self shaderType.
	source := self asString.
	gl log: #shaderSource:.
	console log: source.
	gl shaderSource: shader source: source.
	gl log: #compileShader:.
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

{ #category : #converting }
GLShadingLanguage >> maybeAddSuffix: anObject [
	^ self maybeAddSuffix: anObject nested: false
]

{ #category : #converting }
GLShadingLanguage >> maybeAddSuffix: anObject nested: isNested [ 
	| result needOperator needSpace |
	anObject isString ifTrue: [
		(self ref: anObject) ifNil: [ ^ anObject ].
		^ anObject,suffix
	].
	anObject isNumber ifTrue: [ ^ anObject asString ].
	needOperator := needSpace := false.
	result := isNested ifTrue: [ '(' ] ifFalse: [ '' ].
	anObject do: [: each |
		needSpace ifTrue: [ needOperator & isNested ifFalse: [ result := result,' ']].
		(each isString and: [ each first isLetter not ]) ifTrue: [
				needOperator := false. needSpace := true
			] ifFalse: [
				needOperator & isNested ifTrue: [ result := result,',' ].
				needOperator := needSpace := true
		].
		result := result,(self maybeAddSuffix: each nested: true).
	].
	^ isNested ifTrue: [ result,')' ] ifFalse: [ result ].
]

{ #category : #accessing }
GLShadingLanguage >> ref: aString [ 
	^ uniforms at: aString ifAbsent: [ attributes at: aString ifAbsent: [ varyings at: aString ifAbsent: [ nil ]]]
]

{ #category : #accessing }
GLShadingLanguage >> shaderType [
	^ self subclassResponsibility
]

{ #category : #accessing }
GLShadingLanguage >> suffix: aString varyings: aCollection [
	suffix := aString.
	varyings := aCollection.

]

{ #category : #construction }
GLShadingLanguage >> uniform: type named: name [
	uniforms at: name put: type asGLType.

]

{ #category : #accessing }
GLShadingLanguage >> uniforms [
	^ uniforms
]
