"
I represent WebGL programs
"
Class {
	#name : #GLProgram,
	#superclass : #Object,
	#instVars : [
		'varyings',
		'currentProgramName',
		'defaultProgram',
		'attributes',
		'uniforms',
		'shaderProgram',
		'references',
		'classes',
		'webGL',
		'bufferType',
		'buffers'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Programs'
}

{ #category : #accessing }
GLProgram >> addObject: aGlObject [
	aGlObject initializeGL.
	(classes at: aGlObject class name ifAbsentPut: [ OrderedCollection new ]) add: aGlObject.

]

{ #category : #shaders }
GLProgram >> addShader: aShader [
	attributes addAll: aShader attributes keys.
	uniforms addAll: aShader uniforms keys.
	webGL attachShader: shaderProgram shader: (self compileShaderInContext: aShader).

]

{ #category : #buffers }
GLProgram >> arrayBuffer: name [
	bufferType := ARRAY_BUFFER.
	webGL bindBuffer: bufferType buffer: (buffers at: name).

]

{ #category : #buffers }
GLProgram >> bindElementBuffer: name [
	webGL bindBuffer: ELEMENT_ARRAY_BUFFER buffer: (buffers at: name).
]

{ #category : #shaders }
GLProgram >> compileShaderInContext: aShader [
	^ aShader compileWithGL: webGL andVarying: varyings.

]

{ #category : #buffers }
GLProgram >> createBuffer: name then: aBlock [
	| buffer |
	(buffers includesKey: name)
		ifFalse: [ self error: 'Buffer ',name,' already created' ].
	buffer := webGL createBuffer.
	buffers at: name put: buffer.
	aBlock value: buffer
]

{ #category : #shaders }
GLProgram >> drawDelta: deltaTime total: total [
	classes valuesDo: [: instances |
		instances first class setupForDraw: self.
		instances do: [: instance |
			instance drawDelta: deltaTime total: total.
	]].

]

{ #category : #buffers }
GLProgram >> elementArrayBuffer: name [
	bufferType := ELEMENT_ARRAY_BUFFER.
	webGL bindBuffer: bufferType buffer: (buffers at: name).

]

{ #category : #'webgl-methods' }
GLProgram >> enableVertexAttribArray: position [
	webGL enableVertexAttribArray: (self ref: position).
]

{ #category : #buffers }
GLProgram >> fillBuffer: positions [
	webGL bufferData: bufferType buffer: ((bufferType = ARRAY_BUFFER ifTrue: [Float32Array] ifFalse: [Uint16Array]) new: positions) kind: STATIC_DRAW.

]

{ #category : #initialization }
GLProgram >> initialize [
	super initialize.
	classes := Dictionary new.
	buffers := Dictionary new.
	references := Dictionary new.
	varyings := Dictionary new.
	attributes := OrderedCollection new.
	uniforms := OrderedCollection new.

]

{ #category : #accessing }
GLProgram >> isEmpty [
	^ classes isEmpty
]

{ #category : #shaders }
GLProgram >> linkProgram [
	| loc |
	webGL linkProgram: shaderProgram.
	(webGL getProgramParameter: shaderProgram parameter: LINK_STATUS) ifFalse: [
		self error: 'An error occurred compiling the shaders: ',(webGL getProgramInfoLog: shaderProgram)
	].
	attributes,uniforms do: [: name |
		loc := webGL getAttribLocation: shaderProgram named: name.
		loc = -1 ifTrue: [ self halt. ^ self error: 'Non-existent attribute ',name ].
		references at: name put: loc.
	].

]

{ #category : #buffers }
GLProgram >> point: position components: n [
	| pos |
	pos := (position isString ifTrue: [ self ref: position ] ifFalse: [ position ]).
	webGL vertexAttribPointer: pos
		numComponents: n
		type: FLOAT
		normalize: false
		stride: 0
		offset: 0.
	webGL enableVertexAttribArray: pos.

]

{ #category : #accessing }
GLProgram >> program [
	^ shaderProgram.

]

{ #category : #accessing }
GLProgram >> ref: position [
	^ position isString ifTrue: [ references at: position ] ifFalse: [ position ]
]

{ #category : #accessing }
GLProgram >> removeObject: aGlObject [
	classes at: aGlObject class name ifPresent: [ : instances |
		instances removeObject: aGlObject.
		instances isEmpty ifTrue: [
			classes remove: aGlObject class name ifAbsent: []].
	].

]

{ #category : #shaders }
GLProgram >> shaderProgram: aSP webGL: aWGL [
	shaderProgram := aSP.
	webGL := aWGL.

]

{ #category : #'webgl-methods' }
GLProgram >> uniformMatrix4fv: position matrix: matrix [
	webGL uniformMatrix4fv: (self ref: position)
		transpose: false
		matrix: matrix.
]

{ #category : #'webgl-methods' }
GLProgram >> uniformMatrix4fv: position transpose: bool matrix: matrix [
	webGL uniformMatrix4fv: (self ref: position)
		transpose: bool
		matrix: matrix.
]

{ #category : #'webgl-methods' }
GLProgram >> uniformiAt: position put: value [
	webGL uniform1i: (self ref: position) put: value
]

{ #category : #shaders }
GLProgram >> useProgram [
	webGL useProgram: shaderProgram.

]

{ #category : #shaders }
GLProgram >> varying: type named: name [ 
	varyings at: name put: type asGLType.
 
]

{ #category : #'webgl-methods' }
GLProgram >> vertexAttribPointer: position numComponents: n type: type normalize: bool stride: stride offset: offset [
	webGL vertexAttribPointer: (self ref: position)
		numComponents: n
		type: type
		normalize: bool
		stride: stride
		offset: offset
]
