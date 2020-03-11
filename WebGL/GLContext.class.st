"
I represent a WebGL context.

I render on a HTML Canvas - by default, called ""glCanvas""
"
Class {
	#name : #GLContext,
	#superclass : #Object,
	#instVars : [
		'gl',
		'shaderProgram',
		'references',
		'positionBuffer',
		'buffers',
		'bufferType',
		'varyings',
		'currentProgramName',
		'programs',
		'defaultProgram',
		'attributes',
		'uniforms'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #'webgl-methods' }
GLContext class >> attachShader: program shader: shader [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> bindBuffer: type buffer: buffer [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> bufferData: type buffer: buffer kind: kind [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> clear: bits [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> clearColor: r green: g blue: b alpha: a [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> clearDepth: aNumber [
	<pharoJsSkip>

]

{ #category : #'dom-methods' }
GLContext class >> clientHeight [
	<pharoJsSkip>

]

{ #category : #'dom-methods' }
GLContext class >> clientWidth [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> compileShader: shader [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> createBuffer [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> createProgram [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> createShader: type [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> deleteShader: shader [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> depthFunc: flag [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> drawArrays: type offset: offset vertexCount: count [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> drawingBufferHeight [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> drawingBufferWidth [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> enable: flag [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> enableVertexAttribArray: position [
	<pharoJsSkip>

]

{ #category : #'instance creation' }
GLContext class >> fromCanvas: canvas [
	^ super new fromCanvas: canvas
]

{ #category : #'webgl-methods' }
GLContext class >> getAttribLocation: program named: aString [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getContext: aString [
	<pharoJsSkip>

]

{ #category : #'dom-methods' }
GLContext class >> getElementById: selector [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getProgramInfoLog: program [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getProgramParameter: program parameter: parameter [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getShaderInfoLog: program [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getShaderParameter: program parameter: parameter [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getUniformLocation: program named: aString [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> linkProgram: program [
	<pharoJsSkip>

]

{ #category : #'instance creation' }
GLContext class >> new [
	^ self fromCanvas: #glCanvas
]

{ #category : #'glmatrix-methods' }
GLContext class >> perspective: radians
		aspect: ratio
		near: aNumber
		far: anotherNumber
		result: projectionMatrix [
	<pharoJsSkip>

]

{ #category : #'glmatrix-methods' }
GLContext class >> perspective: result
		fieldOfView: radians
		aspect: ratio
		near: aNumber
		far: anotherNumber [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> requestAnimationFrame: func [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> rotate: toMatrix
	from: fromMatrix
	rotation: rotation
	axis: axis [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> shaderSource: shader source: source [
	<pharoJsSkip>

]

{ #category : #'glmatrix-methods' }
GLContext class >> translate: toMat4 from: fromMat4 translation: anArray [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> uniformMatrix4fv: position transpose: bool matrix: matrix [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> useProgram: program [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> vertexAttribPointer: position numComponents: n type: type normalize: bool stride: stride offset: offset [
	<pharoJsSkip>

]

{ #category : #shaders }
GLContext >> addShader: aShader [
	attributes addAll: aShader attributes keys.
	uniforms addAll: aShader uniforms keys.
	gl attachShader: shaderProgram shader: (self compileShaderInContext: aShader).

]

{ #category : #'webgl-methods' }
GLContext >> animate: aBlock [
	| then render |
	then := 0.
	render := [: now | | deltaTime |
		deltaTime := now - then.
		then := now.
		aBlock value: deltaTime.
		window requestAnimationFrame: render.
	].
	window requestAnimationFrame: render.

]

{ #category : #buffers }
GLContext >> arrayBuffer: name [
	bufferType := ARRAY_BUFFER.
	gl bindBuffer: bufferType buffer: (buffers at: name).

]

{ #category : #accessing }
GLContext >> aspect [
	^ gl drawingBufferWidth / gl drawingBufferHeight
]

{ #category : #buffers }
GLContext >> bindElementBuffer: name [
	gl bindBuffer: ELEMENT_ARRAY_BUFFER buffer: (buffers at: name).
]

{ #category : #initialization }
GLContext >> camera [
	^ GLCamera new gl: self
]

{ #category : #'webgl-methods' }
GLContext >> clear [
	gl clear: COLOR_BUFFER_BIT | DEPTH_BUFFER_BIT.

]

{ #category : #shaders }
GLContext >> compileShaderInContext: aShader [
	^ aShader compileWithGL: gl andVarying: varyings.

]

{ #category : #buffers }
GLContext >> createBuffer: name [
	buffers at: name put: gl createBuffer
]

{ #category : #'webgl-methods' }
GLContext >> drawArrays: type offset: offset vertexCount: count [
	gl drawArrays: type offset: offset vertexCount: count.

]

{ #category : #'webgl-methods' }
GLContext >> drawElements: drawOp vertexCount: count type: type offset: offset [
	gl drawElements: drawOp vertexCount: count type: type offset: offset.

]

{ #category : #buffers }
GLContext >> elementArrayBuffer: name [
	bufferType := ELEMENT_ARRAY_BUFFER.
	gl bindBuffer: bufferType buffer: (buffers at: name).

]

{ #category : #'webgl-methods' }
GLContext >> enableVertexAttribArray: position [
	gl enableVertexAttribArray: (position isString ifTrue: [ self ref: position ] ifFalse: [ position ]).
]

{ #category : #buffers }
GLContext >> fillBuffer: positions [
	gl bufferData: bufferType buffer: ((bufferType = ARRAY_BUFFER ifTrue: [Float32Array] ifFalse: [Uint16Array]) new: positions) kind: STATIC_DRAW.

]

{ #category : #initialization }
GLContext >> fromCanvas: selector [
	| canvas |
	canvas := document getElementById: selector.
	gl := canvas getContext: #webgl.
	gl ifNil: [ ^ self error: 'Unable to initialize WebGL. Your browser or machine may not support it.' ].
	GLConstants loadConstants: gl.
	gl clearColor: 0 green: 0.3 blue: 0 alpha: 1.
	gl clearDepth: 1.
	gl enable: DEPTH_TEST.
	gl depthFunc: LEQUAL.

]

{ #category : #shaders }
GLContext >> initProgram [
	defaultProgram := defaultProgram + 1.
	^ self initProgramNamed: #defaultProgram, defaultProgram asString
]

{ #category : #shaders }
GLContext >> initProgramNamed: aString [
	currentProgramName := aString.
	shaderProgram := gl createProgram.
	programs at: currentProgramName put: shaderProgram.
	varyings := Dictionary new.
	references := Dictionary new.
	attributes := OrderedCollection new.
	uniforms := OrderedCollection new.

]

{ #category : #initialization }
GLContext >> initialize [
	super initialize.
	defaultProgram := 0.
	buffers := Dictionary new.
	programs := Dictionary new.

]

{ #category : #shaders }
GLContext >> linkProgram [
	gl linkProgram: shaderProgram.
	(gl getProgramParameter: shaderProgram parameter: LINK_STATUS) ifFalse: [
		^ self error: 'An error occurred compiling the shaders: ',(gl getProgramInfoLog: shaderProgram)
	].
	attributes do: [: name |
		references at: name put: (gl getAttribLocation: shaderProgram named: name)
	].
	uniforms do: [: name |
		references at: name put: (gl getUniformLocation: shaderProgram named: name)
	].

]

{ #category : #buffers }
GLContext >> point: position components: n [
	| pos |
	pos := (position isString ifTrue: [ self ref: position ] ifFalse: [ position ]).
	gl vertexAttribPointer: pos
		numComponents: n
		type: FLOAT
		normalize: false
		stride: 0
		offset: 0.
	gl enableVertexAttribArray: pos.

]

{ #category : #accessing }
GLContext >> ref: name [
	^ references at: name
]

{ #category : #'webgl-methods' }
GLContext >> uniformMatrix4fv: position matrix: matrix [
	gl uniformMatrix4fv: (position isString ifTrue: [ self ref: position ] ifFalse: [ position ])
		transpose: false
		matrix: matrix.
]

{ #category : #'webgl-methods' }
GLContext >> uniformMatrix4fv: position transpose: bool matrix: matrix [
	gl uniformMatrix4fv: (position isString ifTrue: [ self ref: position ] ifFalse: [ position ])
		transpose: bool
		matrix: matrix.
]

{ #category : #shaders }
GLContext >> useProgram [
	self useProgram: currentProgramName.

]

{ #category : #shaders }
GLContext >> useProgram: aString [
	gl useProgram: (programs at: aString).

]

{ #category : #shaders }
GLContext >> varying: type named: name [ 
	varyings at: name put: type asGLType.
 
]

{ #category : #'webgl-methods' }
GLContext >> vertexAttribPointer: position numComponents: n type: type normalize: bool stride: stride offset: offset [
	gl vertexAttribPointer: (position isString ifTrue: [ self ref: position ] ifFalse: [ position ])
		numComponents: n
		type: type
		normalize: bool
		stride: stride
		offset: offset
]
